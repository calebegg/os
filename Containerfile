# TODO: consider quay.io/fedora/fedora-silverblue
FROM ghcr.io/ublue-os/silverblue-main:latest

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint
    
