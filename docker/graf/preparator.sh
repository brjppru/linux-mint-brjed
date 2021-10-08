#!/bin/sh

# do this on your raspi
mkdir -p $HOME/docker/influxdb/data
mkdir -p $HOME/docker/influxdb/init
mkdir -p $HOME/docker/compose-files/influxdb

cp docker-compose.yml $HOME/docker/compose-files/influxdb

cd $HOME/docker/influxdb
docker run --rm influxdb influxd print-config > influxdb.conf
sed -i 's/^  auth-enabled = false$/  auth-enabled = true/g' influxdb.conf

cd $HOME/docker/influxdb
docker run --rm telegraf telegraf config > telegraf.conf
# now modify it to tell it how to authenticate against influxdb
sed -i 's/^  # urls = \["http:\/\/127\.0\.0\.1:8086"\]$/  urls = \["http:\/\/influxdb:8086"\]/g' telegraf.conf
sed -i 's/^  # database = "telegraf"$/  database = "telegraf"/' telegraf.conf
sed -i 's/^  # username = "telegraf"$/  username = "telegraf"/' telegraf.conf
sed -i 's/^  # password = "metricsmetricsmetricsmetrics"$/  password = "<telegrafUSERpassword>"/' telegraf.conf
# as we run inside docker, the telegraf hostname is different from our Raspberry hostname, let's change it
sed -i 's/^  hostname = ""$/  hostname = "'${HOSTNAME}'"/' telegraf.conf

touch $HOME/docker/influxdb/init/create-telegraf.iql

cat <<EOM | tee $HOME/docker/influxdb/init/create-telegraf.iql
CREATE DATABASE telegraf WITH DURATION 31d
CREATE USER telegraf WITH PASSWORD '<telegrafUSERpassword>'
GRANT WRITE ON telegraf to telegraf
EOM

touch $HOME/docker/compose-files/influxdb/.env
cat <<EOM | tee $HOME/docker/compose-files/influxdb/.env
INFLUXDB_USERNAME=admin
INFLUXDB_PASSWORD=<superSECRETinfluxPASSWORD>
EOM

cd $HOME/docker/compose-files/influxdb
docker-compose up
