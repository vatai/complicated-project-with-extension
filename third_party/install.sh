#!/bin/sh
set -x
set -e

if [ -z ${var+x} ]; then
    REPO_ROOT="$(git rev-parse --show-toplevel)"
    PREFIX="$REPO_ROOT/third_party/opt"
    ORIGIN="$REPO_ROOT/third_party/isl.bundle"
else
    PREFIX=/usr/local
    ORIGIN=/project/third_party/isl.bundle
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
