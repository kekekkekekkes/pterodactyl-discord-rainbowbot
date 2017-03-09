# Minimal Discord Rainbowbot Docker container for Pterodactyl Panel
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

#Install nodeJS to Linux Container
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x
RUN apt-get install -y nodejs npm

#Add container user
RUN useradd -m -d /home/container container

#Set container environment
USER container
ENV  HOME /home/container

# Create app directory
WORKDIR /home/container

#Copy over files from Git Repo
COPY ./package.json /package.json
COPY ./server.js /server.js
COPY ./config.json /config.json
COPY ./LICENSE /LICENSE
COPY ./README.md /README.md

# Install app dependencies
RUN npm install

#Start the bot
CMD ["/bin/bash", "npm start"]
