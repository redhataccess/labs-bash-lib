# firewall-cmd syntax used as example:"
# rpcinfo -p | awk '{if($1 ~ /[[:digit:]]+/){print "firewall-cmd --add-port=" $4 "/" $3}}' | sort | uniq

enable_permanent_firewall(){
    local port=$1
    local protocol=$2
    systemctl status firewalld
    if [ $? == 0 ]; then
      firewall-cmd --permanent --add-port=$port/$protocol
      firewall-cmd --reload
    fi
}
# Usage:
# enable_permanent_firewall 53 tcp
# enable_permanent_firewall 53 udp

enable_runtime_firewall(){
    local port=$1
    local protocol=$2
    systemctl status firewalld
    if [ $? == 0 ]; then
      firewall-cmd --permanent --add-port=$port/$protocol
    fi
}

# Usage:
# enable_runtime_firewall 53 tcp
# enable_runtime_firewall 53 udp