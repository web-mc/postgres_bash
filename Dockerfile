FROM ubuntu:22.04

RUN apt update && apt install lsb-core -y

CMD [ "/bin/bash" ]