# vagrant-go

Use [Thoughtworks]'s [go] to manage continuous delivery pipelines via Vagrant.


### Requirements

You need to have the following installed to try out _devenv_:
* [Ruby] with [bundler]
* [Vagrant]
* [VirtualBox], or other virtualization software that Vagrant supports


### Installation

Install [librarina-chef] first. This dependency is specified in the `Gemfile`,
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


### Usage

TODO
To start the _devenv_ start the vagrant with:
~~~
vagrant up
~~~

When you run this command for the first time, it will probably take a while as
it needs to download the Ubuntu box. This will only happen once.

After the previous command finishes, log into the box:
~~~
vagrant ssh
~~~

That's it, now you can play in your band new _devenv_.


### More information

TODO
For more details, check out [this post about _devenv_][blog-post].

To get a quick introduction to vagrant, check out
[this vagrant intro post][vagrant-intro].


[blog-post]: http://www.ikusalic.com/blog/2013/10/17/vagrant-development-environment-part-1/
[bundler]: http://bundler.io/
[go]: http://www.go.cd/
[librarina-chef]: https://github.com/applicationsonline/librarian-chef
[Ruby]: https://www.ruby-lang.org
[Thoughtworks]: http://www.thoughtworks.com/
[Vagrant]: http://www.vagrantup.com/
[vagrant-intro]: http://www.ikusalic.com/blog/2013/10/03/vagrant-intro/
[VirtualBox]: https://www.virtualbox.org/
