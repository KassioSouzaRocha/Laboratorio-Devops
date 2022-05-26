# -* mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64" 
  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024",
      "--paravirtprovider", "kvm", # for linux guest
      "--cpus", "2"
    ]
  
    vb.customize [
      "storagectl", :id,
      "--name", "SATA NETCOM",
#      "--bootable", "on",
      "--add", "virtio",
      "--controller", "VirtIO"
    ]
    vb.customize [
      "storageattach", :id,
      "--port", "0",
      "--device", "0",
      "--type", "hdd",
      "--medium", "ubuntu-focal-20.04-cloudimg.vmdk"
    ]

  end
end