docker-compose \
	-f ./compose-files/docker-compose.yml \
	-f ./compose-files/docker-compose.ldap.yml \
	-f ./compose-files/docker-compose.dev.yml \
	$1 $2 $3