FROM debian:latest

ARG ROOT_PASSWORD
ENV ROOT_PASSWORD=$ROOT_PASSWORD

RUN apt-get update && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && echo 'root:$ROOT_PASSWORD' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]