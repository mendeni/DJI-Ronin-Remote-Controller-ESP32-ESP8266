#!/bin/sh -x -e

cd Code

arduino-cli compile --fqbn esp32:esp32:esp32 Ronin_Remote_Controller_ESP32 --libraries Libraries --log

arduino-cli upload Ronin_Remote_Controller_ESP32 -p /dev/tty.usbserial-0001 --fqbn esp32:esp32:esp32 -v
