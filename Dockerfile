FROM gitpod/openvscode-server:latest

USER root
RUN apt-get -y update && apt-get install -y \
    nodejs \
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

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

USER openvscode-server

ADD tools.sh /tmp/tools.sh
RUN bash /tmp/tools.sh

ENV CARGO_HOME="/home/workspace/.cargo"
ENV RUSTUP_HOME="/home/workspace/.rustup"
ENV PATH="/home/workspace/.opam/5.1.1/bin/:$PATH"
ENV OPENVSCODE_SERVER_ROOT="/home/.openvscode-server"
ENV OPENVSCODE="${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server"

SHELL ["/bin/bash", "-c"]
RUN \
    # Direct download links to external .vsix not available on https://open-vsx.org/
    # The two links here are just used as example, they are actually available on https://open-vsx.org/
    # urls=(\
    #    https://github.com/rust-lang/rust-analyzer/releases/download/2022-12-26/rust-analyzer-linux-x64.vsix \
    #    https://github.com/VSCodeVim/Vim/releases/download/v1.24.3/vim-1.24.3.vsix \
    #)\
    # Create a tmp dir for downloading
    # && tdir=/tmp/exts && mkdir -p "${tdir}" && cd "${tdir}" \
    # Download via wget from $urls array.
    # && wget "${urls[@]}" && \
    # List the extensions in this array
    exts=(\
        # From https://open-vsx.org/ registry directly
        rust-lang.rust-analyzer \
        ProVerif.vscode-proverif \
        # From filesystem, .vsix that we downloaded (using bash wildcard '*')
        #"${tdir}"/* \
    )\
    # Install the $exts
    && for ext in "${exts[@]}"; do ${OPENVSCODE} --install-extension "${ext}"; done
