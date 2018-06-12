#!/bin/sh

echo blubb

ifconfig | grep -o -e 172.17.0.[0-9]

IP=$(ifconfig | grep -o -e 172.17.0.[0-9])

java -jar /app/Nameserver.jar 5010 5011 $IP root.blubb
