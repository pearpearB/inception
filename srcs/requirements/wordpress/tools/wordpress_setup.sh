#!bin/bash

if  [ ! -f /var/www/wordpress/wp-config.php ]; then 

    wp core --allow-root download --locale=ko_KR --force 
    wp core config --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PW} --dbhost=mariadb:3306
    wp core install --allow-root --url=${DOMAIN_NAME} --title='JABAEs Inception! Finally!!' --admin_user=${WP_ADMIN_ID} --admin_password=${WP_ADMIN_PW}  --admin_email=${WP_ADMIN_EMAIL} --path='/var/www/wordpress'
		wp user create --allow-root ${WP_USER_ID} ${WP_USER_EMAIL} --user_pass=${WP_USER_PW} --role=${WP_USER_ROLE}
    
fi

php-fpm7.3 --nodaemonize