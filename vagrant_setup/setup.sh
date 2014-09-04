#!/usr/bin/env bash

# This script should be executed under user vagrant during provisioning of the machine.

cd ~
rm .profile
ln -s /vagrant_setup/.profile
