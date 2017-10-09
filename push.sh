#!/bin/bash

push() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  TAG=${MESOS_VERSION}

# base
  echo
  echo Pushing axelspringer/mesos:${TAG}
  docker push axelspringer/mesos:${TAG} || exit $?
}

# login docker before push
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

#    Mesos version
push "1.4.0"
