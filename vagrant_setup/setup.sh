#!/usr/bin/env bash

# This script should be executed under user vagrant during provisioning of the machine.

cd ~
rm .profile
ln -s /vagrant_setup/.profile

cp /vagrant_ssh/*rsa ~/.ssh/.
cp /vagrant_ssh/*rsa.pub ~/.ssh/.
