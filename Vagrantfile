# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/centos-6.7-i386'
  config.vm.box_url = 'https://vagrantcloud.com/bento/boxes/centos-6.7/versions/2.2.2/providers/virtualbox.box'
  config.vm.network 'forwarded_port', guest: 80, host: 8000, host_ip: '127.0.0.1'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '..', '/mnt/fuelphp', mount_options: ['dmode=777', 'fmode=666']
  config.vm.provision :shell, path: 'bootstrap.sh'
end
