#!/usr/bin/env bash

apt-get update
apt-get install -y git
apt-get install -y mercurial

curl -s -o /tmp/go.tgz https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz
tar -C /usr/local -xzf /tmp/go.tgz
rm /tmp/go.tgz

su -c "cd /vagrant_setup && ./setup.sh" vagrant
