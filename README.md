# dockerized_robots
This repo contains docker starter scripts for distributed systems laboratory at HAW Hamburg

## to start two servers with dns on 192.168.2.111
```bash
docker build -f Dockerfile_server -t server .
./startContainers.sh 2 192.168.2.111 localhost 30000
```
