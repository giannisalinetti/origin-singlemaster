#!/bin/bash

INVENTORY='inventory/singlemaster'

ansible-playbook -i ${INVENTORY} /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml
if [ $? -ne 0 ]; then
    echo "Error: OpenShift installation failed"
    exit 1
fi

exit 0
