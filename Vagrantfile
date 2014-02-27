# -*- mode: ruby -*-
# vi: set ft=ruby :

GO_SERVER_RPM='http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.noarch.rpm'
GO_AGENT_RPM='http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm'

Vagrant.configure('2') do |config|
  config.vm.box = 'centos-65'
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box'

  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
  end

  config.cache.auto_detect = true
  config.cache.scope = :machine

  config.vm.provision :shell, inline: <<-HERE
    # install system-wide ruby
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

    # install chef
    gem install chef --no-rdoc --no-ri
  HERE

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['.', './cookbooks']

    chef.add_recipe 'vagrant-go-wrapper-cookbook'
  end

  config.vm.define :server do |server|
    server_name = 'go-server'

    server.vm.provider(:virtualbox) { |vb| vb.name = server_name }

    server.vm.network :private_network, ip: '10.42.42.101'
    server.vm.hostname = server_name

    server.vm.provision :shell, :inline => <<-HERE
      true  # TODO
    HERE
  end

  def define_agent(config, agent_id)
    config.vm.define "agent-#{ agent_id }".to_sym do |agent|
      agent_name = "go-agent-#{ agent_id }"

      agent.vm.provider(:virtualbox) { |vb| vb.name = agent_name }

      agent.vm.network :private_network, ip: "10.42.42.#{ 200 + agent_id }"
      agent.vm.hostname = agent_name

      agent.vm.provision :shell, :inline => <<-HERE
        true  # TODO
      HERE
    end
  end
  define_agent config, 1
  define_agent config, 2
end
