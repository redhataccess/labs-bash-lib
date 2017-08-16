check_port(){
    local port=$1
    local protocol=$2
    local options=''
    if [ $protocol == 'udp' ];then
        options='-u'
    else
        options=''
    fi
    serverIP="$( ip route get 8.8.8.8 | awk 'NR==1 {print $7}' )"
    echo "test" | nc $options $serverIP $port
    if [ $? -ne 0 ]; then
     echo "The port $port of protocal $protocol is not open on your server"
    fi    
}
# Usage:
# check_port  53 tcp
# check_port  53 udp