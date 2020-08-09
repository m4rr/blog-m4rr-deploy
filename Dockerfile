FROM m4rr/blogengine-docker:latest as AEGEA
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

# -

FROM httpd:2.4-alpine # php:7.1-apache
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

RUN mkdir -p /var/www/html
COPY --from=AEGEA /blogengine /var/www/html

RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
      --with-jpeg=/usr/include/ \
    && docker-php-ext-configure mcrypt \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      mbstring mysqli pdo_mysql zip mcrypt\
    && rm -rf /tmp/*

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http

EXPOSE 80
