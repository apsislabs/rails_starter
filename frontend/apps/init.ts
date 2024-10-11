import { ElementType } from "react";
import { Didact, registerApps } from "../lib/Didact";

export const initDidact = () => {
  const didact = new Didact();
  const apps: Record<string, ElementType> = import.meta.glob("./**/*App.{jsx,tsx}", { eager: true });

  registerApps(didact, apps);
  didact.start();

  return didact;
};
