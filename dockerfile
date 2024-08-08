# Use the official Debian image as the base image
FROM ubuntu:noble

# Install necessary packages
RUN apt-get update && \
    apt-get install -y gnupg2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the Ondřej Surý PHP PPA repository
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C && \
    add-apt-repository "deb http://ppa.launchpad.net/ondrej/php/ubuntu noble main"
RUN apt-get update && \
    apt-get install -y nginx php8.3-fpm php8.3-mysql php8.3-curl php8.3-gd php8.3-mbstring php8.3-xml php8.3-zip php8.3-intl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create directories for nginx logs and the default web root
# RUN mkdir -p /var/log/nginx && \
#     mkdir -p /var/www/html

# Copy Nginx configuration file
# COPY site.conf /etc/nginx/sites-enabled/site.conf

# Install supervisord
RUN apt-get update && \
    apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/*
# Copy supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf



# Expose ports
EXPOSE 80

# Start Nginx and PHP-FPM services
#CMD ["nginx", "-g", "daemon off;"]
# Start supervisord to manage processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
