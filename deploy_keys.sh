#!/bin/bash

USER=root
MASTER=origin-master.example.com
NODE1=origin-node1.example.com
NODE2=origin-node2.example.com

# Generate local ssh keys
ssh-keygen -q -f ~/.ssh/id_rsa -N ''

# Deploy keys on nodes
ssh-copy-id -f ${USER}@${MASTER}
ssh-copy-id -f ${USER}@${NODE1}
ssh-copy-id -f ${USER}@${NODE2}

