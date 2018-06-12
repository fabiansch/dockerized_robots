#!/bin/sh

ifconfig | grep -o -e 172.17.0.[0-9]

IP=$(ifconfig | grep -o -e 172.17.0.[0-9])

xvfb-run java -jar /app/Client.jar $IP root.client1
