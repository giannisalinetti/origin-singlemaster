#!/bin/bash

REPOS="epel-release centos-release-openshift-origin39"
EXTRA_PKG="git vim-enhanced bind-utils wget bash-completion"

# This script must be run as root
if [ $USER != root ]; then
    echo "Plese run this script as root."
    exit 1
fi

# Configure repositories
for repo in $REPOS; do 
    yum install -y $repo
    if [ $? -ne 0 ]; then
        echo "Error configuring repository $repo"
        exit 1
    fi
done

# Update the system
yum update -y
if [ $? -ne 0 ]; then
    echo "Cannot update system to latest packages"
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

# Install atomic-openshift-utils on bastion host
yum install -y atomic-openshift-utils
if [ $? -ne 0 ]; then
    echo "Error installing package atomic-openshift-utils"
    exit 1
fi

exit 0
