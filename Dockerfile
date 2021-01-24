FROM php:7.4-apache

RUN apt-get update -y \
 && apt-get install -y unzip curl libicu-dev libgmp-dev git vim-tiny libzip-dev \
  && rm -rf /var/lib/apt/lists/* /var/cache/apk/*

  RUN pecl install xdebug \
   && docker-php-ext-enable xdebug \
    && docker-php-ext-install bcmath intl sockets opcache pdo_mysql gmp

  RUN docker-php-ext-install zip

# Apache configuration
RUN a2enmod rewrite \
 && a2enmod ssl \
  && a2dissite 000-default \
   && echo ServerName localhost >> /etc/apache2/apache2.conf

   COPY config/vhost/* /etc/apache2/sites-available/
   RUN a2ensite php-app

   RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
