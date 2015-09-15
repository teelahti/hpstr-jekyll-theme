Vagrant::Config.run do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 8124, 8124

  # Install prereqs, e.g. curl needed for RVM installl
  config.vm.provision :shell,
    :inline => "sudo apt-get update && sudo apt-get -y install build-essential git curl"

  # Install Ruby Version Manager, and then required ruby versions. Call install-ruby.sh 
  # again with different params if more ruby versions are needed.
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.2.3 github-pages therubyracer --no-ri --no-rdoc", privileged: false
  
  # Install the real beef, i.e. github-pages version of Jekyll.
  # config.vm.provision :shell,
  #  :inline => "sudo gem install github-pages therubyracer --no-ri --no-rdoc"

  config.ssh.forward_agent = true
  
  # TODO: Automate running: jekyll server --watch -P 8124
end