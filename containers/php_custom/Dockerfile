FROM php:5.6.31-alpine

# MAINTAINER Eric Jouffrey

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
