#!/bin/bash

set -e 

# Check if Vagrant is installed
if ! command -v vagrant &>/dev/null; then
    echo "Vagrant is not installed. Installing..."
    brew install hashicorp/tap/hashicorp-vagrant
else
    echo "Vagrant is already installed."
fi

# Check if qemu is installed
if ! command -v qemu-system-x86_64 &>/dev/null; then
    echo "qemu is not installed. Installing..."
    brew install qemu
else
    echo "qemu is already installed."
fi

# Check if the vagrant-qemu plugin is installed
if ! vagrant plugin list | grep -q 'vagrant-qemu'; then
    echo "Installing vagrant-qemu plugin..."
    vagrant plugin install vagrant-qemu
else
    echo "vagrant-qemu plugin is already installed."
fi

# Initialize Vagrantfile if it doesn't exist
if [ ! -f Vagrantfile ]; then
    echo "Initializing Vagrantfile..."
    vagrant init -m perk/ubuntu-2204-arm64
else
    echo "Vagrantfile already exists."
fi

# Ensure the Vagrant VM is not already running
if vagrant status | grep -q 'running'; then
    echo "Vagrant VM is already running."
else
    echo "Starting Vagrant VM..."
    vagrant up --provider qemu
fi



# SSH into the Vagrant VM
# echo "SSHing into the Vagrant VM..."
# vagrant ssh

# Halt the VM
# echo "Halting the Vagrant VM..."
# vagrant halt

# Destroy the VM
# echo "Destroying the Vagrant VM..."
# vagrant destroy -f
