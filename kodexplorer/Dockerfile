FROM alpine
ARG KOD_VERSION=4.36
RUN apk update && apk add nginx php7 php7-fpm php7-iconv php7-curl php7-mbstring php7-gd php7-session php7-json php7-curl php7-exif php7-mbstring php7-ldap php7-gd php7-pdo php7-pdo_mysql php7-xml
RUN mkdir -p /var/www/html && mkdir -p /tmp/file \
	&& wget -O /tmp/kodexplorer.tar.gz https://github.com/kalcaddle/KodExplorer/archive/${KOD_VERSION}.tar.gz \
	&& tar -zxvf /tmp/kodexplorer.tar.gz -C /tmp/file/ --strip-components=1
WORKDIR /var/www/html
COPY nginx.conf /etc/nginx
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sh","/usr/local/bin/entrypoint.sh"]
CMD php-fpm7 && nginx -g 'daemon off;'
