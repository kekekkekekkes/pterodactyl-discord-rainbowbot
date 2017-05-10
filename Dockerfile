# ----------------------------------
# Pterodactyl NodeJS Dockerfile
# Environment: Node
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM node:latest

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

RUN apk update \
    && apk upgrade \
    && adduser -D -h /home/container container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./config.json /home/container/config.json
COPY ./package.json /home/container/package.json
COPY ./server.js /home/container/server.js

CMD ["/bin/bash", "/entrypoint.sh"]
