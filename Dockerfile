FROM node:9.11.1-slim
ENV DEBIAN_FRONTEND noninteractive
ADD *.txt /tmp/
ADD docker-setup.sh /tmp/
RUN cd /tmp && ./docker-setup.sh
WORKDIR /root

