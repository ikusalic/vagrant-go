# -*- mode: ruby -*-
# vi: set ft=ruby :

GO_SERVER_RPM = 'http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.noarch.rpm'
GO_AGENT_RPM = 'http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm'

GO_SERVER_SETUP = <<-HERE
  yum install -y #{ GO_SERVER_RPM }
  # TODO
HERE

GO_AGENT_SETUP = <<-HERE
  yum install -y #{ GO_AGENT_RPM }
  # TODO
HERE

NODES = [
  { vm_name: :server, hostname: 'go-server', ip: '10.42.42.101', go_setup: GO_SERVER_SETUP },
  { vm_name: :agent1, hostname: 'go-agent-1', ip: '10.42.42.201', go_setup: GO_AGENT_SETUP },
  { vm_name: :agent2, hostname: 'go-agent-2', ip: '10.42.42.202', go_setup: GO_AGENT_SETUP },
]

INSTALL_CHEF = <<-HERE
  yum install -y zlib-devel openssl-devel

  cd /tmp
  curl -O http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz
  tar xzvf yaml-0.1.5.tar.gz
  cd yaml-0.1.5
  ./configure --prefix=/usr
  make
  make install

  cd /tmp
  curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p545.tar.gz
  tar xzvf ruby-1.9.3-p545.tar.gz
  cd ruby-1.9.3-p545
  ./configure --prefix=/usr --enable-shared --disable-install-doc
  make
  make install

  gem install chef --no-rdoc --no-ri
HERE

Vagrant.configure('2') do |config|
  config.vm.box = 'centos-65'
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box'

  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
  end

  config.cache.auto_detect = true
  config.cache.scope = :machine

  config.vm.provision :shell, inline: INSTALL_CHEF
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['.', './cookbooks']
    chef.add_recipe 'vagrant-go-wrapper-cookbook'
  end

  NODES.each do |node|
    config.vm.define node[:vm_name] do |node_config|
      node_config.vm.provider(:virtualbox) { |vb| vb.name = node[:vm_name].to_s }

      node_config.vm.network :private_network, ip: node[:ip]
      node_config.vm.hostname = node[:hostname]

      node_config.vm.provision :shell, :inline => node[:go_setup]
    end
  end
end