#!/usr/bin/env bash

# exit if any command fails
set -e

# This script should be executed under user vagrant during provisioning of the machine.

# replace user profile and function definitions with our pre-canned ones
cd ~
rm .profile
ln -s /vagrant_setup/.profile
ln -s /vagrant_setup/.functions

# copy rsa key files from host to ~/.ssh, but not known_hosts and authorized_keys

    # save our current known_hosts and authorized_keys, if any
    mkdir -p /tmp/ssh
    mv ~/.ssh/known_hosts /tmp/ssh/ 2>/dev/null || true
    mv ~/.ssh/authorized_keys /tmp/ssh 2>/dev/null || true

    # copy host's .ssh/* files to our local ones (for rsa files)
    cp /vagrant_ssh/* ~/.ssh/

    # remove host known_hosts and authorized_keys copies (if any)
    rm -f ~/.ssh/known_hosts 2>/dev/null || true
    rm -f ~/.ssh/authorized_keys 2>/dev/null || true

    # reinstate the local known_hosts and authorized_keys, if there were any
    mv /tmp/ssh/* ~/.ssh/ 2>/dev/null || true
