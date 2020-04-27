FROM wordpress:5-php7.2-fpm-alpine
LABEL Maintainer="Cheyne Wallace" \
      Description="WordPress & Nginx container based on official Wordpress image"

# Install packages
RUN apk --no-cache add nginx supervisor && rm -rf /var/cache/apk/

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure PHP (merges with other PHP config)
COPY config/php.ini /usr/local/etc/php/conf.d/php.ini

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1/wp-login.php