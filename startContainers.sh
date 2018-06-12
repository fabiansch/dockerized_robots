#!/bin/sh

if [ $# != 4 ]; then
  echo "Wrong amount of arguments! Following arguments needes:\n"
  echo "Amount of Containers to start"
  echo "IP where DNS is reachable"
  echo "IP where Server is reachable (localhost)"
  echo "port from where ports will be chosen incrementally"
  echo ""
  exit -1
fi

declare -i container_amout=$1
declare ip_dns=$2
declare ip_server=$3
declare -i portBegin=$4

for ((i = 0; i < $1; i++)); do
  portBegin=$portBegin+i*50
  declare -i portEnd=$portBegin+50-1
  docker run -d --name="server${i}" -e ip_dns=$ip_dns -e ip_server=$ip_server -e server_namespace_and_name="root.server${i}" -e port_begin="${portBegin}" -p "${portBegin}-${portEnd}:${portBegin}-${portEnd}/udp" server
  echo "server${i} started."
done

exit 0
