#!/bin/bash

ADMINS=10.134.5.0/24
ME=10.111.1.3/32

# DEBUG
function run()
{
 echo $@
 $@
}

function flush_tables()
{
 run iptables -F
}

flush_tables


function allow_ssh()
{
  run iptables -A INPUT -p tcp -s ${1} --dport 22 -j ACCEPT
}

allow_ssh ${ADMINS}
allow_ssh ${ME}

# And Deny from all
run iptables -A INPUT -p tcp --dport 22 -j DROP

