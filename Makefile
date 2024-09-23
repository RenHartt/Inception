DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = srcs/docker-compose.yml
ENV_FILE = srcs/.env

up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

restart: down clean build up

logs:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs

clean:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

ps:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) ps

wordpress-shell:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec wordpress sh

mariadb-shell:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec mariadb sh

nginx-shell:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec nginx sh

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
