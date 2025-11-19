#!/bin/sh
set -x
set -e

if [ -z ${CIBUILDWHEEL+x} ]; then
    REPO_ROOT="$(git rev-parse --show-toplevel)"
    PREFIX="$REPO_ROOT/third_party/opt"
else
    PREFIX=/usr/local
fi
if [ -e "$REPO_ROOT/third_party/isl.bundle" ]; then
    ORIGIN="$REPO_ROOT/third_party/isl.bundle"
elif [ -e /project/third_party/isl.bundle ]; then
    ORIGIN=/project/third_party/isl.bundle
else
    ORIGIN=https://repo.or.cz/isl.git
fi

git init /tmp/isl
git -C /tmp/isl remote add origin "$ORIGIN"
git -C /tmp/isl fetch
git -C /tmp/isl checkout master

# yum install -y isl-devel
if [ -e "$(which yum)" ]; then
    yum install -y gmp-c++ gmp-devel
fi
if [ -e "$(which apk)" ]; then
    apk add gmp
    apk add gmp-dev
fi
cd /tmp/isl/
./autogen.sh
./configure --prefix=$PREFIX
make -j install

# cp -r /isl /project
