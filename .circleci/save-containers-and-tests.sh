#! /bin/bash -e

#mkdir -p ~/junit ~/container-logs

DIR=/root/container-logs

sudo mkdir -p ${DIR}
sudo bash -c "docker ps -a > ${DIR}/containers.txt"

for container in $(docker ps -a --format '{{.Names}}' ) ; do
  sudo bash -c "docker logs \"$container\" > \"${DIR}/${container}.log\""
done

sudo bash -c "find $DIR -type f -exec chown circleci {} \;"
