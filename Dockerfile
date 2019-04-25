# FROM m4rr/normal-php-apache
# LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

# # RUN mkdir -p /var/www/htm
# RUN mkdir -p /var/www/html
# WORKDIR /var/www/html
# RUN curl https://blogengine.ru/download/e2_distr_v3386.zip -o a.zip && unzip a.zip
# RUN chown www-data:www-data .

# COPY ./config/php/php.ini-production /usr/local/etc/php/php.ini
# COPY ./config/php/php.ini-production /etc/php7.2/apache/php.ini
# RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
# RUN echo '<?php phpinfo();' > info.php
# RUN apt-get install libapache2-mod-php7.1
# RUN a2enmod php7.1

# RUN chmod 777 /var/log/php-errors.log
# RUN chown www:www /var/log/php-errors.log

# COPY ./config/php/vhost.conf /etc/apache2/sites-enabled/000-blog.m4rr.ru.conf


# EXPOSE 80
