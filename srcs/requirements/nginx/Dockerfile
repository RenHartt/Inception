FROM	debian:bullseye

RUN		apt-get update && apt-get install -y nginx

RUN		mkdir -p /etc/nginx/ssl \
		&& apt-get install -y openssl \
		&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=42/CN=bgoron.42.fr/UID=bgoron"

RUN		mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/conf.d

RUN		chmod 755 /var/www/html \
		&& chown -R www-data:www-data /var/www/html

EXPOSE	443

CMD		[ "nginx", "-g", "daemon off;" ]
