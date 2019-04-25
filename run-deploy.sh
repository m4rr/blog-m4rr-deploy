git pull
# docker-compose build --no-cache
# docker stop nginx-proxy
# docker-compose down && docker-compose up -d
# docker network connect blogm4rrdeploy_default nginx-proxy
# docker start nginx-proxy

docker-compose up --build -d
