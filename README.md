# Setup HPI-Schul-Cloud

The scripts (e.g. startup_develop.sh) set up an environment for developing with all necassery docker container. The cripts combines the neccassery compose files and can be triggerd with normal docker-compose commands.

## Examples

`./startup_develop.sh up -d server`: runs only the server and related container in background.
`./startup_develop.sh down`: stops all container started with the script and remove container, volumes, etc.
`./startup_develop.sh logs -f`: show logs of all running container metioned in the script file

## Change version or path of container (env-files)

Versions of docker containers that aren't managed by the HPI-Schul-Cloud team can be inlcuded and updated in `./envs/default.env`. Other docker tags should be added to the related env file (e.g. for develop us `./envs/develop.env`). Some of the containers also have a default tag if nothing is set in envs. **Envs for special needs** can also be added in a `.env` file inside the `./envs` path and will not be commited. Please add credentials and secrets only in this file!

## Structure

**docker-compose** files are located in the `./compose-files` and base mostly on the `docker-compose.yml`, which starts the base setup of server, client and nuxt-client. Most of the others could change envs dependencies or links and set everything they need to run there services in combination wiht other containers (e.g. server).
**env** files are located in `./envs` and can be used in combination with the docker-compose files to set default values. Some of the containers already have some default values if the env is not set. In some cases this is not used, because for the end-to-end tests they not allowed to set to trigger a pull. If you want to rebuild your local
images or force a pull latest images, you have to execute `docker rmi <docker-image>:<tag>` (e.g. `docker rmi schulcloud/schulcloud-calendar:latest`)
In **data** files needed for the docker containers are stored (e.g. default setup data for the ldap server).

## Contribution

If you want to add a new service, please create a new docker-compose file in `./compose-files` if it is not related to some of the existing services. If it is for a special case and not necessary for the day to day use, it should not be set to `depend-on` another component to lower the performance impact.

Add the file to `./startup_develop` so developers can use it easily. If it is also needed for other test, add it to the related startup file (e.g. for end-to-end-tests use the `./startup_end-to-end-tests`file).
