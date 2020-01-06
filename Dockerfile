FROM alpine:3.11.2
#
# https://hub.docker.com/_/alpine
# https://pkgs.alpinelinux.org/package/v3.11/main/x86_64/bind
#
LABEL maintainer georges.gregorio@gmail.com

ENV \
	s6_release='1.22.1.0' \
	s6_arch='amd64' \
	s6_sha256='73f9779203310ddf9c5132546a1978e1a2b05990263b92ed2c34c1e258e2df6c'

ADD "https://github.com/just-containers/s6-overlay/releases/download/v${s6_release}/s6-overlay-${s6_arch}.tar.gz" /tmp/

RUN set -eux; \
	apk add --no-cache --upgrade bind && \
	cd /tmp && \
	echo "${s6_sha256} *s6-overlay-${s6_arch}.tar.gz" | sha256sum -c - && \
	tar -xzvf "/tmp/s6-overlay-${s6_arch}.tar.gz" -C / && \
	rm -fv "/tmp/s6-overlay-${s6_arch}.tar.gz"

COPY --chown=root:root config.init /etc/cont-init.d/00-config
COPY --chown=root:root smbd.run /etc/services.d/bind/run

WORKDIR /etc/bind

VOLUME [ "/etc/bind" ]

EXPOSE 53/tcp 53/udp

CMD [ "/init" ]
