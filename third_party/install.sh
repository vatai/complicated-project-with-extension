#!/usr/bin/bash
set -x
set -e

git init /project/isl
git -C /project/isl remote add origin /project/third_party/isl.bundle
git -C /project/isl fetch
git -C /project/isl checkout master

# yum install -y isl-devel
yum install -y gmp-c++ gmp-devel
cd /project/isl/
./autogen.sh
./configure
make -j
echo "=== include ==="
ls /project/isl/include

# cp -r /isl /project
