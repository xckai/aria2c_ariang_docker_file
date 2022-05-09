#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
fi
if [ $SECRET ]; then
	echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi
chmod +x /conf/on-complete.sh

if [ ! -f /conf/aria2.session ]; then
  touch /conf/aria2.session
fi

darkhttpd /webui --port 80 &
aria2c --conf-path=/conf/aria2.conf