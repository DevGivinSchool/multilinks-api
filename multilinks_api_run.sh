#!/bin/bash
app_name=multilinks-api
image_name=devgivinschool/$app_name:latest
user_id=$(id -u $app_name)

echo -e "\n==> datetime now"
date

set -o pipefail
echo -e "\n==> docker stop $app_name"
docker stop $app_name
echo -e "\n==> docker rm $app_name"
docker rm $app_name

set +o pipefail
echo -e "\n==> docker pull $image_name"
docker pull $image_name
echo -e "\n==> docker run"
docker run --name $app_name  --user $userid:$userid --restart=always --net=gs_network -d $image_name
echo -e "\n==> Container info"
docker ps --filter "name=$app_name"
echo -e "\n==> Container Image SHA256"
docker inspect --format='{{.Image}}' $app_name
echo -e "\n==> Image SHA256"
docker inspect --format='{{.Id}}' $image_name
echo -e "\n==> RepoDigests SHA256"
docker inspect --format='{{index .RepoDigests 0}}' $image_name
