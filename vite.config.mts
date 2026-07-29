import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import Rails from "vite-plugin-rails";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  server: {
    allowedHosts: ['vite']
  },
  plugins: [
    tailwindcss(),
    react(),
    Rails({
      envVars: {
        RAILS_ENV: "development",
        DISPLAY_ENV: "development",
      },
      fullReload: {
        additionalPaths: ["config/routes.rb", "app/views/**/*"],
        delay: 300,
      },
    }),
  ],
});
