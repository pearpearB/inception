#!bin/bash

if [ ! -d "/var/lib/mysql/wordpress" ]; then

	service mysql start

	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
		CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PW'; \
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'; \
		ALTER USER '$DB_ROOT'@'localhost' IDENTIFIED BY '$DB_ROOT_PW'; \
		FLUSH PRIVILEGES;"
		
	mysqladmin -u$DB_ROOT -p$DB_ROOT_PW shutdown

fi

exec mysqld_safe
