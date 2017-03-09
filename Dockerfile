# Minimal Discord Rainbowbot Docker container for Pterodactyl Panel
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

#Install nodeJS to Linux Container
RUN sudo apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

#Add container user
RUN useradd -m -d /home/container container

#Set container environment
USER container
ENV  HOME /home/container

# Create app directory
RUN mkdir -p /home/container/app
WORKDIR /home/container/app

# Install app dependencies
COPY package.json /home/container/app/
RUN npm install

# Bundle app source
COPY . /home/container/app

#Start the bot
CMD [ "npm", "start" ]
