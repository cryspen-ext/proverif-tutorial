#!/usr/bin/env bash

set -v -e -x

apt-get -y update
apt-get install -y \
    build-essential \
    opam \
    jq \
    libgmp-dev \
    locales \
    libgmp-dev \
    openssh-server \
    curl \
    libexpat1-dev \
    libgtk2.0-dev \
    pkg-config



