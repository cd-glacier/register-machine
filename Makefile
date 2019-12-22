.DEFAULT_GOAL := help

pull-image: ## pull docker image
	docker pull practicalscheme/gauche

run: ## run register-machine
	docker run --rm -it -v $$PWD/src:/root practicalscheme/gauche:latest gosh ./root/main.scm

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

