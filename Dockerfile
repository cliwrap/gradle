FROM wtanaka/alpine-37-uid-openjdk8
MAINTAINER http://wtanaka.com/dockerfiles
ARG GRADLE_VERSION=2.6
RUN mkdir -p /opt \
  && cd /tmp \
  && apk add --no-cache wget \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && cd /opt \
  && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && ln -s gradle-${GRADLE_VERSION} gradle \
  && apk del wget \
  && apk update \
  && rm -rf /var/cache/apk/*
