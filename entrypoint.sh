#!/bin/bash
set -eu
rm -f tmp/pids/server.pid
exec "$@"
