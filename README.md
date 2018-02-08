# OpenShift Origin test lab installation

## Prerequisites

**DISCLAIMER**: this lab is intended for learning purposes only.

Origin Nodes:

- origin-master.example.com (CentOS 7.4)
- origin-node1.example.com (CentOS 7.4)
- origin-node2.example.com (CentOS 7.4)

Bastion Host (Optional):

- origin-ctrl.example.com (CentOS 7.4)

## Prerequisites

Clone this repo in the Bastion host (or in the master node) if available
resources are limited.

```
git clone https://github.com/giannisalinetti/origin-singlemaster.git
```

(Optional)
Create and deploy ssh keys on hosts. Custom, pre-owned keys can be used.

```
bash deploy_keys.sh
```

Run the preinstall script from the cloned repo (it will take up to 10-15 minutes due to system updates).

```
cd origin-siglemaster
bash origin_preinstall.sh
```

## OpenShift Origin installation

To install the Origin cluster:

```
bash origin_install.sh
```

# Post Installation tasks


