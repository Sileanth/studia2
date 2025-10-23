


FROM ubuntu:latest AS build


RUN apt-get update && apt-get install openssl

RUN openssl req -newkey rsa:2048 -nodes -keyout /tmp/server.key -out /tmp/server.csr -subj "/CN=siema.pl"

RUN --mount=secret,id=ca_key
