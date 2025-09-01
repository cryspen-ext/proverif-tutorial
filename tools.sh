#!/usr/bin/env bash

set -v -e -x


export CARGO_HOME="/home/workspace/.cargo"
export RUSTUP_HOME="/home/workspace/.rustup"
curl https://sh.rustup.rs -sSf | bash -s -- -y
source "$HOME/.cargo/env"

# Prepare the sources
opam init --bare --disable-sandboxing
opam switch create 5.1.1
eval $(opam env)

# OPAM_YES=true opam install --yes ocamlfind visitors menhir ppx_deriving_yojson sedlex wasm fix process pprint zarith yaml easy_logging terminal memtrace stdint batteries
OPAM_YES=true opam install --yes proverif

# Install hax
curl -L https://github.com/cryspen/hax/archive/refs/tags/cargo-hax-v0.3.0.zip --output hax.zip
unzip hax.zip
rm -f hax.zip
mv hax-cargo-hax-v0.3.0 hax
cd hax
./setup.sh -j 2
cd ~/

# # Get F* and HACL* for running proofs
# curl -L https://github.com/FStarLang/FStar/archive/refs/tags/v2024.01.13.zip --output Fstar.zip
# unzip Fstar.zip
# rm -f Fstar.zip
# mv FStar-2024.01.13 fstar
# cd fstar/ocaml
# dune build
# dune install
# cd $HOME

# curl -L https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.12.6.zip --output z3.zip
# unzip z3.zip
# rm -f z3.zip
# cd z3-z3-4.12.6
# python3 scripts/mk_make.py
# cd build
# make -j4
# cd $HOME

# curl -L https://github.com/hacl-star/hacl-star/archive/refs/heads/main.zip \
#     --output hacl-star.zip
# unzip hacl-star.zip
# rm -rf hacl-star.zip
# mv hacl-star-main/ hacl-star

# echo "export FSTAR_HOME=$HOME/fstar" >>$HOME/.bashrc
# echo "export FSTAR_BIN='$HOME/.opam/4.14.1/bin/fstar.exe --z3version 4.12.6'" >>$HOME/.bashrc
# echo "export HACL_HOME=$HOME/hacl-star" >>$HOME/.bashrc
# echo "export HAX_HOME=$HOME/hax" >>$HOME/.bashrc
# echo "export PATH=\"${PATH}:$HOME/fstar/bin:$HOME/z3-z3-4.12.6/build\"" >>$HOME/.bashrc
# echo "alias fstar.exe='fstar.exe --z3version 4.12.6'" >>$HOME/.bashrc
echo "eval $(opam env)" >>$HOME/.bashrc
echo "source $CARGO_HOME/env" >>$HOME/.bashrc

# export PATH="${PATH}:$HOME/z3-z3-4.12.6/build"
# cd $HOME/fstar
# sed -i 's/MY_FSTAR=\$(FSTAR) /MY_FSTAR=\$(FSTAR) --z3version 4.12.6 /g' ulib/gmake/Makefile.tmpl
# make -j
