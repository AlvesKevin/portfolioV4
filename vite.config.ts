import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

export default defineConfig(({ mode }) => {
  // Charger les variables d'environnement selon le mode
  const env = loadEnv(mode, process.cwd(), '')
  
  // Récupérer les variables d'environnement avec fallback
  const nocodbToken = process.env.VITE_NOCODB_API_TOKEN || env.VITE_NOCODB_API_TOKEN
  const nocodbUrl = process.env.VITE_NOCODB_URL || env.VITE_NOCODB_URL
  
  return {
    plugins: [vue()],
    resolve: {
      alias: {
        '@': path.resolve(__dirname, './src'),
        'vue': '/node_modules/vue/dist/vue.esm-bundler.js'
      }
    },
    build: {
      target: 'es2015',
      minify: 'esbuild',
      cssCodeSplit: true,
      rollupOptions: {
        output: {
          manualChunks: {
            'vendor': ['vue', 'gsap'],
          },
          entryFileNames: 'assets/[name].[hash].js',
          chunkFileNames: 'assets/[name].[hash].js',
          assetFileNames: 'assets/[name].[hash][extname]'
        }
      }
    },
    optimizeDeps: {
      include: ['vue']
    },
    server: {
      host: true,
      port: 3000
    },
    // Exposer explicitement les variables d'environnement
    define: {
      'import.meta.env.VITE_NOCODB_API_TOKEN': JSON.stringify(nocodbToken),
      'import.meta.env.VITE_NOCODB_URL': JSON.stringify(nocodbUrl)
    }
  }
})
