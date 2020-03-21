#! /bin/bash -e

#mkdir -p ~/junit ~/container-logs

DIR=/root/container-logs

sudo mkdir -p ${DIR}
docker ps -a | sudo bash -c "cat > ${DIR}/containers.txt"

for container in $(docker ps -a --format '{{.Names}}' ) ; do
  docker logs "$container" | sudo bash -c "cat > \"${DIR}/${container}.log\""
done

sudo bash -c "find $DIR -type f -exec chown circleci {} \;"
