# Sample Dockerfile for installing MongoDB on an Ubuntu 14.04 server
# https://github.com/atbaker/mongo-example

# Use the Trusty (14.04) Ubuntu base image
FROM ubuntu:14.04

# Optionally set the maintainer
MAINTAINER Andrew T. Baker <andrew.tork.baker@gmail.com>

# Following installation instructions from https://nodejs.org/en/download/package-manager/
RUN sudo apt-get update

RUN sudo apt-get -y install curl

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN sudo apt-get install -y nodejs

RUN sudo apt-get install -y build-essential

# Following installation instructions from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# Import the MongoDB public GPG key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Create a list file for MongoDB
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

# Update the local package database
RUN apt-get update

# Install the latest stable version of MongoDB (note -y flag for non-interactive)
RUN apt-get install -y mongodb-org

# Create MongoDB's default data directory (-p creates parent directories - in this case, /data)
RUN mkdir -p /data/db

# Because this database will run in a Docker container,
# we must configure it to accept connctions from foreign hosts
RUN echo "bind_ip = 0.0.0.0" >> /etc/mongodb.conf

RUN mkdir /usr/local/node_project
COPY index.js /usr/local/node_project/index.js

# Expose the MongoDB port
EXPOSE 27017 80 443 8081

# Set the default command for this image
CMD ["node","/usr/local/node_project/index.js"]
