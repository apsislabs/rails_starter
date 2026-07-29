import "./application.css";

import { Application } from "@hotwired/stimulus";
// @rails/ujs exposes a default export through its ESM build.
// eslint-disable-next-line import-x/default
import Rails from "@rails/ujs";
import { initDidact } from "../apps/init";
import { initStimulus } from "../controllers/init";
import { Didact } from "../lib/Didact";

Rails.start();

declare global {
  interface Window {
    Stimulus: Application;
    Didact: Didact;
  }
}

const main = () => {
  console.log("Vite ⚡️ Rails");

  window.Stimulus = initStimulus();
  window.Didact = initDidact();
};

document.addEventListener("DOMContentLoaded", () => main());
