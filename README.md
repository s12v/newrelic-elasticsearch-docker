# newrelic-elasticsearch-docker

Docker container for New Relic Elasticsearch plugin


## Usage

Example `docker-compose.yml` defines a cluster with 3 elasticsearch nodes and 1 New Relic monitoring container:

```yml
es1:
  image: elasticsearch:1.7
  ports:
  - "9200:9200"
es2:
  image: elasticsearch:1.7
es3:
  image: elasticsearch:1.7
newrelic:
  image: s12v/newrelic-elasticsearch
  links:
    - es1:elasticsearch
  environment:
    - NEW_RELIC_LICENSE_KEY=itsasecret
```

Change your license key and `docker-compose up`.
