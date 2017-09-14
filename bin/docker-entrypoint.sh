#!/usr/bin/env sh
set -e

for f in /etc/docker-entrypoint.d/*; do
    if [ -f "$f" ]; then
        echo "running $f"; . "$f"
    fi
done

echo "starting $@"
exec "$@"
