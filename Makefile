NAME=inception
DOCKER_COMPOSE=docker-compose -f ./srcs/docker-compose.yml
SET_WORK = -f srcs/requirements/linux_setup.sh

all: mkvol up

mkvol:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb

rmvol:
	rm -rf ~/data

setup:
	sudo sh $(SET_WORK)

up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

clean: down
	docker system prune -a

fclean: clean rmvol

re: fclean all

.PHONY: all mkvol rmvol up down clean fclean re
