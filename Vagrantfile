# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ubuntu_vm", primary: true do |ubuntu_vm|
    ubuntu_vm.vm.hostname = "ubuntu-vm"
    ubuntu_vm.vm.box = "perk/ubuntu-2204-arm64"

    # ubuntu_vm.vm.network :private_network, ip: "192.168.0.160"
    # ubuntu_vm.vm.network :public_network, ip: "192.168.0.161"
    ubuntu_vm.vm.network "forwarded_port", guest: 80, host: 80
    ubuntu_vm.vm.network "forwarded_port", guest: 8080, host: 8080
    ubuntu_vm.vm.network "forwarded_port", guest: 9090, host: 9090
    ubuntu_vm.vm.network "forwarded_port", guest: 3000, host: 3000
    # ubuntu_vm.vm.network "public_network", type: "dhcp"

    config.vm.provider "qemu" do |q|
      q.gui = false
      q.vmx["memsize"] = "1024"
      q.vmx["numvcpus"] = "1"
    end

    config.vm.provision :ansible do |ansible|
      ansible.version = "2.15.4"
      ansible.playbook = "main.ansible.yml"
    end
    
  end
end
