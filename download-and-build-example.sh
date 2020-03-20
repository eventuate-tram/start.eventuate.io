#! /bin/bash

set -e

GRADLE_URL="http://${DOCKER_HOST_IP}:8080/starter.zip?type=gradle-project&language=java&bootVersion=2.2.5.RELEASE&baseDir=demo&groupId=com.example&artifactId=demo&name=demo&description=Demo&packageName=com.example.demo&packaging=jar&javaVersion=1.8&dependencies=eventuatelocal,eventuatelocaltestsupport,eventuatetrambasicmessaging,eventuatetramdomainevents,eventuatetramcommands,eventuatetramkafka,eventuatetramactivemq,eventuatetramrabbitmqmq,eventuatetramredis,eventuatetramsagaorchestrator,eventuatetramsagaparticipant"
MAVEN_URL="http://${DOCKER_HOST_IP}:8080/starter.zip?type=maven-project&language=java&bootVersion=2.2.5.RELEASE&baseDir=demo&groupId=com.example&artifactId=demo&name=demo&description=Demo&packageName=com.example.demo&packaging=jar&javaVersion=1.8&dependencies=eventuatelocal,eventuatelocaltestsupport,eventuatetrambasicmessaging,eventuatetramdomainevents,eventuatetramcommands,eventuatetramkafka,eventuatetramactivemq,eventuatetramrabbitmqmq,eventuatetramredis,eventuatetramsagaorchestrator,eventuatetramsagaparticipant"


# ./stop.sh

rm -rf demo && rm -rf demo.zip

docker-compose up -d --build

docker ps

./_wait-for-services.sh /actuator/health 8080

#TEST gradle build

$EXEC_PREFIX curl -fail "$GRADLE_URL"  > demo.zip

unzip demo.zip
cd demo
./gradlew assemble
cd ..
rm -rf demo && rm -rf demo.zip


#Test maven build

$EXEC_PREFIX curl -fail "$MAVEN_URL" > demo.zip
unzip demo.zip
cd demo
./mvnw package -DskipTests
cd ..
rm -rf demo && rm -rf demo.zip

./stop.sh
