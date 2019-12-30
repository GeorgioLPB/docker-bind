FROM alpine:3.11.2
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/package/v3.10/main/x86_64/bind
#
LABEL maintainer georges.gregorio@gmail.com

RUN set -eux;\
	apk add --no-cache --upgrade bind && \
	mkdir -p '/var/cache/bind' && \
	chown root:named '/var/cache/bind' && \
	chmod 770 '/var/cache/bind'

COPY bind/ /etc/bind/

#WORKDIR /etc/bind

#VOLUME [ "/etc/bind" ]

#EXPOSE 53/tcp 53/udp

CMD ["named", "-4", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
