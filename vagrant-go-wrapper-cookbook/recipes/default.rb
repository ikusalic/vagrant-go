include_recipe 'yum'

include_recipe 'git'

include_recipe 'python'

node.override['rvm']['default_ruby']                = 'ruby-2.1.0'
node.override['rvm']['vagrant']['system_chef_solo'] = '/opt/vagrant_ruby/bin/chef-solo'
include_recipe 'rvm::vagrant'
include_recipe 'rvm::system'
include_recipe 'rvm::gem_package'

node.override['vim_setup']['custom_preinstall_bash'] = <<-HERE  # build custom vim
  yum groupinstall -y 'Development Tools'
  yum install -y perl-devel python-devel perl-ExtUtils-Embed ncurses-devel
HERE
node.override['vim_setup']['custom_bash_user_before_vundle'] = <<-HERE
  # clone manaully so the Vundle's BundleInstall command works from shell
  git clone https://github.com/Lokaltog/vim-distinguished.git ~/.vim/bundle/vim-distinguished
HERE
node.override['vim_setup']['custom_bash_once_after_vundle'] = <<-HERE
  # for json formatting
  yum install -y perl-JSON-XS

  # python checker for Syntastic
  pip install flake8

  # for TagBar
  yum install -y ctags
  ln -s `which ctags` /usr/local/bin/ctags

  # for YCM
  yum install -y cmake28
  ln -s `which cmake28` /usr/local/bin/cmake
HERE
node.override['vim_setup']['custom_bash_user_after_vundle'] = <<-HERE
  # for command-t
  cd ~/.vim/bundle/Command-T/ruby/command-t
  ruby extconf.rb
  make

  # for YCM
  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh --clang-completer
HERE
node.override['vim_setup']['build_from_source'] = true
node.override['vim_setup']['vundle_timeout'] = 1000
node.override['vim_setup']['dotfiles_repo'] = 'https://github.com/ikusalic/dotfiles.git'
node.override['vim_setup']['global_vimrc'] = false
node.override['vim_setup']['users'] = [ 'vagrant' ]
node.override['vim_setup']['use_vundle'] = true
include_recipe 'vim-setup'
