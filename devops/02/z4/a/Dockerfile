
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y curl
# każda kolejna komenda robi nowa warstwe obrazu która może być cachowana, wiec curl niekoniecznie zainstaluje najnowsza wersje bo update jest cached
# RUN apt-get update && apt-get install -y curl
