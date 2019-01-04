#!/usr/bin/env bash

docker-compose up -d && sleep 2 && docker exec -it db1 ./cockroach sql --insecure -e 'CREATE DATABASE IF NOT EXISTS test;'
