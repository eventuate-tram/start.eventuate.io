#! /bin/bash -e

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker tag eventuateio/start-eventuate-io:latest eventuateio/start-eventuate-io:BUILD-${CIRCLE_BUILD_NUM?}
