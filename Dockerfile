FROM cliwrap/openjdk8
MAINTAINER http://wtanaka.com/dockerfiles
ARG GRADLE_VERSION=5.5
ENV PATH="${PATH}:/opt/gradle/bin"
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
