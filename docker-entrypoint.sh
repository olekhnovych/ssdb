#!/usr/bin/env bash
set -Eeo pipefail

if [ "$1" = 'ssdb-server' ]; then

    echo "ssdb-server starting..."
    "$@" -d -s start
    echo "ssdb-server started"

    for file in /docker-entrypoint.d/*; do
        "$file"
    done

    echo "ssdb-server stoping..."
    "$@" -d -s stop
    echo "ssdb-server stoped"
fi

exec "$@"
