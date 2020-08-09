FROM m4rr/blogengine-docker:latest as AEGEA
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

# -

FROM php:7.4-apache
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

RUN mkdir -p /var/www/html
COPY --from=AEGEA /blogengine /var/www/html


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        # zlib1g-dev \
        # libxml2-dev \
        libzip-dev \
    \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt \
    && docker-php-source delete

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http
RUN service apache2 restart

EXPOSE 80
