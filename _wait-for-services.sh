#! /bin/bash

path=$1
shift
ports=$*

echo $path
echo $ports

host=$DOCKER_HOST_IP

done=false


while [[ "$done" = false ]]; do
	for port in $ports; do
		url=http://${host}:${port}$path
		curl --fail $url >& /dev/null
		if [[ "$?" -eq "0" ]]; then
			done=true
		else
			done=false
			echo $url
			break
		fi
	done
	if [[ "$done" = true ]]; then
		echo connected
		break;
  fi
	STOPPED_CONTAINERS=$(docker ps -a | egrep 'start.*Exited')
  if [ ! -z "$STOPPED_CONTAINERS" ] ; then
				 echo stopped exited containers
				 echo $STOPPED_CONTAINERS
				 exit 99
  fi
 	echo -n .
	sleep 1
done
