FROM php:7.4.8-apache
RUN apt -qq update && apt -qq upgrade -y \
  && apt -qq install -y unzip cron  \
  && docker-php-ext-install calendar gettext mysqli \
  && apt autoremove -y 
RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN echo "\nServerName \${SENDY_FQDN}" > /etc/apache2/conf-available/server.conf
RUN a2enconf server
RUN a2enmod rewrite headers
