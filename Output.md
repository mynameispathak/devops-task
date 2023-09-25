## Output of ./scripts/vm/boot.sh

❯ ./scripts/vm/boot.sh                                                                                                                ─╯
Vagrant is already installed.
qemu is already installed.
vagrant-qemu plugin is already installed.
Vagrantfile already exists.
Starting Vagrant VM...
Bringing machine 'ubuntu_vm' up with 'qemu' provider...
==> ubuntu_vm: Checking if box 'perk/ubuntu-2204-arm64' version '20230712' is up to date...
==> ubuntu_vm: Importing a QEMU instance
    ubuntu_vm: Creating and registering the VM...
    ubuntu_vm: Successfully imported VM
==> ubuntu_vm: Warning! The QEMU provider doesn't support any of the Vagrant
==> ubuntu_vm: high-level network configurations (`config.vm.network`). They
==> ubuntu_vm: will be silently ignored.
==> ubuntu_vm: Starting the instance...
==> ubuntu_vm: Waiting for machine to boot. This may take a few minutes...
    ubuntu_vm: SSH address: 127.0.0.1:50022
    ubuntu_vm: SSH username: vagrant
    ubuntu_vm: SSH auth method: private key
    ubuntu_vm: Warning: Connection reset. Retrying...
    ubuntu_vm: Warning: Remote connection disconnect. Retrying...
    ubuntu_vm: 
    ubuntu_vm: Vagrant insecure key detected. Vagrant will automatically replace
    ubuntu_vm: this with a newly generated keypair for better security.
    ubuntu_vm: 
    ubuntu_vm: Inserting generated public key within guest...
    ubuntu_vm: Removing insecure key from the guest if it's present...
    ubuntu_vm: Key inserted! Disconnecting and reconnecting using new SSH key...
==> ubuntu_vm: Machine booted and ready!
==> ubuntu_vm: Setting hostname...
==> ubuntu_vm: Running provisioner: ansible...
Vagrant gathered an unknown Ansible version:


and falls back on the compatibility mode '1.8'.

Alternatively, the compatibility mode can be specified in your Vagrantfile:
https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

    ubuntu_vm: Running ansible-playbook...

PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu_vm]

TASK [set_hostname] ************************************************************
changed: [ubuntu_vm]

TASK [create_user] *************************************************************
changed: [ubuntu_vm]

TASK [disable_root_login] ******************************************************
changed: [ubuntu_vm]

TASK [Install UFW (Uncomplicated Firewall)] ************************************
ok: [ubuntu_vm]

TASK [Allow HTTP (Port 80)] ****************************************************
changed: [ubuntu_vm]

TASK [Allow HTTP (Port 8080)] **************************************************
changed: [ubuntu_vm]

TASK [set_timezone] ************************************************************
changed: [ubuntu_vm]

TASK [Install aptitude] ********************************************************
changed: [ubuntu_vm]

TASK [install_system_packages] *************************************************
changed: [ubuntu_vm]

TASK [Add Docker GPG key] ******************************************************
changed: [ubuntu_vm]

TASK [Add Docker repository] ***************************************************
changed: [ubuntu_vm]

TASK [Update apt and install docker-ce] ****************************************
changed: [ubuntu_vm]

TASK [Install prerequisites for docker-compose] ********************************
ok: [ubuntu_vm]

TASK [Install docker-compose] **************************************************
changed: [ubuntu_vm]

TASK [copy file to remote host] ************************************************
changed: [ubuntu_vm]

TASK [(Working directory changed to `/etc/demo-ops`) Starting the server...] ***
changed: [ubuntu_vm]

TASK [Install Prometheus] ******************************************************
changed: [ubuntu_vm]

TASK [Copy Prometheus configuration file] **************************************
changed: [ubuntu_vm]

TASK [Start Prometheus service] ************************************************
ok: [ubuntu_vm]

TASK [Import Grafana GPG key] **************************************************
changed: [ubuntu_vm]

TASK [Add Grafana APT repository] **********************************************
changed: [ubuntu_vm]

TASK [Update APT cache] ********************************************************
changed: [ubuntu_vm]

TASK [Install Grafana] *********************************************************
changed: [ubuntu_vm]

TASK [Copy Grafana datasource configuration file] ******************************
changed: [ubuntu_vm]

TASK [Copy Grafana dashboards (optional)] **************************************
changed: [ubuntu_vm]

TASK [Start Grafana service] ***************************************************
changed: [ubuntu_vm]

TASK [wait for service up] *****************************************************
FAILED - RETRYING: [ubuntu_vm]: wait for service up (120 retries left).
FAILED - RETRYING: [ubuntu_vm]: wait for service up (119 retries left).
FAILED - RETRYING: [ubuntu_vm]: wait for service up (118 retries left).
ok: [ubuntu_vm]

TASK [change admin password for grafana gui] ***********************************
ok: [ubuntu_vm]

RUNNING HANDLER [restart ssh] **************************************************
changed: [ubuntu_vm]

RUNNING HANDLER [Restart Prometheus] *******************************************
changed: [ubuntu_vm]

RUNNING HANDLER [Restart Grafana] **********************************************
changed: [ubuntu_vm]

PLAY RECAP *********************************************************************
ubuntu_vm                  : ok=32   changed=26   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 