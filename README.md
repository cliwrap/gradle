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

Run latest gradle in current directory:

```docker run --rm -e "HOSTUID=`id -u`" -v "`pwd`:/work" -v "$HOME:/home/hostuser" wtanaka/alpine-37-uid-openjdk8-gradle /opt/gradle/bin/gradle build```

Use an older version like Gradle 2.14:

```docker run --rm -e "HOSTUID=`id -u`" -v "`pwd`:/work" -v "$HOME:/home/hostuser" wtanaka/alpine-37-uid-openjdk8-gradle:2.14 /opt/gradle/bin/gradle build```

Create a specific gradle wrapper version in the current directory:

```
rm -f tmpcidfile
docker run --cidfile=tmpcidfile -e "HOSTUID=`id -u`" \
wtanaka/alpine-37-uid-openjdk8-gradle \
sh -c "mkdir wrap; cd wrap; \
  /opt/gradle/bin/gradle wrapper --gradle-version=2.14"
docker cp `cat tmpcidfile`:/home/hostuser/wrap .
mv wrap/* .
rm -rf wrap tmpcidfile
```
