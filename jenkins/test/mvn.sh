#! /bin/bash

echo "****************************"
echo "**** testing the jar ****"
echo "****************************"

WORKSPACE=/Users/vinays8118/Documents/Docker-Images/jenkins/jenkins_home/workspace/pipeline1

docker run --rm  -v $WORKSPACE/gitClient:/app -v /Users/vinays8118/dockermount_share/.m2:/root/.m2 -w /app maven:3-alpine "$@"
