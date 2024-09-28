FROM	debian:buster

RUN		apt-get update
RUN		apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/bgoron.crt \
       -keyout /etc/nginx/ssl/bgoron.key \
       -subj "/C=FR/ST=Angouleme/L=Angouleme/O=42/OU=bgoron/CN=bgoron/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
