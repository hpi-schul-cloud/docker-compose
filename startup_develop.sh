#!/bin/bash
set -a
source ./envs/version.env
source ./envs/develop.env
[ -f ./envs/.env ] && source ./envs/.env

docker-compose \
	--env-file ./env/develop.env \
	-f ./compose-files/docker-compose.yml \
	-f ./compose-files/docker-compose.ldap.yml \
	-f ./compose-files/docker-compose.calendar.yml \
	-f ./compose-files/docker-compose.notification.yml \
	-f ./compose-files/docker-compose.file.yml \
	-f ./compose-files/docker-compose.superhero.yml \
	-f ./compose-files/docker-compose.dev.yml \
	${@:-up -d}