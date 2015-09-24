# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	# Vagrant box
	config.vm.box = "geerlingguy/ubuntu1404"
	
	# Synced folder
	config.vm.synced_folder ".", "/vagrant"
	
	# Set name of VM
  config.vm.provider :virtualbox do |vb|
		vb.name = "vagrant-zeusminer"
  end

  # Provisioning script
  config.vm.provision :shell, :path => "bootstrap.sh"
end
