#!/bin/bash

build() {
  MESOS_VERSION=$1

  TAG=${MESOS_VERSION}

# base
  docker build \
    --compress \
    --squash \
    -t axelspringer/mesos \
    --build-arg MESOS_VERSION=${TAG} \
    . || exit $?

# tag
  echo
  echo Tagging axelspringer/mesos:${TAG}
  docker tag axelspringer/mesos axelspringer/mesos:${TAG} \
    || exit $?
}

#     Mesos version
build "1.4.0"