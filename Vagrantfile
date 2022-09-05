# -* mode: ruby -*-
# vi: set ft=ruby :

machines = {
  "master"   => {"memory" => "2048", "cpu" => "2", "ip" => "100", "image" => "ubuntu/focal64"},
  "node01"   => {"memory" => "1024", "cpu" => "1", "ip" => "110", "image" => "ubuntu/focal64"},
  "node02"   => {"memory" => "1024", "cpu" => "1", "ip" => "120", "image" => "ubuntu/focal64"},
  "node03"   => {"memory" => "1024", "cpu" => "1", "ip" => "200", "image" => "ubuntu/focal64"},
  "gitlab"   => {"memory" => "2048", "cpu" => "2", "ip" => "250", "image" => "ubuntu/focal64"}

}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.labnetcom.example"
      machine.vm.network "public_network", ip: "192.168.0.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/Lab-devops"]
      end
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.labnetcom.example"
    end
  end
end