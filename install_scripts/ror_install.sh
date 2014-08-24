#!/usr/bin/env bash

echo "Installing packages"

sudo aptitude install -y mysql-server mysql-client libmysqlclient-dev libxslt1-dev libcurl4-openssl-dev libksba8 \
libksba-dev libqtwebkit-dev libreadline-dev libsqlite3-dev sqlite3 libmagickcore-dev\
redis-server vim-gtk imagemagick curl nodejs build-essential libssl-dev \
libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev \
python-software-properties libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

echo "Installing rvm"
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.2
rvm use 2.1.2 --default
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

echo "Installing rails gem"
gem install rails

#gem install tzinfo-data


