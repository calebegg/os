FROM quay.io/fedora/fedora-silverblue:latest

COPY system_files /tmp/system_files
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh

