#!/bin/bash

build() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  TAG=${MESOS_VERSION}-${MESOSPHERE_TAG}

# base
  docker build \
    --compress \
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

#     Mesos version   Mesosphere tag
build "1.3.0"	  	    "2.0.3"