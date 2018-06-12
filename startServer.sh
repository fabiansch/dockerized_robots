#!/bin/sh

echo "run this script indirectly through startContainers.sh. If not, assure that following env variables are set:\n"
echo "ip_dns"
echo "[ip_server] default: docker containers ip"
echo "[server_namespace_and_name] default: root.serverDefault"
echo "[port_begin] default: randomly chosen ports\n"

echo "ip_dns: ${ip_dns}"

echo "${ip_dns}:4000" > ~/.config/haw_vs/dns_host
echo "root/registration" >> ~/.config/haw_vs/dns_host

ip_container=$(cat /etc/hosts | tail -n 1 | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
echo "ip_container: ${ip_container}"

if [ $ip_server = "docker_container_ip" ];
then
  ip_server = $ip_container
fi

echo "ip_server: ${ip_server}"

xvfb-run java -jar /app/Server.jar $ip_server $server_namespace_and_name $robot_type $port_begin
