#!/bin/bash

INVENTORY='inventory/singlemaster'
ansible-playbook -i ${INVENTORY} /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-node/scaleup.yml
