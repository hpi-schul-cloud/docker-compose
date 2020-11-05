# Setup HPI-Schul-Cloud

The scripts (e.g. startup_develop.sh) set up an environment for developing with all necassery docker container. The cripts combines the neccassery compose files and can be triggerd with normal docker-compose commands.

## Examples

`./startup_develop.sh up -d server`: runs only the server and related container in background.
`./startup_develop.sh down`: stops all container started with the script and remove container, volumes, etc.
`./startup_develop.sh logs -f`: show logs of all running container metioned in the script file

## Change version of container (env-files)

Version of docker container that aren't managed by the HPI-Schul-Cloud team could be inlcuded and update in `./envs/version.env` other docker tags should be added to the relatet env file (e.g. for develop us `./envs/develop.env`). Some of the container have also a default tag if nothing is set in envs. Changes for spezial need could also be added in a `.env` file inside the `./env` path and will not be commited. Please add credentials and secrets only in this file!