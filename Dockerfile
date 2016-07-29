FROM lolhens/baseimage:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


COPY ["bin/cleanjava", "/tmp/"]
RUN chmod +x /tmp/cleanjava

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
 && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get update \
 && apt-get -y install \
      oracle-java8-installer \
      oracle-java8-set-default \
 && /tmp/cleanjava \
 && cleanimage
