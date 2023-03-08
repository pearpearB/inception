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

COPY	./tools/wordpress_setup.sh /

RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/wordpress
RUN	chown -R  www-data:www-data /var/www/wordpress/

RUN	mkdir -p /run/php/
WORKDIR	/var/www/wordpress

EXPOSE	9000

ENTRYPOINT	["/bin/bash", "/wordpress_setup.sh"]
