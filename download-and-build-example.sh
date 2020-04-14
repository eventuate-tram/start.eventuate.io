#! /bin/bash

set -e

URL="http://${DOCKER_HOST_IP}:8080/starter.zip"
GRADLE_TYPE="type=gradle-project"
MAVEN_TYPE="type=maven-project"
LANG="language=java"
BOOT_VERSION="bootVersion=2.2.5.RELEASE"
BASE_DIR="baseDir=demo"
GROUP_ID="groupId=com.example"
ARTIFACT_ID="artifactId=demo"
NAME="name=demo"
DESCRIPTION="description=Demo"
PACKAGE="packageName=com.example.demo"
PACKAGING="packaging=jar"
JAVA_VERSION="javaVersion=1.8"
DEPS="dependencies=eventuatelocal,eventuatelocaltestsupport,eventuatetrambasicmessaging,eventuatetramdomainevents,eventuatetramcommands,eventuatetramkafka,eventuatetramactivemq,eventuatetramrabbitmqmq,eventuatetramredis,eventuatetramtestingsupport,eventuatetramsagaorchestrator,eventuatetramsagaparticipant,eventuatetramsagatestingsupport"
OUTPUT=demo.zip

CURL_ARGS_COMMON="$URL -d $LANG -d $BOOT_VERSION -d $BASE_DIR -d $GROUP_ID -d $ARTIFACT_ID -d $NAME -d $DESCRIPTION -d $PACKAGE -d $PACKAGING -d $JAVA_VERSION -d $DEPS -o $OUTPUT"

# ./stop.sh

rm -rf demo && rm -rf demo.zip

docker-compose up -d --build

docker ps

./_wait-for-services.sh /actuator/health 8080

#TEST gradle build

$EXEC_PREFIX curl --fail -d $GRADLE_TYPE $CURL_ARGS_COMMON

sleep 10

unzip demo.zip
cd demo
./gradlew assemble
cd ..
rm -rf demo && rm -rf demo.zip


#Test maven build

$EXEC_PREFIX curl --fail -d $MAVEN_TYPE $CURL_ARGS_COMMON

sleep 10

unzip demo.zip
cd demo
./mvnw package -DskipTests
cd ..
rm -rf demo && rm -rf demo.zip

./stop.sh
