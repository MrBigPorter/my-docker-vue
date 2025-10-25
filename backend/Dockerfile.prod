# 构建阶段
FROM node:20-alpine AS builder
WORKDIR /work

# 复制依赖清单
COPY package*.json ./
# 安装依赖 锁定npm版本(团队一致性)，清理缓存
RUN npm i -g npm@10 && npm ci --prefer-offline --no-audit --no-fund

# 复制应用代码源码
COPY . .
# 如果用了 @nestjs/cli 脚本构建即可；产出 dist/
RUN npm run build


# 运行阶段
FROM node:20-alpine AS runner
WORKDIR /app

# 仅复制运行需要的文件
COPY --from=builder /work/package*.json ./
# 安装仅生产依赖 清除缓存 ci 安装干净版本，omit 去掉开发包。
# --omit=dev 省略开发依赖 跳过 "devDependencies"
RUN npm ci --omit=dev --prefer-offline --no-audit --no-fund \
    && npm cache clean --force
# 复制构建产物
COPY --from=builder /work/dist ./dist

# （可选）复制运行所需的配置/静态文件，如 prisma、public 等
# COPY --from=builder /work/prisma ./prisma

# 非 root 运行更安全
RUN addgroup -S app && adduser -S app -G app
USER app

# 环境变量
ENV NODE_ENV=production
EXPOSE 3000

# 启动应用
CMD ["node", "dist/main.js"]
