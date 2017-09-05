#!/bin/bash

build() {
  MESOS_VERSION=$1

  TAG=${MESOS_VERSION}

# base
  docker build \
    --compress \
    --squash \
    -t pixelmilk/mesos \
    --build-arg MESOS_VERSION=${TAG} \
    . || exit $?

# tag
  echo
  echo Tagging pixelmilk/mesos:${TAG}
  docker tag pixelmilk/mesos pixelmilk/mesos:${TAG} \
    || exit $?
}

# curl http://169.254.169.254/latest/meta-data/local-ipv4

#     Mesos version
build "1.3.1"