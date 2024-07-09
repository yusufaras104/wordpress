FROM wordpress:latest

# Copy custom configuration files
COPY wordpress/apache.conf /etc/apache2/conf-available/servername.conf
COPY wordpress/php.ini/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Enable Apache modules and configurations
RUN a2enmod rewrite && a2enconf servername

# Add wait-for-it script
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Start script to wait for db before starting WordPress
CMD ["wait-for-it.sh", "db:3306", "--", "docker-entrypoint.sh", "apache2-foreground"]
