#!/bin/bash
set -e
if [ -d '/var/www/html/data' ]; then
	rm -rf /tmp/file/data
fi
  cp -a /tmp/file/* /var/www/html/
  chmod -R 777 /var/www/html/
exec "$@"
