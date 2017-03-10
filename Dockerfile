# Minimal Discord Rainbowbot Docker container for Pterodactyl Panel
FROM node:latest

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

#Add container user
RUN useradd -m -d /home/container container

#Set container environment
USER container
ENV  HOME /home/container

# Create app directory
WORKDIR /home/container

#Copy over files from Git Repo
COPY ./package.json /home/container/package.json
COPY ./server.js /home/container/server.js
COPY ./config.json /home/container/config.json
COPY ./LICENSE /home/container/LICENSE
COPY ./README.md /home/container/README.md

# Install app dependencies
RUN npm install

#Start the bot
CMD ["npm", "start"]
