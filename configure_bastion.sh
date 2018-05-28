#!/bin/bash

EXTRA_PKG="git vim-enhanced bind-utils wget bash-completion"

# This script must be run as root
if [ $USER != root ]; then
    echo "Plese run this script as root."
    exit 1
fi

# Update the system
yum update -y
if [ $? -ne 0 ]; then
    echo "Cannot update system to latest packages"
    exit 1
fi

# Install ansible on bastion host
yum install -y ansible
if [ $? -ne 0 ]; then
    echo "Error installing ansible"
    exit 1
fi

# Install extra packages
for pkg in $EXTRA_PKG; do 
    yum install -y $pkg
    if [ $? -ne 0 ]; then
        echo "Cannot install package $pkg"
        exit 1
    fi
done

