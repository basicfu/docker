FROM alpine
RUN apk update \
	&& apk add nginx php7 php7-fpm php7-pdo_mysql php7-mysqli php7-ctype php7-xml php7-session php7-tokenizer php7-curl php7-json lsof git \
	&& mkdir -p /var/www/html \
	&& cd /var/www/html && git clone https://github.com/typecho/typecho.git && cp -r typecho/* . && rm -rf typecho \
	&& chmod -R 777 /var/www/html
COPY nginx.conf /etc/nginx
CMD php-fpm7 && nginx -g 'daemon off;'
