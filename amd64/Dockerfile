FROM busybox:latest
MAINTAINER Gentoo Container Team <containers@gentoo.org>

ENV DIST=http://distfiles.gentoo.org/releases/amd64/autobuilds

RUN \
    # Step 1: Remove BusyBox symlinks.
    find /bin -maxdepth 1 -type l -print | xargs rm \
  && \
    # Step 2: Remove as many things as we can.
    busybox rm \
        /home \
        /media \
        /mnt \
        /opt \
        /root \
        /run \
        /tmp \
        /usr \
        /var \
      -rvf \
  && \
    # Step 3. Download & unpack the Stage3 tarball using only BusyBox.
    busybox wget -qO- "${DIST}/$(busybox wget -qO- $DIST/latest-stage3-amd64.txt | busybox tail -n 1)" \
      | busybox bunzip2 \
      | busybox tar \
          --exclude="./sys/.keep" \
        -vpxf -
