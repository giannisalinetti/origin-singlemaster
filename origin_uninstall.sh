#!/bin/bash

INVENTORY='inventory/uninstall'
ansible-playbook -i ${INVENTORY} /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml
