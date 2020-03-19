#! /bin/bash

set -e

./build-all.sh
docker-compose up --build -d
