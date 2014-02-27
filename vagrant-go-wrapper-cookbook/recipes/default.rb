include_recipe 'yum'

include_recipe 'git'

include_recipe 'python'

node.override['rvm']['default_ruby']                = 'ruby-2.1.0'
node.override['rvm']['vagrant']['system_chef_solo'] = '/opt/vagrant_ruby/bin/chef-solo'
include_recipe 'rvm::vagrant'
include_recipe 'rvm::system'
include_recipe 'rvm::gem_package'

node.override['vim_setup']['custom_bash_user'] = <<-HERE
  # clone manaully so the Vundle's BundleInstall command works from shell
  git clone https://github.com/Lokaltog/vim-distinguished.git ~/.vim/bundle/vim-distinguished
HERE
# TODO
#node.override['vim_setup']['custom_bash_once_after_vundle'] = <<-HERE
  ## for json formatting
  #apt-get install -y libjson-xs-perl

  ## python checker for Syntastic
  #apt-get install -y python-pip
  #pip install flake8

  ## for TagBar
  #apt-get install -y exuberant-ctags
  #ln -s `which ctags-exuberant` /usr/local/bin/ctags

  ## TODO YCM
#HERE
node.override['vim_setup']['custom_bash_user_after_vundle'] = <<-HERE
  # for command-t
  cd ~/.vim/bundle/Command-T/ruby/command-t
  ruby extconf.rb
  make
HERE
node.override['vim_setup']['dotfiles_repo'] = 'https://github.com/ikusalic/dotfiles.git'
node.override['vim_setup']['global'] = false
node.override['vim_setup']['users'] = [ 'vagrant' ]
node.override['vim_setup']['use_vundle'] = true
include_recipe 'vim-setup'
