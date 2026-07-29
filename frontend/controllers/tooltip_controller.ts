import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];
  declare readonly contentTarget: HTMLElement;

  connect() {
    this.element.addEventListener("mouseenter", this.show);
    this.element.addEventListener("mouseleave", this.hide);
    this.element.addEventListener("focusin", this.show);
    this.element.addEventListener("focusout", this.hide);
  }
  disconnect() {
    this.element.removeEventListener("mouseenter", this.show);
    this.element.removeEventListener("mouseleave", this.hide);
    this.element.removeEventListener("focusin", this.show);
    this.element.removeEventListener("focusout", this.hide);
  }
  show = () => this.contentTarget.classList.remove("hidden");
  hide = () => this.contentTarget.classList.add("hidden");
}
