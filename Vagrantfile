# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "canonical-ubuntu-12.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/20140113/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.synced_folder ".", "/home/vagrant/iso"
end
