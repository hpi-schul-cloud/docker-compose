#!/bin/bash
set -a
source ./envs/default.env
source ./envs/end-to-end-tests.env
[ -f ./envs/.env ] && source ./envs/.env


docker-compose \
	--env-file ./envs/end-to-end-tests.env \
	-f ${COMPOSE_FILES_PATH}/docker-compose.yml \
	${@:-up}


#	-f ./compose-files/docker-compose.calendar.yml \
# -f ./compose-files/docker-compose.file.yml \
