#!/bin/bash

set -e 

# Check if Vagrant is installed
if ! command -v vagrant &>/dev/null; then
    echo "Vagrant is not installed. Installing..."
    brew install hashicorp/tap/hashicorp-vagrant
else
    echo "Vagrant is already installed."
fi

# Check if QEMU is installed
if ! command -v qemu-system-x86_64 &>/dev/null; then
    echo "QEMU is not installed. Installing..."
    brew install qemu
else
    echo "QEMU is already installed."
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

# Get the Host IP of VM
IP_ADDR=$(vagrant ssh -c "ip address show eth0 | grep 'inet ' | sed -e 's/.*inet //' -e 's/\/.*$//'")
echo "[INFO] The Host IP Address of ubuntu-vm is: $IP_ADDR"


# SSH into the Vagrant VM
# echo "SSHing into the Vagrant VM..."
# vagrant ssh

# Halt the VM
# echo "Halting the Vagrant VM..."
# vagrant halt

# Destroy the VM
# echo "Destroying the Vagrant VM..."
# vagrant destroy -f
