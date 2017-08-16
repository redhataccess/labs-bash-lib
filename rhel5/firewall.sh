# echo "The following ports must be opened in your firewall to allow NFS mounts, /etc/sysconfig/iptables syntax used:"
# rpcinfo -p | awk '{if($1 ~ /[[:digit:]]+/){print "-I INPUT -p " $3 " -m " $3 " --dport " $4 " -j ACCEPT"}}' | sort | uniq


enable_permanent_firewall(){
    local port=$1
    local protocol=$2
    lsmod | grep ip_tables
    if [ $? == 0 ]; then
      iptables -I INPUT -p $protocol --dport $port -m state --state NEW -j ACCEPT
      service iptables save
      service iptables restart
    fi
}
# Usage:
# enable_permanent_firewall 53 tcp
# enable_permanent_firewall 53 udp