docker build --tag danger .
docker rm danger
docker run --mount type=bind,src="/flag",target=/flag --name danger danger 
