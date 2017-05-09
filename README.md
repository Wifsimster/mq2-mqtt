# Send MQ2 data through an ESP8266 to a MQTT broker

This LUA script is for ESP8266 hardware.

## Description

MQTT client publising MQ2 data to a MQTT broker each time data changes.

## Files

* ``config.lua``: Configuration variables
* ``init.lua``: Connect to a wifi AP and then execute main.lua file
* ``main.lua``: Main file

## Principle

1. Start a MQTT client and then try to connect to a MQTT broker
2. Publish data to MQTT broker each time a data changes

## Scheme

// TODO
