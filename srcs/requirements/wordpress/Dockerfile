FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y
RUN	apt-get install -y \
	mariadb-client \
	wget \
	curl \
	php7.3-fpm \
	php-cli \
	php-mysql \
	vim


RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -xvf latest.tar.gz
RUN	mkdir -p /var/www/
RUN	mv /wordpress/ /var/www/
RUN	chown -R  www-data:www-data /var/www/wordpress/
RUN	rm -rf latest.tar.gz /var/www/wordpress/wp-config-sample.php

RUN	sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN	mkdir -p /run/php/

COPY	./tools/wordpress_setup.sh /
COPY	./conf/wp-config.php /var/www/wordpress

EXPOSE	9000

ENTRYPOINT	["/bin/bash", "/wordpress_setup.sh"]
