include .env
COLOR_RESET       = \033[0m
COLOR_ERROR       = \033[31m
COLOR_INFO        = \033[32m
COLOR_COMMENT     = \033[33m
COLOR_TITLE_BLOCK = \033[0;44m\033[37m
PROJECT			  = "Docker-starter-symfony"
DOCKER_COMPOSE	  = docker-compose
SYMFONY			= $(DOCKER_COMPOSE) exec -T php /usr/bin/entrypoint make --directory=app/

help:
	@printf "${COLOR_TITLE_BLOCK}${PROJECT} Makefile${COLOR_RESET}\n"
	@printf "\n"
	@printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	@printf " make [target]\n\n"
	@printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	@awk '/^[a-zA-Z\-\_0-9\@]+:/ { \
		helpLine = match(lastLine, /^## (.*)/); \
		helpCommand = substr($$1, 0, index($$1, ":")); \
		helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
		printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

build:
	$(DOCKER_COMPOSE) build

pull:
	$(DOCKER_COMPOSE) pull

start:
	$(DOCKER_COMPOSE) up -d --remove-orphans

stop:
	$(DOCKER_COMPOSE) stop

stop-all:
	 docker stop $$(sudo docker ps -a -q)

stop-remove-all:
	sudo docker stop $$(sudo docker ps -a -q)
	sudo docker rm $$(sudo docker ps -a -q)
	sudo docker rmi $$(sudo docker images -a -q) -f
	sudo docker network rm $$(sudo docker images -a -q)

down:
	$(DOCKER_COMPOSE) down

prune:
	docker system prune

install:
	$(DOCKER_COMPOSE) build --build-arg PHP_VERSION=$(PHP_VERSION)
	$(DOCKER_COMPOSE) pull
	$(DOCKER_COMPOSE) up -d
	docker exec -it $(CONTAINER_NAME)_php bash
