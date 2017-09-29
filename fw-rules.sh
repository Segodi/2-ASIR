#/bin/sh

### SCRIPT IPTABLES CACA ###

## FROM LAN -> DMZ

# DNS (unicas que estan bien)
iptables -A FORWARD -i eth2 -p udp --dport 53 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -p udp --sport 53 -o eth2 -j ACCEPT
#SSH
iptables -A FORWARD -i eth2 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -o eth2 -p tcp --sport 22 -j ACCEPT
#HTTP
iptables -A FORWARD -i eth2 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -o eth2 -p udp --sport 80 -j ACCEPT
#HTTP'
iptables -A FORWARD -i eth2 -p tcp --dport 8080 -j ACCEPT
iptables -A FORWARD -o eth2 -p tcp --sport 8080 -j ACCEPT
#PING
iptables -A FORWARD -i eth2 -p icmp -j ACCEPT
iptables -A FORWARD -o eth2 -p icmp -j ACCEPT
#FORBID EVERYTHING 
iptables -A FORWARD -o eth2 -j DROP
#TODOS LOS FORWARD -o (No lo necesitamos, porque se hace con las reglas individuales)
iptables -A FORWARD -o eth2 -m state --state STATE,STABLISHED -j ACCEPT 


## FROM LAN & DMZ -> WAN



