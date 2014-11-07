#!/usr/bin/env bash

# This script should be executed under user vagrant during provisioning of the machine.

# replace user profile and function definitions with our pre-canned ones
cd ~
rm .profile
ln -s /vagrant_setup/.profile
ln -s /vagrant_setup/.functions

# add host ssh identities to vagrant's ssh identities, by using config to reference the host's .ssh/ directory
cp /vagrant_setup/config ~/.ssh/.
