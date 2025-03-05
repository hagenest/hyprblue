FROM ghcr.io/ublue-os/base-main:latest

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:stable
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY hypr.sh /tmp/hypr.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/hypr.sh && \
    ostree container commit

COPY config/ /etc/skel/.config/

COPY uwsm-hypr.sh /etc/profile.d/uwsm-hypr.sh

RUN ostree container commit