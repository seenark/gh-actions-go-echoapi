import { defineConfig } from 'tsdown'

export default defineConfig({
  entry: ['./src/main.ts'],
  outDir: "dist",
  unbundle: false,
  format: "esm",
  clean: true,
  minify: false,
  external: []
})
