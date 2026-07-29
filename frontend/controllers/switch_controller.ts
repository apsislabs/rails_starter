import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { state: String };
  static targets = ["input"];
  declare stateValue: string;
  declare readonly hasInputTarget: boolean;
  declare readonly inputTarget: HTMLInputElement;

  toggle(event: Event) {
    event.preventDefault();
    const checked = this.stateValue !== "checked";
    this.stateValue = checked ? "checked" : "unchecked";
    (this.element as HTMLElement).dataset.state = this.stateValue;
    this.element.setAttribute("aria-checked", String(checked));
    if (this.hasInputTarget) this.inputTarget.disabled = !checked;
  }
}
