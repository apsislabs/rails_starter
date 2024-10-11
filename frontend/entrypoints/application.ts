import { Application } from "@hotwired/stimulus";
import { initDidact } from "../apps/init";
import { initStimulus } from "../controllers/init";
import { Didact } from "../lib/Didact";

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
