set -a
source ./envs/end-to-end-tests.env
source ./envs/version.env

docker-compose \
	--env-file ./env/develop.env \
	-f ./compose-files/docker-compose.yml \
	${@:-up -d client}