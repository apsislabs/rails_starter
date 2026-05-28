import { StrictMode } from "react";
import { createRoot, Root } from "react-dom/client";

type AppDefinition = { name: string; component: React.ElementType };

const APP_FILENAME_REGEX = /^(?:.*?(?:apps)\/|\.?\.\/)?(.+)(\..+?)$/;
const identifierForGlobKey = (key: string): string | undefined => {
  const logicalName = (key.match(APP_FILENAME_REGEX) || [])[1];
  if (logicalName) return logicalName;
};

// Utility for registering apps from a vite import glob;
// this will parse the import path key into a valid name,
// and then use the default export from the module as the
// react component.
export const registerApps = (app: Didact, glob: Record<string, unknown>) => {
  const definitions = Object.entries(glob)
    .map(([path, componentModule]) => {
      const name = identifierForGlobKey(path);
      const component =
        (componentModule as { default?: React.ElementType }).default ??
        componentModule;

      if (name && typeof component === "function") {
        return { name, component };
      }
    })
    .filter(Boolean) as AppDefinition[];

  app.load(definitions);
};

export class Didact {
  private cache: Map<Element, Root> = new Map();
  private componentLibrary: Map<string, unknown> = new Map();

  static init() {
    return new Didact();
  }

  async start() {
    await domReady();
    console.debug("[didact] starting...");
    this.render();
    console.debug("[didact] started.");
  }

  load(apps: AppDefinition[]) {
    apps.forEach((app) => this.register(app.component, app.name));
  }

  register(component: unknown, name: string) {
    this.componentLibrary.set(name, component);
  }

  render() {
    const observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          if (node instanceof Element) {
            for (const [name, comp] of this.componentLibrary) {
              try {
                this.mount(name, node, comp as React.ElementType);
              } catch (e) {
                console.error(`[didact] error mounting "${name}"`, e);
              }
            }
          }
        });

        mutation.removedNodes.forEach((node) => {
          if (node instanceof Element) {
            for (const [name] of this.componentLibrary) {
              this.unmount(name, node);
            }
          }
        });
      });
    });

    observer.observe(document, { childList: true, subtree: true });

    document.addEventListener("pagehide", () => {
      observer.disconnect();
      this.unmountAll();
    });

    for (const [name, comp] of this.componentLibrary) {
      this.mount(name, document.body, comp as React.ElementType);
    }
  }

  getAppNodes(appName: string, el: Element) {
    const descendants = [
      ...el.querySelectorAll(`[data-app='${appName}']`),
    ];
    if (el.matches(`[data-app='${appName}']`)) descendants.unshift(el);
    return descendants;
  }

  mount(appName: string, el: Element, Component: React.ElementType) {
    const appNodes = this.getAppNodes(appName, el);

    appNodes.forEach((n) => {
      if (!this.cache.has(n)) {
        const props: Record<string, string> = {};
        for (let i = 0; i < n.attributes.length; i++) {
          const attr = n.attributes[i];
          if (attr.name.startsWith("data-") && attr.name !== "data-app") {
            const propName = attr.name
              .slice(5)
              .replace(/-([a-z])/g, (_, letter) => letter.toUpperCase());
            props[propName] = attr.value;
          }
        }

        const root = createRoot(n);
        try {
          root.render(
            <StrictMode>
              <Component {...props} />
            </StrictMode>,
          );
          this.cache.set(n, root);
        } catch (e) {
          root.unmount();
          throw e;
        }
      }
    });
  }

  unmount(appName: string, el: Element) {
    const appNodes = this.getAppNodes(appName, el);

    appNodes.forEach((n) => {
      if (this.cache.has(n)) {
        try {
          this.cache.get(n)?.unmount();
        } finally {
          this.cache.delete(n);
        }
      }
    });
  }

  unmountAll() {
    try {
      for (const root of this.cache.values()) {
        try {
          root.unmount();
        } catch (e) {
          console.error("[didact] error unmounting root", e);
        }
      }
    } finally {
      this.cache.clear();
    }
  }
}

function domReady() {
  return new Promise<void>((resolve) => {
    if (document.readyState == "loading") {
      document.addEventListener("DOMContentLoaded", () => resolve());
    } else {
      resolve();
    }
  });
}
