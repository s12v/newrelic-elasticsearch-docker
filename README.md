[![Docker Pulls](https://img.shields.io/docker/pulls/s12v/newrelic-elasticsearch.svg?maxAge=2592000)](https://hub.docker.com/r/s12v/newrelic-elasticsearch/)

# newrelic-elasticsearch

Docker container for [New Relic Elasticsearch plugin](https://github.com/s12v/newrelic-elasticsearch)


## Usage

## With docker run
```
docker run -e "ES_HOST=example.com" -e "NEW_RELIC_LICENSE_KEY=..." s12v/newrelic-elasticsearch
```

### With docker-compose

Example [docker-compose.yml](example/docker-compose.yml) defines a cluster with 3 elasticsearch nodes and 1 New Relic monitoring container. Change your license key and run `docker-compose up`.

## Configuration

Container accepts following environment parameters:
 - `NEW_RELIC_LICENSE_KEY` - New Relic license key (required)
 - `ES_HOST` - hostname
 - `ES_PORT` - port
 - `ES_NAME` - cluster name
 - `ES_USER` - username for basic authentication
 - `ES_PASSWD` - password
 - `ES_RECONNECTS` - maximum number of connection attempts
