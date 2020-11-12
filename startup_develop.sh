#!/bin/bash
set -a
source ./envs/version.env
source ./envs/develop.env
[ -f ./envs/.env ] && source ./envs/.env


docker-compose \
	--env-file ./env/develop.env \
	-f ${COMPOSE_FILES_PATH}/docker-compose.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.ldap.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.calendar.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.notification.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.file.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.superhero.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.dev.yml \
	$@