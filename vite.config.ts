import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import Rails from "vite-plugin-rails";

export default defineConfig({
  plugins: [
    react(),
    Rails({
      envVars: {
        RAILS_ENV: "development",
        DISPLAY_ENV: "development",
      },
      fullReload: {
        additionalPaths: [],
      },
    }),
  ],
});
