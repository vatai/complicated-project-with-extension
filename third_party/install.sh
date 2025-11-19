#!/bin/sh
set -x
set -e

git init /project/isl
git -C /project/isl remote add origin /project/third_party/isl.bundle
git -C /project/isl fetch
git -C /project/isl checkout master

# yum install -y isl-devel
if [ -e "$(which yum)" ]; then
    yum install -y gmp-c++ gmp-devel
fi
if [ -e "$(which apk)" ]; then
    apk add gmp
    apk add gmp-dev
fi

cd /project/isl/
./autogen.sh
./configure
make -j

# cp -r /isl /project
