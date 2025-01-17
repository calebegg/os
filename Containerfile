# TODO: consider quay.io/fedora/fedora-silverblue
FROM ghcr.io/ublue-os/silverblue-main:latest

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh

