FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget php7.4-fpm php-mysql php-phar mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html \
	&& cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
	&& chown -R root:root /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php \
	&& chown -R www-data:www-data /run/php/ \
	&& chmod 755 /run/php \
	&& chown -R www-data:www-data /var/www/html/

COPY tools/wordpress_script.sh /wordpress_script.sh
RUN chmod +x /wordpress_script.sh

CMD ["/wordpress_script.sh"]
