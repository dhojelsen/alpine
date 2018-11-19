FROM scratch
ADD rootfs.tar.gz /

MAINTAINER David Højelsen <dwh@monosolutionscom>
LABEL name="Alpine base image" \
    vendor="Alpine" \
    license="GPLv2" \
    build-date="20181103"

RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk upgrade --update-cache --available && \
	sync 

RUN apk del syslinux

RUN apk update && \
	apk add \
		bash \
        cloud-init \
        grub \
		grub-bios \
        linux-firmware \
		linux-vanilla

# vim: set tabstop=4 shiftwidth=4:
