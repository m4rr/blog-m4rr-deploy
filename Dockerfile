FROM m4rr/blogengine-docker:latest as AEGEA
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

# -

FROM m4rr/normal-php-apache:latest
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

RUN mkdir -p /var/www/html
COPY --from=AEGEA /blogengine /var/www/html

EXPOSE 80
