docker-compose \
	-f ./compose-files/docker-compose.yml \
	-f ./compose-files/docker-compose.ldap.yml \
	-f ./compose-files/docker-compose.dev.yml \
	$@