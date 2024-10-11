// src/controllers/test_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  declare readonly nameTarget: HTMLInputElement;

  greet() {
    const element = this.nameTarget;
    const name = element.value;
    console.log(`Hello, ${name}!`);
  }
}