#!/bin/bash

#login to gitlab registry
docker login registry.gitlab.com

# Build boost docker image

if [ $# -eq 0 ]
  then
    echo "Usage: source push-gitlab.sh BOOST_VERSION, i.e., 1.65.1"
    exit
fi

ORG="jbeirer"
PROJECT="cmake-template"
BOOST_VERSION="$1"
BOOST_VERSION_=${BOOST_VERSION//./_}

docker build -t registry.gitlab.com/${ORG}/${PROJECT}:latest . --build-arg BOOST_VERSION=${BOOST_VERSION} \
	--build-arg BOOST_VERSION_=${BOOST_VERSION_}

docker push registry.gitlab.com/${ORG}/${PROJECT}:latest