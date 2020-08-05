#!/bin/sh
set -e

if [ -n "$*" ]; then
  exec /bin/sh -c "$@"
fi

SQUID_OPTS="--foreground -f /etc/squid/squid.conf"

# Listen udp port 9000 to redirect logs to stderr.
env -i nc -ulk -p 9000 127.0.0.1 >&2 &
env -i /usr/sbin/squid ${SQUID_OPTS} -z
exec env -i /usr/sbin/squid ${SQUID_OPTS}
