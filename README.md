# vagrant-go

Use [Thoughtworks]' [go] to manage continuous delivery pipelines via Vagrant.


### Requirements

You need to have the following installed to try out _vagrant-go_:
* [Ruby] with [bundler]
* [Vagrant]
* [VirtualBox], or other virtualization software that Vagrant supports


### Installation

Install [librarian-chef] first. This dependency is specified in the `Gemfile`,
so run the following command:
~~~
bundle install
~~~

Next, install recipes with librarian-chef:
~~~
librarian-chef install
~~~

Lastly, install vagrant-cachier plugin:
~~~
vagrant plugin install vagrant-cachier
~~~

If you want to have additional development tools installed (properly set up
Vim, Ruby & RVM, etc.) on all the machines, set the `INSTALL_DEV_TOOLS` to
`true` in the `Vagrantfile`. This will significantly increase cluster setup
time, but it will happen only once.


### Setting up the cluster

To start the _go cluster_ start the vagrant with:
~~~
vagrant up
~~~

When you run this command for the first time, it will probably take more time
as it needs to download the CentOS box. This will only happen once.

After the previous command finishes, you log into the desired machine, e.g.:
~~~
vagrant ssh server
~~~

The go server is accessible at `127.0.0.1:8153`.

Before you do anything else, do not forget to enable the agents under `agents`
tab in go web interface.

That's it, now you can play with your band new _go cluster_.


### Usage

When the vagrant machines are running, access the go server at
`127.0.0.1:8153`.

When you want to temporary stop the cluster, execute `vagrant halt` to stop it
and `vagrant up` to start it up again (just booting up the instances, no
provisioning).

To learn more on how to use the Vagrant, check the [vagrant-intro] blog post.


[bundler]: http://bundler.io/
[go]: http://www.go.cd/
[librarian-chef]: https://github.com/applicationsonline/librarian-chef
[Ruby]: https://www.ruby-lang.org
[Thoughtworks]: http://www.thoughtworks.com/
[Vagrant]: http://www.vagrantup.com/
[vagrant-intro]: http://www.ikusalic.com/blog/2013/10/03/vagrant-intro/
[VirtualBox]: https://www.virtualbox.org/
