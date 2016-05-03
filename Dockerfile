FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
 && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get update && apt-get install -y \
      oracle-java8-installer \
      oracle-java8-set-default \
      unzip \
      wget \
 && apt-get clean \
 && rm -rf \
      /tmp/* \
      /var/tmp/* \
      /var/lib/apt/lists/* \
      /usr/lib/jvm/java-8-oracle/*src.zip
