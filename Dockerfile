FROM ubuntu:focal

MAINTAINER Matt Public <mattpublic@home>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -q -y update && \
 	apt-get -q -y install --no-install-recommends \
		isc-dhcp-server \
		&& \
 	apt-get -q -y autoremove  && \
 	apt-get -q -y clean  && \
 	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/data/dhcpd.conf", "-lf", "/var/dhcpd.leases"]
