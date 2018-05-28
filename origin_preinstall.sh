#!/bin/bash

ORIGIN_VERSION='v3.9'
INVENTORY='inventory/pre_inventory'

# Install ansible on bastion host
yum install -y ansible
if [ $? -ne 0 ]; then
    echo "Error installing ansible"
    exit 1
fi

# Execute pre-installation tasks
ansible-playbook -i ${INVENTORY} origin_preinstall.yaml
if [ $? -ne 0 ]; then
    echo "Error during pre-installation tasks"
    exit 1
fi

exit 0

