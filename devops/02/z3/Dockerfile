

FROM ubuntu:latest AS build

RUN apt-get update && apt-get install -y g++

WORKDIR /src
COPY ./main.cpp .

RUN g++ ./main.cpp -o /bin/main


FROM ubuntu:latest

# COPY --from=0 /bin/main /bin/main
COPY --from=build /bin/main /bin/main
CMD [ "/bin/main" ]
