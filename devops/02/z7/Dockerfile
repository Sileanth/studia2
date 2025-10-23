FROM ubuntu:latest
RUN groupadd -r smok && useradd --no-log-init -r -g smok smok
COPY smok.sh /home/smok/smok.sh
RUN chmod +x /home/smok/smok.sh
# RUN chown smok /home/smok/smok.sh
USER smok
WORKDIR /home/smok
CMD ./smok.sh
