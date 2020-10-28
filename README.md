# Setup HPI-Schul-Cloud

The scripts (e.g. startup_develop.sh) set up an environment for developing with all necassery docker container. The cripts combines the neccassery compose files and can be triggerd with normal docker-compose commands.

## Examples

`./startup_develop.sh up -d server`: runs only the server and related container in background.
`./startup_develop.sh down`: stops all container started with the script and remove container, volumes, etc.
`./startup_develop.sh logs -f`: show logs of all running container metioned in the script file