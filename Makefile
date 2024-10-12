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

ls: ps images volume network

nginx:
	@docker exec -it nginx bash

mariadb:
	@docker exec -it mariadb bash

wordpress:
	@docker exec -it wordpress bash

logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

re: clean up

clean:
	@docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@docker system prune -af --volumes
	@rm -rf ~/data/mariadb ~/data/wordpress
	
.PHONY: all up down ps images volume network ls nginx mariadb wordpress logs re clean
