.DEFAULT_GOAL := help

pull-image: ## pull docker image
	docker pull jackfirth/racket

run: ## run register-machine
	docker run -v "$$PWD/src:/src" -it jackfirth/racket racket ./src/main.rkt

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

