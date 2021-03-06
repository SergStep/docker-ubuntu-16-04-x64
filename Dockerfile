# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER bidnichenko <bidnichenko.alex@apriorit.com>

ENV DEBIAN_FRONTEND noninteractive
#uncomment all src repositories
RUN sed -i -- 's/#deb-src/deb-src/g' /etc/apt/sources.list && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y bison++ unzip libssl-dev libprocps4-dev libxalan-c-dev libxerces-c-dev libnl-3-dev \
libcrypto++-dev libcrypto++9v5 libpcre++-dev uuid-dev libsnappy-dev build-essential libboost-all-dev cmake maven libicu-dev \
zlib1g-dev liblog4cpp5-dev libncurses5-dev libselinux1-dev wget libsqlite3-dev google-mock libvirt-dev libmysqlclient-dev \
libjpeg-turbo8-dev libnuma-dev libxml2-dev qtbase5-dev qtdeclarative5-dev libgcrypt20-dev libglib2.0-dev libpixman-1-dev \
libhivex-dev libguestfs-dev libedit-dev g++-multilib

RUN wget http://nixos.org/releases/patchelf/patchelf-0.8/patchelf-0.8.tar.gz && tar xf patchelf-0.8.tar.gz && patchelf-0.8/configure && make install && rm -rf patchelf-0.8 && rm -f patchelf-0.8.tar.gz
RUN apt-get upgrade -y
RUN apt-get build-dep -y qemu-kvm
RUN apt-get install -y snapcraft
