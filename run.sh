#!/bin/sh

if [[ -z "${CHAT_NAME}" ]]; then
  echo "\$CHAT_NAME is not set"
  exit
fi

if [ ! -f "/volumes/config/auth" ]; then
  echo "You have to authenticate, then auth file will be saved\n\n"
  exec telegram-cli -c /config.conf -e quit
else
  mkdir -p /volumes/config /volumes/downloads/incomplete /volumes/downloads/complete
  exec telegram-cli -c /config.conf --disable-output -s /script.lua
fi


