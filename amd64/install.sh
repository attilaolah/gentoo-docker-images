dist="http://distfiles.gentoo.org/releases/amd64/autobuilds"
stage3="$(busybox wget -qO- $dist/latest-stage3-amd64.txt | busybox tail -n 1)"

busybox echo "Downloading and extracting ${stage3}..."
busybox wget "${dist}/${stage3}" -qO- \
  | busybox tar \
    --exclude="./sys/*" \
    --exclude="./etc/hosts" \
    -pxjf -
busybox rm install.sh

busybox echo "Bootstrapped ${stage3} into /:"
busybox ls --color -lah
