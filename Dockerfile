FROM m4rr/blogengine-docker:latest as AEGEA
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

USER docker

# -

FROM ulsmith/alpine-apache-php7
LABEL maintainer "Marat Saytakov <remarr+docker@gmail.com>"

USER docker

RUN mkdir -p /var/www/html
COPY --from=AEGEA /blogengine /var/www/html

EXPOSE 80
