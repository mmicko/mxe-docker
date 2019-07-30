FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Vienna

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update \
    && apt-get -y install p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils g++-multilib libc6-dev-i386 libtool-bin libgdk-pixbuf2.0-dev lzip apt-utils tclsh tzdata

RUN cd /usr/local/src && \
	git clone https://github.com/mxe/mxe.git && \
	cd mxe && \
	make -j$(nproc) MXE_PLUGIN_DIRS="plugins/tcl.tk" MXE_TARGETS="i686-w64-mingw32.static" gcc tcl readline

ENV PATH /usr/local/src/mxe/usr/bin:$PATH

WORKDIR /work