# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	# Vagrant box
	config.vm.box = "geerlingguy/ubuntu1404"
	
	# Synced folder
	config.vm.synced_folder ".", "/vagrant"

	# Provisioning commands
	config.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update
		sudo apt-get install -y bfgminer unzip gcc binutils
		wget http://www.silabs.com/Support%20Documents/Software/Linux_3.x.x_VCP_Driver_Source.zip
		/cd/vagrant
		unzip Linux_3.x.x_VCP_Driver_Source.zip
		cd Linux_3.x.x_VCP_Driver_Source/
		make
		cp cp210x.ko /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/
		insmod /lib/modules/3.16.0-30-generic/kernel/drivers/usb/serial/usbserial.ko
		insmod cp210x.ko
	SHELL
end
