#! /bin/bash -e

#mkdir -p ~/junit ~/container-logs

DIR=~/container-logs

mkdir -p ${DIR}
docker ps -a > ${DIR}/containers.txt

for container in $(docker ps -a --format '{{.Names}}' ) ; do
  docker logs "$container" > "${DIR}/${container}.log"
done

sudo bash -c 'find ~/container-logs -type f -exec chown circleci {} \;'
