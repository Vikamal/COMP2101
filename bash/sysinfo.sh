#!/bin/bash
#creat Variables
#variable for FQDN
NAME=$(hostname --fqdn)
#Variable for OS
OS=$(hostnamectl | grep -w 'Operating System')
#VAriable for IP addr
IP_ADDR=$(hostname -I)
#Variable for Space
SPACE=$(df -h ./ | grep -w "/" | awk '{print $4}')
#EOF command
cat <<EOF
Report for $NAME
=========
FQDN: $NAME
$OS
IP Address: $IP_ADDR
Root FIlesystem Free Space: $SPACE
=========
EOF


#FQDN
#hostname --fqdn

#The operating system name and version
#hostnamectl

#Ip addresses
#hostname -I

#he amount of space available in only the root filesystem
#df -h ./



exit
