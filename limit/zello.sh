#!/bin/bash

echo DENY ZELLO

#SERVERS
ip[1]=184.173.145.0/24
ip[2]=184.173.146.0/24
ip[3]=184.173.136.0/24

function deny_zello()
{
        for j in ${ip[@]}
         do
            iptables -$1 FORWARD -d $j  -j DROP
         done
}



deny_zello D
deny_zello A

