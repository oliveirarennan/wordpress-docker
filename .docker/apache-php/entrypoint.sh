#!/bin/sh

# Copiar arquivos do WordPress se a pasta estiver vazia
if [ -z "$(ls -A /var/www/html)" ]; then
  curl -L https://wordpress.org/latest.tar.gz -o /tmp/latest.tar.gz
  tar -xzvf /tmp/latest.tar.gz -C /tmp 
  mv /tmp/wordpress/* /var/www/html 
  rm -rf /tmp/latest.tar.gz /tmp/wordpress 
  chown -R www-data:www-data /var/www/html
fi

# Iniciar Apache
apache2-foreground
