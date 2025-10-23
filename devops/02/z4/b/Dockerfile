# https://docs.docker.com/build/building/best-practices/#env


FROM alpine
ENV ADMIN_USER="mark"
# ARG ADMIN_USER="mark" # ARG ustawia zmienne dostepne tylko w trakcie budowania obrazu
RUN echo $ADMIN_USER > ./mark
# ta komenda usuwa tę zmienną tylko z shella dla danej komendy run
RUN unset ADMIN_USER

# w konsekwencji zmienna jest dalej dostepna w uruchumionym kontenerze
cmd echo $ADMIN_USER


# FROM alpine
# RUN export ADMIN_USER="mark" \
#     && echo $ADMIN_USER > ./mark \
#     && unset ADMIN_USER
# CMD echo $ADMIN_USER

