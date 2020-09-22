d#!/bin/sh

echo "***************Push image ***************"

IMAGE="gitclient"


echo "***************Tag image ***************"


docker tag $IMAGE:$BUILD_ID vinays8118/$IMAGE:$BUILD_ID

echo "*****pushing the image"

docker push vinays8118/$IMAGE:$BUILD_ID

