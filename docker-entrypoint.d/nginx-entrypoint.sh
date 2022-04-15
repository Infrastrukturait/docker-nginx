#!/bin/sh
set -eou pipefail

sh -c "/usr/local/bin/nginx-auto-reloader.sh &"
exec "$@"
