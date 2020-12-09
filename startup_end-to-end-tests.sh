#!/bin/bash
set -a
source ./envs/default.env
source ./envs/end-to-end-tests.env
[ -f ./envs/.env ] && source ./envs/.env


docker-compose \
	--env-file ./env/end-to-end-tests.env \
	-f ${COMPOSE_FILES_PATH}/docker-compose.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.notification.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.calendar.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.end-to-end-tests.yml \
	${@:-up -d}


#	-f ./compose-files/docker-compose.calendar.yml \
# -f ./compose-files/docker-compose.file.yml \