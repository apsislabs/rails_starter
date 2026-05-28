import js from "@eslint/js";
import importX from "eslint-plugin-import-x";
import tseslint from "typescript-eslint";

export default tseslint.config(
  js.configs.recommended,
  tseslint.configs.recommended,
  importX.flatConfigs.recommended,
  importX.flatConfigs.typescript,
  {
    ignores: ["node_modules/", "public/"],
  },
);
