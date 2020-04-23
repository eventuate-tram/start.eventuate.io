#! /bin/bash

set -e

./mvnw install -DskipTests
docker-compose build
