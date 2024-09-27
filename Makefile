up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build

restart: down clean build up

logs:
	docker-compose -f srcs/docker-compose.yml logs

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

ps:
	docker-compose -f srcs/docker-compose.yml ps

wordpress-shell:
	docker-compose -f srcs/docker-compose.yml exec wordpress sh

mariadb-shell:
	docker-compose -f srcs/docker-compose.yml exec mariadb sh

nginx-shell:
	docker-compose -f srcs/docker-compose.yml exec nginx sh

help:
	@echo "Available commands:"
	@echo "  up                Start the containers in detached mode"
	@echo "  down              Stop and remove the containers"
	@echo "  build             Build or rebuild the containers"
	@echo "  restart           Restart the containers"
	@echo "  logs              Logs from all containers"
	@echo "  clean             Remove containers, images, volumes, and orphans"
	@echo "  ps                List containers"
	@echo "  wordpress-shell   Open a shell in the WordPress container"
	@echo "  mariadb-shell     Open a shell in the MariaDB container"
	@echo "  nginx-shell       Open a shell in the Nginx container"

.PHONY: up down build restart logs clean ps wordpress-shell mariadb-shell nginx-shell
