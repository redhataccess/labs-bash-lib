
find_available_ports(){
	local port=$1
	local port_number=$2
	local count=0
	local ports=()
	# echo $count $port_number
	while [ "$count" -lt "$port_number" ]; do
	    netstat -a | grep ":$port\s" > /dev/null
	    if [ $? -ne 0 ]; then
	        ports[$count]=$port
	        count=`expr $count + 1`
	    fi
	    port=`expr $port + 1`
	done
	echo ${ports[@]}
}

# Usage:
ports=$(find_available_ports 5901 3)
echo ${ports[@]}
