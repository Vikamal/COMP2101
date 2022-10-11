
#!/bin/bash

#my script
#task 1:

#which command to see if it is on my system

which lxd >/dev/null
if [ $? -ne 0 ]; then
	#install lxd
	echo "installing lxd, may ask for password"
	sudo snap install lxd
	if [ $? -ne 0 ]; then
	#failed to install
	echo "failed to install lxd"
	exit 1
	fi
fi
# installed successeful
# task 2

#check lxd interface
ip addr | grep -w lxdbr0
#SEND message error to null
ip addr | grep -w lxdbr0 >/dev/null
if [ $? -ne 0 ]; then
	#install interface
	lxd init --auto
	if [ $? -ne 0 ]; then
	#failed to install
	echo "failed to install interface"
	exit 1
	fi
fi
#TASK 3:
#check and install container
sudo lxc start COMP2101-F22 >/dev/null
#check if I have this contauner
if [ $? -ne 0 ]; then
	#install ubuntu
	lxc launch ubuntu:20.04 COMP2101-F22
	#check again if it thare
	lxc list | grep -w COMP2101-F22
	if [ $? -ne 0 ]; then
	#failed to install
	echo "failed to install interface"
	exit 1
	fi
fi
#TASK 4:
#put in sleep
sleep 3
#change perrmossion on hosts file
sudo chmod 777 /etc/hosts
#add or update the entry in /etc/hosts for hostname COMP2101-S22 with the container’s current IP address if necessary
#take container's IP 
CON_IP=$(lxc info COMP2101-F22 | grep -w inet | grep -w global |awk '{print $2}' | cut -f1 -d "/")
#Check if the IP is in the hosts file
cat /etc/hosts | grep -w $CON_IP
if [ $? -ne 0 ]; then
	#send there the IP address with the name
	echo $CON_IP    COMP2101-F22 >> /etc/hosts
	#check again
	if [ $? -ne 0 ]; then
	#failed to export IP Address
	echo "failed to export IP Address"
	exit 1
	fi
fi

#task 5

#check if Apache2 installed
ls /etc/apache2
	#install apache2 on the container
	lxc exec COMP2101-F22 -- apt -y install apache2
	if [ $? -ne 0 ]; then
	#failed to install apache
	echo "failed to install Apache2"
	exit 1
	fi

#task 6
#install curl
sudo apt install curl >/dev/null
#retrieve web
curl http://COMP2101-F22 >/dev/null
if [ $? = 0 ]; then
	echo success to retrieve
	if [ $? -ne 0 ]; then
	#failed to retrieve
	echo "failed to show the website"
	exit 1
	fi
fi


