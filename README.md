# BIND container

## Supported tags and respective `Dockerfile` links

| Tags         | Alpine   | Bind        |
|:-------------|:---------|:------------|
| `latest`     | `3.10.3` | `9.14.8-r5` |

* [latest, (latest/Dockerfile)](https://github.com/GeorgioLPB/docker-bind/blob/master/Dockerfile)

## Quick reference

* Bind
  * [BIND official website](https://www.isc.org/bind)
* Alpine Linux
  * [Alpine Linux official website](https://www.alpinelinux.org/)
  * [Alpine Linux Wiki](https://wiki.alpinelinux.org/wiki/Main_Page)
  * [Alpine Docker Official Images](https://hub.docker.com/_/alpine)

## What is BIND?

* BIND is the most widely used Domain Name System (DNS) software on the Internet.

## How to use this image

### Simple Usage

	docker run -d -p 53:53/tcp -p 53:53/udp ggregorio/bind

### Usage with persistent data

	docker run -d -p 53:53/tcp -p 53:53/udp -v $(pwd)/data:/etc/bind ggregorio/bind

## Configuration (environment variables)

None at the moment.
