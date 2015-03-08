# Nginx Dockerfile
#
# https://github.com/oscerd/nginx

# Pull base image.
FROM oscerd/ubuntu
MAINTAINER Andrea Cosentino <ancosen1985@yahoo.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update 
RUN add-apt-repository -y ppa:nginx/development && apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Set mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443

# Define default command.
CMD ["nginx"]
