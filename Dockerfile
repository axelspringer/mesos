FROM ubuntu:xenial
MAINTAINER Sebastian Doell <sebastian@pixelmilk.com>

ARG MESOS_VERSION
ENV VERSION ${MESOS_VERSION}

RUN echo "deb http://repos.mesosphere.io/ubuntu/ xenial main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y --no-install-recommends install curl mesos=${VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
