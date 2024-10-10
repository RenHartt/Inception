FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget php php-mysql php-fpm 

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/setup-wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-wordpress.sh

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/setup-wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
