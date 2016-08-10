FROM ubuntu:16.04

RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y install gcc g++ ccache ninja-build cmake time
RUN apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386

VOLUME /opencv
VOLUME /opencv_contrib
VOLUME /cache

ADD cmake-*-Linux-*.tar.gz  /cmakes/

ADD entry.sh /

ENV CCACHE_DIR=/cache
ENV CCACHE_MAXSIZE=10G
ENV CCACHE_SLOPPINESS=file_macro

CMD time -v /entry.sh
