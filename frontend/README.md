# 启动所有服务
docker compose up --build

# 进入前端容器
docker compose exec frontend sh

# 进入后端容器
docker compose exec backend sh

# 进入数据库
docker compose exec db psql -U lucky -d lucky_db