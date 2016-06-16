#!/bin/bash

set -e

if [ "$1" = 'newrelic-elasticsearch' ]; then
	name=${ES_NAME:-elasticsearch-docker}
	host=${ES_HOST:-localhost}
	port=${ES_PORT:-9200}
	username=${ES_USER}
	password=${ES_PASSWD}
	reconnects=${ES_RECONNECTS:-10}

	./npi config set license_key $NEW_RELIC_LICENSE_KEY
	./npi prepare me.snov.newrelic-elasticsearch -n -q

	sed -i "s/%HOST%/$host/g" plugin.json
	sed -i "s/%PORT%/$port/g" plugin.json
	sed -i "s/%NAME%/$name/g" plugin.json
	sed -i "s/%USERNAME%/$username/g" plugin.json
	sed -i "s/%PASSWORD%/$password/g" plugin.json
	cp plugin.json `find . -path './plugins/me.snov.newrelic-elasticsearch/*/config/plugin.json'`

	for i in `seq 1 $reconnects`
	do
	 	echo -n "Trying $host:$port... "
		if curl --silent "$host:$port" > /dev/null
		then
	 		echo "OK"
			break
	 	fi
		echo "NOT AVAILABLE"
		sleep 5
	done

	exec ./npi start me.snov.newrelic-elasticsearch --foreground
fi

exec "$@"
