.DEFAULT_GOAL := help

run: ## run register-machine
	docker run --rm -v $$PWD/src:/usr/src practicalscheme/gauche:latest gosh ./usr/src/main.scm

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

