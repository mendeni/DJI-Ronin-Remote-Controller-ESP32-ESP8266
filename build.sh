#!/bin/sh

set -eux

cd Code

arduino-cli compile --fqbn esp32:esp32:esp32 Ronin_Remote_Controller_ESP32 --libraries Libraries --log

case "${1:-}" in
  noupload|--no-upload|-n)
    echo "Skipping upload (arg: ${1:-})"
    ;;
  *)
    PORT=${PORT:-/dev/tty.usbserial-0001}
    echo "Uploading to ${PORT}..."
    arduino-cli upload Ronin_Remote_Controller_ESP32 -p "$PORT" --fqbn esp32:esp32:esp32 -v
    ;;
esac
