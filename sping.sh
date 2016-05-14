#!/bin/bash
#	spring.sh
#
#	Pings an IP address and plays a sonar sound if the IP is live.
#	Now with functions!
#
#	Created by David Scholten(palanthas)	2016-01-27	Version: 1.1

#===============================
#	Begin functions
#===============================

sping ()
{
	i=1
	echo Pinging $ipaddr
	while [ $i -lt 2 ]
	do
		ping -c 1 $ipaddr | grep -E ("1 received"|"bytes=")
		found="$(echo $?)" 
		if [ "$found" = "0" ]; then 
			paplay sonar.wav
			i=2
		else
			clear
			rnd=$((RANDOM%20))
				case $rnd in
				1)
				  Message="All is quiet..."
				  ;;
				5)
				  Message="Sure is quiet out there..."
				  ;;
				10)
				  Message="Ain't found nothing..."
				  ;;
				15)
				  Message="Hello? Anyone out there?"
				  ;;
				*)
				  Message="Ping..."
				  ;;
				esac
				echo $Message
			sleep 5m
		fi
	done
}

#===============================
#	Begin main program
#===============================

echo "Who shall we ping? "
read ipaddr	# Get an IP address from the user

sping	# Call the sping function

exit $?
