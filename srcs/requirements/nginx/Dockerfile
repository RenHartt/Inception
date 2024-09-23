FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl /var/run/nginx

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/your_private.key \
    -out /etc/nginx/ssl/your_certificate.crt \
    -subj "/C=FR/ST=Nouvelle Aquitaine/L=Angouleme/O=42/CN=bgoron.42.fr/UID=bgoron"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
