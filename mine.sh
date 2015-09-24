#!/bin/bash

# parse arguments
while getopts ":h:u:p:" opt; do
	case $opt in
		h)
			HOST=$OPTARG
			;;
		u)
			USER=$OPTARG
			;;
		p)
			PASS=$OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			;;
	esac
done

vagrant ssh -c "cd /home/vagrant/bfgminer && ./bfgminer -S zeusminer:/dev/ttyUSB0 --set-device zeusminer:ignore_golden_nonce=1 --set-device zeusminer:clock=340 --scrypt -o $HOST -u $USER -p $PASS"
