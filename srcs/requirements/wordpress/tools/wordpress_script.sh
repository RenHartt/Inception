#!/bin/bash

while ! mysqladmin ping -h mariadb; do
	sleep 5
done

if [ ! -f wp-config.php ]; then
    wp config create \
        --dbname="$WORDPRESS_DB_NAME" \
        --dbuser="$WORDPRESS_DB_USER" \
        --dbpass="$WORDPRESS_DB_PASSWORD" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --path="/var/www/html/wordpress" \
        --allow-root
fi

if ! wp core is-installed --allow-root; then
    wp core install \
        --url="bgoron.42.fr" \
        --title="My WordPress Site" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --path="/var/www/html/wordpress" \
        --allow-root
fi

php-fpm7.4 -F
