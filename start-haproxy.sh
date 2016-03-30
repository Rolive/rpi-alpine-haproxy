#!/bin/bash


HAPROXY="/etc/haproxy"
OVERRIDE="/tmp/conf_override"

CONFIG="haproxy.cfg"
ERRORS="errors"

cd "$HAPROXY"

# Symlink errors directory
if [[ -d "$OVERRIDE/$ERRORS" ]]; then
  mkdir -p "$OVERRIDE/$ERRORS"
  rm -fr "$ERRORS"
        ln -s "$OVERRIDE/$ERRORS" "$ERRORS"
fi

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

exec haproxy
