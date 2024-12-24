FROM php:8.2-apache-bookworm
RUN apt update && apt upgrade -y && apt install -y \
  libpng-dev \
  libjpeg-dev \
  libfreetype6-dev \
  libwebp-dev \ 
  libmagickwand-dev \ 
  libicu-dev \ 
  libxml2-dev \ 
  libzip-dev \ 
  libonig-dev \ 
  libmcrypt-dev \ 
  zlib1g-dev \ 
  libssl-dev \ 
  libssh2-1-dev \ 
  libmemcached-dev \ 
  curl \ 
  unzip \
  && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \ 
  && docker-php-ext-install -j$(nproc) \
  gd \
  mysqli \
  exif \
  zip \ 
  intl 
RUN pecl install imagick \ && docker-php-ext-enable imagick
RUN pecl install redis \ && docker-php-ext-enable redis
  
   
ADD .docker/apache-php/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ADD .docker/apache-php/wp-config.php /usr/src/wordpress/wp-config.php
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]