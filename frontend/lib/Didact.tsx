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
export const registerApps = (app: Didact, glob: Record<string, any>) => {
  const definitions = Object.entries(glob)
    .map(([path, componentModule]) => {
      const name = identifierForGlobKey(path);
      const component = (componentModule as any).default ?? componentModule;

      if (name && typeof component === "function") {
        return { name, component };
      }
    })
    .filter(Boolean) as AppDefinition[];

  app.load(definitions);
};

export class Didact {
  cache: Map<Element, Root> = new Map();
  componentLibrary: Map<string, any> = new Map();

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

  register(component: any, name: string) {
    this.componentLibrary.set(name, component);
  }

  render() {
    [...this.componentLibrary].map(([appName, appComponent]) => {
      const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
          mutation.addedNodes.forEach((node) => {
            if (node instanceof Element) {
              this.mount(appName, node, appComponent);
            }
          });

          mutation.removedNodes.forEach((node) => {
            if (node instanceof Element) {
              this.unmount(appName, node);
            }
          });
        });
      });

      observer.observe(document, {
        childList: true,
        subtree: true,
      });

      document.addEventListener("unload", () => {
        observer.disconnect();
        this.unmountAll();
      });

      this.mount(appName, document.body, appComponent);
    });
  }

  getAppNodes(appName: string, el: Element) {
    return el.querySelectorAll(`[data-app='${appName}']`);
  }

  mount(appName: string, el: Element, Component: React.ElementType) {
    const appNodes = this.getAppNodes(appName, el);

    appNodes.forEach((n) => {
      if (!this.cache.has(n)) {
        const root = createRoot(n);

        root.render(
          <StrictMode>
            <Component />
          </StrictMode>,
        );

        this.cache.set(n, root);
      }
    });
  }

  unmount(appName: string, el: Element) {
    const appNodes = this.getAppNodes(appName, el);

    appNodes.forEach((n) => {
      if (this.cache.has(n)) {
        this.cache.get(n)?.unmount();
        this.cache.delete(n);
      }
    });
  }

  unmountAll() {
    for (const [node, root] of this.cache) {
      root.unmount();
      this.cache.delete(node);
    }
  }
}

// Utility function for awaiting dom ready event
function domReady() {
  return new Promise<void>((resolve) => {
    if (document.readyState == "loading") {
      document.addEventListener("DOMContentLoaded", () => resolve());
    } else {
      resolve();
    }
  });
}
