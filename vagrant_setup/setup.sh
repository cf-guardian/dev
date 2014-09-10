#!/usr/bin/env bash

# This script should be executed under user vagrant during provisioning of the machine.

# replace user profile with our pre-canned one
cd ~
rm .profile
ln -s /vagrant_setup/.profile

# add host ssh identities to vagrant's ssh identities, by using config to reference the host's .ssh/ directory
cp /vagrant_setup/config ~/.ssh/.
