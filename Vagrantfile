# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-vm", primary: true do |ubuntu_vm|
    ubuntu_vm.vm.hostname = "ubuntu-vm"
    ubuntu_vm.vm.box = "perk/ubuntu-2204-arm64"

    config.vm.provider "qemu" do |q|
      q.gui = false
      q.vmx["memsize"] = "1024"
      q.vmx["numvcpus"] = "1"
    end
    
  end
end
