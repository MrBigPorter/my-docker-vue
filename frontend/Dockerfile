# 构建阶段 用 Alpine 或更小镜像
FROM node:20-alpine AS builder
WORKDIR /work

# 只是复制依赖清单，最大缓存命中 *hash不变就直接跳过
COPY package*.json ./
# 安装依赖 锁定npm版本(团队一致性)，清理缓存
RUN npm i -g npm@10 && npm ci --prefer-offline --no-audit --no-fund

# 复制应用代码源码
COPY . .
# 构建应用 静态文件 js css images，输出到 dist 目录
RUN npm run build


# 运行阶段 Nginx 提供静态站点
FROM nginx:alpine AS runner
# 用自己的 Nginx 配置覆盖默认配置（含 SPA 重写 & /api 反代 & 压缩）
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 复制产物到 Nginx 静态资源目录
COPY --from=builder /work/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]