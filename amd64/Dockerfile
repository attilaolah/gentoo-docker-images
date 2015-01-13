FROM gentoo/busybox:1.23.0
MAINTAINER Gentoo Container Team <containers@gentoo.org>

# Run the install script with the bootstrapped BusyBox:
ADD install.sh /
RUN ["/bin/busybox", "sh", "install.sh"]
