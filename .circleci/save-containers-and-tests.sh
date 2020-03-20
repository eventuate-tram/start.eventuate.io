#! /bin/bash -e

#mkdir -p ~/junit ~/container-logs

DIR=/root/container-logs

sudo mkdir -p ${DIR}
sudo docker ps -a > ${DIR}/containers.txt

for container in $(docker ps -a --format '{{.Names}}' ) ; do
  sudo docker logs "$container" > "${DIR}/${container}.log"
done

sudo bash -c 'find ~/container-logs -type f -exec chown circleci {} \;'
