#!bin/bash

set -ex

export PATH="${NVM_DIR}/versions/node/v${NODE_VERSION_DEVELOP}/bin/:${PATH}"

bench init --skip-redis-config-generation frappe-bench

cd frappe-bench

# Use containers instead of localhost
bench set-mariadb-host $1
bench set-redis-cache-host $2:6379
bench set-redis-queue-host $2:6379
bench set-redis-socketio-host $2:6379

# Remove redis, watch from Procfile
sed -i '/redis/d' ./Procfile
sed -i '/watch/d' ./Procfile

bench get-app $5 --branch $4


