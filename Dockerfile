FROM ubuntu

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y openssh-server && \
    apt install -y vim && \
    apt install -y sudo 

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 goldenspear

RUN echo 'goldenspear:ansible' | chpasswd

RUN service ssh start

EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"]



