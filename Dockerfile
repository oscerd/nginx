#
# Nginx Dockerfile
#
# https://github.com/oscerd/nginx
#

# Pull base image.

FROM oscerd/ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update 
RUN add-apt-repository -y ppa:nginx/development && apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80

# Define default command.
CMD ["nginx"]
