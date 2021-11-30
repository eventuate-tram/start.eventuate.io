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
DEPS="dependencies=eventuatelocal,eventuatelocaltestsupport,eventuatetrambasicmessaging,eventuatetrambasicmessagingstarter,eventuatetramdomainevents,eventuatetramdomaineventsstarter,eventuatetramcommands,eventuatetramcommandsstarter,eventuatetramkafka,eventuatetramactivemq,eventuatetramrabbitmqmq,eventuatetramredis,eventuatetramtestingsupport,eventuatetramsagaorchestrator,eventuatetramsagaorchestratorstarter,eventuatetramsagaparticipant,eventuatetramsagaparticipantstarter,eventuatetramsagatestingsupport,eventuatelocalbom,eventuatelocaltestsupportbom,eventuatetrambasicmessagingbom,eventuatetrambasicmessagingstarterbom,eventuatetramdomaineventsbom,eventuatetramdomaineventsstarterbom,eventuatetramcommandsbom,eventuatetramcommandsstarterbom,eventuatetramkafkabom,eventuatetramactivemqbom,eventuatetramrabbitmqmqbom,eventuatetramredisbom,eventuatetramtestingsupportbom,eventuatetramsagaorchestratorbom,eventuatetramsagaorchestratorstarterbom,eventuatetramsagaparticipantbom,eventuatetramsagaparticipantstarterbom,eventuatetramsagatestingsupportbom"
OUTPUT=demo.zip

CURL_ARGS_COMMON="$URL -d $LANG -d $BOOT_VERSION -d $BASE_DIR -d $GROUP_ID -d $ARTIFACT_ID -d $NAME -d $DESCRIPTION -d $PACKAGE -d $PACKAGING -d $JAVA_VERSION -d $DEPS"

# ./stop.sh

rm -rf demo && rm -rf demo.zip

docker-compose up -d --build

docker ps

./_wait-for-services.sh /actuator/health 8080

#TEST gradle build

echo Executing: $EXEC_PREFIX curl --fail -d $GRADLE_TYPE $CURL_ARGS_COMMON
$EXEC_PREFIX curl --fail -d $GRADLE_TYPE $CURL_ARGS_COMMON > $OUTPUT

unzip demo.zip
cd demo
./gradlew assemble
cd ..
rm -rf demo && rm -rf demo.zip


#Test maven build

echo Executing: $EXEC_PREFIX curl --fail -d $MAVEN_TYPE $CURL_ARGS_COMMON
$EXEC_PREFIX curl --fail -d $MAVEN_TYPE $CURL_ARGS_COMMON > $OUTPUT

unzip demo.zip
cd demo
./mvnw package -DskipTests
cd ..
rm -rf demo && rm -rf demo.zip

./stop.sh
