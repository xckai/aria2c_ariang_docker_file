#!/bin/sh
if [ $2 -eq 1 ]; then
	mv "$3" /downloads
fi
echo [$(date)] $2, $3, $1 "<br>" >> /downloads/_log.html