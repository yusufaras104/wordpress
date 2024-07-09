# Use the official WordPress image as the base image
FROM wordpress:latest

# Install the PHP SOAP extension
RUN apt-get update && apt-get install -y libxml2-dev && docker-php-ext-install soap

# Copy any custom configuration files (if necessary)
COPY ./wordpress/php.ini/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Copy the rest of your WordPress files (if necessary)
COPY ./wordpress_files /var/www/html

