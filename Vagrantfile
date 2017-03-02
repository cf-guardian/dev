# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.  For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "go_dev_machine" do |a|
  end

  # Share an additional folders with the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.synced_folder ENV['GOHOME']+"/src", "/vagrant_go_src"
  config.vm.synced_folder ENV['GOHOME']+"/pkg", "/vagrant_go_pkg"
  config.vm.synced_folder "./vagrant_setup", "/vagrant_setup"
  config.vm.synced_folder "~/.ssh", "/vagrant_ssh"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  config.vm.provider :virtualbox do |vb, override|

    # No GUI is required.
    vb.gui = false

    # Name the VM.
    vb.name = "go_dev"

    # Need multiple CPUs.
    vb.cpus = 4

    # Need more memory (MB).
    vb.memory = 2048

  end

  # Manual provisioning...
  # Install pre-reqs:
  config.vm.provision :shell, path: "configure_box.sh"
end
