import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

export default defineConfig({
    plugins: [vue()],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src'),
        },
    },
    server: {
        host: '0.0.0.0',
        port: 5173,
        strictPort: true,
        watch: { usePolling: true },
        proxy: {
            '/api': {
                target: 'http://lucky-backend-dev:3000',
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/api/, '/api')
            },
        },
    },
})