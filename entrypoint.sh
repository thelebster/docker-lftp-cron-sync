#!/bin/sh
set -e

mkdir -p ${FTP_TARGET}

exec "$@"
