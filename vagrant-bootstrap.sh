#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install libgmp-dev git

# Install RVM so we can run a recent version of Jekyll.
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.0
source ~/.rvm/scripts/rvm

# Install Jekyll an any other gems. You can also swap this out for bundler.
gem install bundler

cd /src
bundle install

# Run Jekyll, accessible on the host machine
jekyll serve --detach --host=0.0.0.0