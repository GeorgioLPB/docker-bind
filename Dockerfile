FROM alpine:3.10.2
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/package/v3.10/main/x86_64/bind
#
LABEL \
	ClamAV 9.14.3-r0 \
	Alpine 3.10.2 \
	maintainer georges.gregorio@gmail.com

ENV \
	BIND="9.14.3-r0" \
	Alpine="3.10.2"

RUN set -eux;\
	#
	# Install ClamAV
	#
	apk add --no-cache --upgrade bind && \
	#
	# Folder configuration
	#
	mkdir -p '/var/cache/bind' && \
	chown root:named '/var/cache/bind' && \
	chmod 770 '/var/cache/bind'

COPY bind/ /etc/bind/

VOLUME [ "/etc/bind" ]

EXPOSE 53/tcp 53/udp

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]

