#! /bin/bash

echo "****************************"
echo "**** Building jar ****"
echo "****************************"

WORKSPACE=/Users/giriadini/Documents/Docker-Images/jenkins/jenkins_home/workspace/pipeline1

docker run --rm  -v $WORKSPACE/gitClient:/app -v /Users/vinays8118/dockermount_share/.m2:/root/.m2 -w /app maven:3-alpine "$@"
