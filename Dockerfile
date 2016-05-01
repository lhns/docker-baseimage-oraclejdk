FROM phusion/baseimage:latest
MAINTAINER LolHens <pierrekisters@gmail.com>

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y \
    oracle-java8-installer \
    oracle-java8-set-default
