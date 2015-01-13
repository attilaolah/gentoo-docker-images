DIST=http://distfiles.gentoo.org/releases/amd64/autobuilds

# Step 1. Download & unpack the Stage3 tarball using only BusyBox.
busybox wget -qO- "${DIST}/$(busybox wget -qO- $DIST/latest-stage3-amd64.txt | busybox tail -n 1)" \
  | busybox bunzip2 \
  | busybox tar \
	  --exclude="./sys/.keep" \
	-vpxf -

# Step 2. Self-destruct.
busybox rm /install.sh
