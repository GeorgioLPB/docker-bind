FROM alpine:3.11.2
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/package/v3.11/main/x86_64/bind
#
LABEL maintainer georges.gregorio@gmail.com

ENV \
	s6_release='1.22.1.0'

ADD "https://github.com/just-containers/s6-overlay/releases/download/v${s6_release}/s6-overlay-armhf.tar.gz" /tmp/

RUN set -eux; \
	apk add --no-cache --upgrade bind && \
	tar -xzvf /tmp/s6-overlay-armhf.tar.gz -C / && \
	rm -fv /tmp/s6-overlay-armhf.tar.gz

COPY --chown=root:root config.init /etc/cont-init.d/00-config
COPY --chown=root:root smbd.run /etc/services.d/bind/run

WORKDIR /etc/bind

VOLUME [ "/etc/bind" ]

EXPOSE 53/tcp 53/udp

CMD [ "/init" ]
