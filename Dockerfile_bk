#FROM docker-reg.portal.gov.bd/npf-backend:1.34
FROM php:7.3-apache
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    default-mysql-client \
    dnsutils

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

RUN sed -i 's/memory_limit = 128M/memory_limit = 2G/g' /usr/local/etc/php/php.ini-production
RUN sed -i 's/expose_php = On/expose_php = off/g' /usr/local/etc/php/php.ini-production
RUN sed -i 's/memory_limit = 128M/memory_limit = 2G/g' /usr/local/etc/php/php.ini-development
RUN sed -i 's/expose_php = On/expose_php = off/g' /usr/local/etc/php/php.ini-development
WORKDIR /var/www/html
RUN rm -rf *
COPY . .
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

EXPOSE 80 443
CMD /usr/sbin/apache2ctl -D FOREGROUND