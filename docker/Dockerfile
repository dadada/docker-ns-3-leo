FROM ubuntu:19.10
LABEL Description="Docker image for NS-3 Network Simulator"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# General dependencies
RUN apt-get install -y \
  bear \
  make \
  git \
  mercurial \
  wget \
  vim \
  autoconf \
  bzr \
  cvs \
  unrar \
  build-essential \
  clang \
  valgrind \
  gsl-bin \
  libgsl-dev \
  flex \
  bison \
  libfl-dev \
  tcpdump \
  sqlite \
  sqlite3 \
  libsqlite3-dev \
  libxml2 \
  libxml2-dev \
  vtun \
  unzip \
  lxc \
  clangd

# QT components
RUN apt-get install -y \
  qtbase5-dev \
  qt4-dev-tools

# Python components
RUN apt-get install -y \
  python \
  python3 \
  python-dev \
  python3-dev \
  python-setuptools \
  python3-setuptools \
  python3-requests \
  python3-gi-cairo \
  python-gi-cairo \
  python-pygraphviz \
  python3-pygraphviz \
   python-gobject \
  python-gobject-2 \
  python3-distro \
  gir1.2-gtk-3.0 \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib

# Setup bake env
ENV BAKE_HOME=/usr/bake
ENV PATH=$PATH:$BAKE_HOME:$BAKE_HOME/build/bin
ENV PYTHONPATH=$PYTHONPATH:$BAKE_HOME:$BAKE_HOME/build/lib

# Create working directory where bake home will be mounted
RUN mkdir $BAKE_HOME
WORKDIR /usr/bake

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt

RUN useradd -ms /bin/bash user

USER user

ADD --chown=user:user ./.vimrc /home/user/.vimrc
ADD --chown=user:user ./.vim /home/user/.vim
