import { defineConfig } from 'tsdown'

export default defineConfig({
  entry: ['./src/main.ts'],
  outDir: "dist",
  outputOptions: {
    format: "esm"
  }
})
