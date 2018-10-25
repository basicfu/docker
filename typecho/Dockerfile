FROM alpine
RUN apk update && apk add nginx php7 php7-fpm php7-pdo_mysql php7-mysqli php7-ctype php7-xml php7-session php7-tokenizer php7-curl php7-json lsof git
RUN mkdir -p /var/www/html \
	&& git clone https://github.com/typecho/typecho.git /tmp/file
WORKDIR /var/www/html
COPY nginx.conf /etc/nginx
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]
CMD php-fpm7 && nginx -g 'daemon off;'
