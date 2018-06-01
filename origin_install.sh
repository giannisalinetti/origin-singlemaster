#!/bin/bash

INVENTORY='inventory/singlemaster'

ansible-playbook -i ${INVENTORY} /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
if [ $? -ne 0 ]; then
    printf 'Error during OCP 3.9 prerequisites configuration.\f'
    exit 1
fi
  
ansible-playbook -i ${INVENTORY} /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml
if [ $? -ne 0 ]; then
    printf 'Error during OCP 3.9 cluster deployment.\f'
    exit 1
fi

exit 0
