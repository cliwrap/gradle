[![Build
Status](https://travis-ci.org/wtanaka/docker-alpine-37-uid-openjdk8-gradle.svg?branch=master)](https://travis-ci.org/wtanaka/docker-alpine-37-uid-openjdk8-gradle)

The `Dockerfile` in this repository builds an `alpine:3.7` container
which lets you run commands inside the container using a UID and GID
which are passed in environment variables from outside the container,
so that any files created in a volume mount can be created as the user
and group who initiated `docker run`.  It also has `openjdk8-gradle` and
gradle installed.

To download: [`docker pull wtanaka/alpine-37-uid-openjdk8-gradle`](https://hub.docker.com/r/wtanaka/alpine-37-uid-openjdk8-gradle/)

Examples
--------

```docker run --rm -e "HOSTUID=`id -u`" -v "`pwd`:/work" -v "$HOME:/home/hostuser" wtanaka/alpine-37-uid-openjdk8-gradle gradle build```
