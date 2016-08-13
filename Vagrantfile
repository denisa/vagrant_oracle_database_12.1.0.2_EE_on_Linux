# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "db12c102", primary: true do |db12c102|

    db12c102.vm.box      = "centos-6.5-x86_64"
    db12c102.vm.box_url  = "https://dl.dropboxusercontent.com/s/np39xdpw05wfmv4/centos-6.5-x86_64.box"

    db12c102.vm.hostname = "db12c.example.com"
    db12c102.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777", "fmode=777"]


    db12c102.vm.network :private_network, ip: "10.10.10.9"

    db12c102.vm.provider :virtualbox do |vb|
      vb.name   = "db12c102"
      vb.memory = 2548
      vb.cpus   = 2
    end

    db12c102.vm.provision :shell, :inline => "ln -sf /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml;rm -rf /etc/puppet/modules;ln -sf /vagrant/puppet/modules /etc/puppet/modules"

    db12c102.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "db.pp"
      puppet.options        = "--verbose --debug --hiera_config /vagrant/puppet/hiera.yaml"

      puppet.facter = {
          "environment" => "development",
          "vm_type" => "vagrant",
      }

    end

  end

end
