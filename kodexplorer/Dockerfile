FROM alpine
ARG KOD_VERSION=4.36
RUN apk update && apk add nginx php7 php7-fpm php7-iconv php7-curl php7-mbstring php7-gd php7-session php7-json php7-curl php7-exif php7-mbstring php7-ldap php7-gd php7-pdo php7-pdo_mysql php7-xml
RUN mkdir -p /var/www/html \
	&& cd /var/www/html && wget -O kodexplorer.tar.gz https://github.com/kalcaddle/KodExplorer/archive/${KOD_VERSION}.tar.gz \
	&& tar -zxvf kodexplorer.tar.gz \
	&& cp -r KodExplorer-${KOD_VERSION}/* . && rm -rf KodExplorer-${KOD_VERSION} \
  && chmod -R 777 /var/www/html
COPY nginx.conf /etc/nginx
CMD php-fpm7 && nginx -g 'daemon off;'
