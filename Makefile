LOGIN		= asemsey
COMPOSE		= ./srcs/docker-compose.yml

all: up

up:
	@docker compose -f $(COMPOSE) up --build -d

down:
	@docker compose -f $(COMPOSE) down

start:
	@docker compose -f $(COMPOSE) start

stop:
	@docker compose -f $(COMPOSE) stop

reset: down
	@echo "removing containers..."
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@echo "removing images..."
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@echo "Removing all volumes..."
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@sudo rm -rf /home/$(LOGIN)/data/mariadb/* /home/$(LOGIN)/data/wordpress/*

clear_docker: reset
	@docker system prune -f

help:
	@echo "Available targets:"
	@echo "  up            - Build and start all containers"
	@echo "  down          - Stop and remove all containers"
	@echo "  start         - Start all stopped containers"
	@echo "  stop          - Stop all running containers"
	@echo "  reset         - Reset the entire project and data"
	@echo "  clear_docker  - Clean all containers, images, and volumes then prune system"

.PHONY: up down start stop reset clear_docker help
