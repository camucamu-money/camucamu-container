#!/usr/bin/env bash

getBackup() {
    echo "Retrieving last backup."
    docker exec --env-file='./.env' -i mongodb1 bash -c 'mongodump --archive="./tmp/camucamu.gz" --gzip --db camucamu --uri "$DB_URL" && mongorestore --gzip --nsInclude="camucamu.*" --archive="./tmp/camucamu.gz"'
}

getBackup