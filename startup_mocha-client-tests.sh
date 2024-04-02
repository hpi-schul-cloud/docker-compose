#!/bin/bash
set -a
source ./envs/default.env
source ./envs/end-to-end-tests.env
[ -f ./envs/.env ] && source ./envs/.env

docker compose \
	--env-file ./env/end-to-end-tests.env \
	-f ${COMPOSE_FILES_PATH}/docker-compose.yml \
	${@:-up -d client}
