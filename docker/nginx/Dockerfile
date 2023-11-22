FROM nginx:1.23.1-alpine

WORKDIR /var/www

COPY ./docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY public /var/www/public
