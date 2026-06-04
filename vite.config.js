
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
// import VueDevTools from 'web-plugin-vue-devtools' <--- Comment out or remove this line

export default defineConfig({
  plugins: [
    vue(),
    // VueDevTools(), <--- Comment out or remove this line from your running plugins list
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
