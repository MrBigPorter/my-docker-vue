# 构建阶段 打包静态资源
FROM node:20-alpine AS builder

# 设置工作目录
WORKDIR /work

# 拷贝依赖包
COPY package*.json ./
RUN npm install

# 拷贝应用代码
COPY . .

# 构建应用静态文件js css images
RUN npm run build

#  2) 运行阶段：用 Nginx 提供静态站点
FROM nginx:alpine AS runner

WORKDIR /app

COPY --from=builder /work/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
