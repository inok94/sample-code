FROM php:8.1-fpm

RUN apt update \
    && apt install -y zlib1g-dev g++ git libxslt-dev libicu-dev zip libzip-dev zip libpq-dev libpng-dev pdftk \
    && docker-php-ext-install intl opcache pdo pdo_pgsql xsl pgsql gd \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-install xml \
    && pecl install xdebug-3.1.1 \
    && docker-php-ext-enable xdebug

COPY ./docker/php-fpm/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www
COPY --chown=www-data:www-data . /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

ADD . .

ARG UNAME=www-data
ARG UGROUP=www-data
ARG UID=1000
ARG GID=1000
RUN usermod  --uid $UID $UNAME
RUN groupmod --gid $GID $UGROUP

RUN chown -R www-data /var/www/
