#!/bin/sh

echo blubb

ifconfig | grep -o -e 172.17.0.[0-9]

IP=$(ifconfig | grep -o -e 172.17.0.[0-9])

java -jar /app/Registry.jar $IP 1234 1235
