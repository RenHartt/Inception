include srcs/.env

COMPOSE_FILE = srcs/docker-compose.yml

all: up

up:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker compose -f $(COMPOSE_FILE) up -d --build

down:
	@docker compose -f $(COMPOSE_FILE) down

ps:
	@docker ps

images:
	@docker images

volume:
	@docker volume ls

network:
	@docker network ls

ls:
	@docker ps
	@echo
	@docker images
	@echo
	@docker volume ls
	@echo
	@docker network ls

show-databases:
	@docker exec -it mariadb mysql -h 127.0.0.1 -P 3306 -u root -p

nginx:
	@docker exec -it nginx bash

mariadb:
	@docker exec -it mariadb bash

wordpress:
	@docker exec -it wordpress bash

logs:
	@docker compose -f $(COMPOSE_FILE) logs

logs-nginx:
	@docker compose -f $(COMPOSE_FILE) logs nginx

logs-mariadb:
	@docker compose -f $(COMPOSE_FILE) logs mariadb

logs-wordpress:
	@docker compose -f $(COMPOSE_FILE) logs wordpress

re: clean up

clean:
	@docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@docker system prune -af --volumes
	@sudo rm -rf ~/data/mariadb ~/data/wordpress

help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  up                Build and start the containers"
	@echo "  down              Stop and remove the containers"
	@echo
	@echo "  ps                Show running containers"
	@echo "  images            List Docker images"
	@echo "  volume            List Docker volumes"
	@echo "  network           List Docker networks"
	@echo "  ls                Show containers, images, volumes, and networks"
	@echo
	@echo "  show-databases    Open MySQL shell for MariaDB (requires password)"
	@echo "  nginx             Open a bash shell in the Nginx container"
	@echo "  mariadb           Open a bash shell in the MariaDB container"
	@echo "  wordpress         Open a bash shell in the WordPress container"
	@echo
	@echo "  logs              Show logs for all services"
	@echo "  logs-nginx        Show logs for the Nginx container"
	@echo "  logs-mariadb      Show logs for the MariaDB container"
	@echo "  logs-wordpress    Show logs for the WordPress container"
	@echo
	@echo "  re                Clean up and restart the containers"
	@echo "  clean             Remove all containers, volumes, and prune system"
	@echo
	@echo "  help              Show this help message"
	
.PHONY: all up down ps images volume network ls show-databases nginx mariadb wordpress logs logs-nginx logs-mariadb logs-wordpress re clean help
