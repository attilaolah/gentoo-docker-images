DIST=http://distfiles.gentoo.org/releases/amd64/autobuilds

die(){ echo "$@" 1>&2; exit 1; }

# Step 1: Remove BusyBox symlinks.
busybox find /bin -maxdepth 1 -type l -print0 | xargs -0 busybox rm \
  || die "Failed to remove BusyBox."

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
  || die "Failed to clean up the environment."

# Step 3. Swap /lib{64,} symlinks.
busybox cp -r /lib64 /libtmp
busybox ln -sf libtmp /lib

# Step 3. Download & unpack the Stage3 tarball using only BusyBox.
busybox wget -qO- "${DIST}/$(busybox wget -qO- $DIST/latest-stage3-amd64.txt | busybox tail -n 1)" \
  | busybox bunzip2 \
  | busybox tar \
	  --exclude="./sys/.keep" \
	-vpxf - \
  || die "Failed to download and extract BusyBox."

# Step 4. Self-destruct.
busybox rm /install.sh
