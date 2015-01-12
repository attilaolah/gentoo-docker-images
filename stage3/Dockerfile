FROM busybox:latest
MAINTAINER Gentoo Container Team <containers@gentoo.org>

ENV AUTOBUILDS=http://distfiles.gentoo.org/releases/amd64/autobuilds

RUN wget -qO- "${AUTOBUILDS}/$(wget -qO- $AUTOBUILDS/latest-stage3-amd64.txt | tail -n 1)" \
    | bunzip2 \
    | tar \
      --exclude="./bin/echo" \
      --exclude="./sys/.keep" \
      -vpxf -
