FROM php:7.0.23-fpm-alpine

# MAINTAINER Eric Jouffrey

# Set timezone
RUN rm /etc/localtime && \
        ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
        "date"


RUN set -xe \
    && apk add --update \
        curl icu \
    && apk add --no-cache --virtual .php-deps \
        make \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        zlib-dev \
        icu-dev \
        g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql intl \
    && pecl install xdebug \
    && docker-php-ext-enable intl xdebug \
    && { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } \
    && apk del .build-deps \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

# Install APCu v5.1.7
RUN mkdir -p /usr/src/php/ext && \
        curl -L -o /tmp/apcu-5.1.7.tgz https://pecl.php.net/get/apcu-5.1.7.tgz && \
        tar xfz /tmp/apcu-5.1.7.tgz && \
        rm -r /tmp/apcu-5.1.7.tgz && \
        mv apcu-5.1.7  /usr/src/php/ext/apcu && \
        docker-php-ext-install apcu

# Enable apc
RUN echo "apc.enable_cli = On" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini
# Active xdebug
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Configure short open tag for Symfony
RUN echo "short_open_tag = Off" >> /usr/local/etc/php/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

WORKDIR /var/www/serving_website
