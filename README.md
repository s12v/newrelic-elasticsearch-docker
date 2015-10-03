# newrelic-elasticsearch-docker

Docker container for [New Relic Elasticsearch plugin](https://github.com/s12v/newrelic-elasticsearch)


## Usage

Example `docker-compose.yml` defines a cluster with 3 elasticsearch nodes and 1 New Relic monitoring container:

```yml
es1:
  image: elasticsearch
  ports:
  - "9200:9200"
es2:
  image: elasticsearch
es3:
  image: elasticsearch
newrelic:
  image: s12v/newrelic-elasticsearch
  links:
    - es1:elasticsearch
  environment:
    - NEW_RELIC_LICENSE_KEY=itsasecret
```

Change your license key and run `docker-compose up`.
