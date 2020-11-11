# HPI-Schul-Cloud Development Setup with Matrix Messenger

## Setup

Clone this repository:

```
git clone git://github.com/maxklenk/hpi-schul-cloud-codespaces.git
```

Execute the setup script to pull the needed repositories
```
sh setup.sh
```

## Use

To start the stack run

```
docker-compose up -d
```

You can watch the output of all containers using

```
docker-compose logs -f
```

To stop all services run:

```
docker-compose down
```

### Ports

It takes quite a while to start the services for the first time because the containers and dependencies have to be downloaded.
Afterwards you can access the services via these ports:

- [3030](http://localhost:3030/) Schul-Cloud Server
- [5959](http://localhost:5959/) Schul-Cloud Server (debug)
- [7000](http://localhost:7000/) Schul-Cloud Client
- [9310](http://localhost:9310/) Schul-Cloud Client (debug)
- [8008](http://localhost:8008/) Synapse Matrix
- [15672](http://localhost:15672/) RabbitMQ Management (guest / guest)

## Problems

- Run the `up` command again to apply a changed docker-compose file (e.g. env variables):
  ```
  docker-compose up -d
  ```

- Use the --build flag to rebuild/update the used image:
  ```
  docker-compose up -d --build
  ```

- Error Code 137
  Try to give docker more memory

- Fill Database

  The SC database is automatically filled by running `setup.sh` which triggers `reset.sh`.
  To execute it manually run:
  ```
  docker-compose exec server npm run setup
  ```

- Create Synapse Sync User

  The sync user is automatically creaded by running `setup.sh` which triggers `reset.sh`.
  To execute it manually run:
  ```
  docker-compose exec synapse register_new_matrix_user -u sync -p secure -c /data/homeserver.yaml --admin http://localhost:8008
  ```
