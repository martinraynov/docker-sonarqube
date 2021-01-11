M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: start
start: ## Start the sonarqube docker container
	$(info $(M) Starting an instance of sonarqube)
	@docker stack rm sonarqube
	@docker stack deploy -c ./docker/docker-compose-swarm.yml sonarqube

.PHONY: stop
stop: ## Stopping running sonarqube instances
	$(info $(M) Stopping sonarqube instance)
	@docker stack rm sonarqube

.PHONY: build
build: ## Build the local sonarqube image
	$(info $(M) Building local sonarqube image : localhost/sonarqube:lts)
	@docker build ./docker -t localhost/sonarqube:lts

.DEFAULT_GOAL := help