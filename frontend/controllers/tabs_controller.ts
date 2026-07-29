import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "panel"];
  declare readonly tabTargets: HTMLButtonElement[];
  declare readonly panelTargets: HTMLElement[];

  select(event: Event) {
    this.activate(event.currentTarget as HTMLButtonElement);
  }

  navigate(event: KeyboardEvent) {
    if (!["ArrowLeft", "ArrowRight", "Home", "End"].includes(event.key)) return;
    event.preventDefault();
    const current = this.tabTargets.indexOf(event.currentTarget as HTMLButtonElement);
    const next =
      event.key === "Home"
        ? 0
        : event.key === "End"
          ? this.tabTargets.length - 1
          : (current + (event.key === "ArrowRight" ? 1 : -1) + this.tabTargets.length) % this.tabTargets.length;
    this.activate(this.tabTargets[next]);
  }

  private activate(tab: HTMLButtonElement) {
    this.tabTargets.forEach((item, index) => {
      const active = item === tab;
      item.setAttribute("aria-selected", String(active));
      item.tabIndex = active ? 0 : -1;
      this.panelTargets[index].hidden = !active;
    });
    tab.focus();
  }
}
