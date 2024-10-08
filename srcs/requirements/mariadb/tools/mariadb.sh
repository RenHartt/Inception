#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else

mysql_secure_installation << EOF

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
EOF

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

fi

/etc/init.d/mysql stop

exec "$@"
