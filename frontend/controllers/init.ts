import { Application } from "@hotwired/stimulus";
import { registerControllers } from "stimulus-vite-helpers";


export const initStimulus = () => {
  const app = new Application();
  const controllers = import.meta.glob("./**/*_controller.{js,ts}", { eager: true });

  registerControllers(app, controllers);
  app.start();

  return app;
}