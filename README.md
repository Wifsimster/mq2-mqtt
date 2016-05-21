# Send DS18B20 data through an ESP8266 to a MQTT broker

This LUA script is for ESP8266 hardware.

## Description

MQTT client publising DS18B20 data to a MQTT broker each time data changes.

##Files
* ``config.lua``: Configuration variables
* ``init.lua``: Connect to a wifi AP and then execute main.lua file
* ``main.lua``: Main file
* ``ds18b20.lua``: DS18B20 library

## Principle

1. Start a MQTT client and then try to connect to a MQTT broker
2. Publish data to MQTT broker each time a data changes

## Scheme

![scheme](https://github.com/Wifsimster/ds18b20-mqtt/blob/master/scheme.png)
