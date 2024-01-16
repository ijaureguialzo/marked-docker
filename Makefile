#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo --------------------
	@echo build
	@echo workspace
	@echo markdown
	@echo clean
	@echo --------------------

_header:
	@echo ------
	@echo Marked
	@echo ------

build:
	@docker compose build --pull

workspace:
	@docker compose run --rm node /bin/bash

markdown:
	@docker compose run --rm node marked README.md

clean:
	@docker compose down -v --remove-orphans
