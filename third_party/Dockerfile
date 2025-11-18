# build with: podman build third_party
# or
FROM quay.io/pypa/manylinux_2_28_x86_64
RUN yum install -y gmp-c++ gmp-devel
ADD isl.bundle .
RUN git init /isl
RUN git -C /isl remote add origin /isl.bundle
RUN git -C /isl fetch
RUN git -C /isl checkout master
WORKDIR /isl
RUN pwd
RUN ls -a
RUN ./autogen.sh && ./configure && make -j
