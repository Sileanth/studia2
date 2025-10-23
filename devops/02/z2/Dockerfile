

FROM ubuntu:22.04


COPY ./publik /root/.ssh/authorized_keys

RUN apt-get update && apt-get install -y openssh-server iproute2

RUN mkdir -p /run/sshd

RUN echo "\nPermitRootLogin yes\n" >> /etc/ssh/sshd_config

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]
