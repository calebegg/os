FROM quay.io/fedora/fedora-silverblue:latest

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh

