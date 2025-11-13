docker run -d --name a1 ubuntu:latest sleep infinity
docker exec a1 apt update
docker exec a1 apt install -y sudo python3 make gcc g++

docker run -d --name a2 ubuntu:latest sleep infinity
docker exec a2 apt update
docker exec a2 apt install -y sudo python3 make gcc g++
