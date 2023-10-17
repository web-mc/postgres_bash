FROM ubuntu:22.04

RUN apt update && apt install lsb-core -y
RUN apt install openssh-client nano -y
# RUN apt install nano -y
# RUN apt install systemctl -y

CMD [ "/bin/bash" ]