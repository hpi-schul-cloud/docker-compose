set -a
source ./envs/end-to-end-tests.env
source ./envs/version.env

docker-compose \
	--env-file ./env/develop.env \
	-f ./compose-files/docker-compose.yml \
	-f ./compose-files/docker-compose.calendar.yml \
	-f ./compose-files/docker-compose.notification.yml \
	-f ./compose-files/docker-compose.file.yml \
	-f ./compose-files/docker-compose.end-to-end-tests.yml \
	$@