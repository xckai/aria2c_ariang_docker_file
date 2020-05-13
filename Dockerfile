FROM alpine:latest

MAINTAINER xckai <xckai123@gmail.com>

ENV TZ=Asia/Shanghai

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 &&\
  apk add --update darkhttpd

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh
ADD files/AriaNg /webui
RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 80 6800 6881 6881/udp

CMD ["/conf-copy/start.sh"]