#!/bin/bash
set -e
if [ ! -d '/var/www/html/index.php' ]; then
  cp -a /tmp/file/* /var/www/html/
fi
  chmod -R 777 /var/www/html/
exec "$@"
