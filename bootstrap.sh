		#!/usr/bin/env bash

		# update aptitude
		sudo apt-get update
		sudo apt-get install -y binutils dh-autoreconf gcc git unzip

		cd /vagrant

		# install zeusminer driver
		unzip Linux_3.x.x_VCP_Driver_Source.zip
		cd Linux_3.x.x_VCP_Driver_Source/
		make
		cp cp210x.ko /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/
		insmod /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/usbserial.ko
		insmod cp210x.ko
		cd ..

		# build bfgminer
		cd bfgminer
		./autogen.sh
		./configure --enable-scrypt
		make
