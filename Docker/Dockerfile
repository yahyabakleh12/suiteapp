FROM php:8.1 as php

RUN apt-get update -y
RUN apt-get install -y zip unzip
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR  /var/www
COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

COPY . .

ENTRYPOINT [ "Docker/entrypoint.sh" ]

