#! /bin/bash

set -e

./mvnw package -DskipTests
docker-compose build
