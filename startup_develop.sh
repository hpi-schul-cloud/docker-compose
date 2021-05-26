#!/bin/bash
set -a
source ./envs/default.env
source ./envs/develop.env
[ -f ./envs/.env ] && source ./envs/.env

echo "$MY_DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin

[ -n "${FILE_PREVIEW_PATH}" ] || docker pull schulcloud/filepreview:${FILE_PREVIEW_DOCKER_TAG:-latest}
[ -n "${NOTIFICATION_SERVICE_PATH}" ] || docker pull schulcloud/node-notification-service:${NOTIFICATION_SERVICE_DOCKER_TAG}
[ -n "${CALENDAR_PATH}" ] || docker pull schulcloud/schulcloud-calendar:${CALENDAR_DOCKER_TAG:-latest}

docker-compose \
	--env-file ./env/develop.env \
	-f ${COMPOSE_FILES_PATH}/docker-compose.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.ldap.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.calendar.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.notification.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.file.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.superhero.yml \
	-f ${COMPOSE_FILES_PATH}/docker-compose.dev.yml \
	${@:-up -d}
