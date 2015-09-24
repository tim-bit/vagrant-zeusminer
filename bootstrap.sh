#!/usr/bin/env bash

# update aptitude
sudo apt-get update
sudo apt-get install -y autoconf automake binutils build-essential gcc git libcurl4-gnutls-dev libevent-dev libjansson-dev libmicrohttpd-dev libncursesw5-dev libtool libudev-dev libusb-1.0.0-dev pkg-config unzip uthash-dev

cd /vagrant

# install zeusminer driver
unzip Linux_3.x.x_VCP_Driver_Source.zip
cd Linux_3.x.x_VCP_Driver_Source/
make
cp cp210x.ko /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/
insmod /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/usbserial.ko
insmod cp210x.ko

# build bfgminer
cd /home/vagrant
su vagrant
git clone https://github.com/luke-jr/bfgminer.git
cd bfgminer
./autogen.sh
./configure --enable-scrypt
make

# give vagrant permissions to read /dev/ttyUSB0
usermod -a -G dialout vagrant