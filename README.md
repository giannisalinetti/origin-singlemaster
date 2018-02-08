# OpenShift Origin test lab installation

## Planning

**DISCLAIMER**: this lab is intended for learning purposes only.

A pool of virtual machines must be defined for this lab. The vms should be created
following the specs found in the [Installation and Configuration](https://docs.openshift.org/latest/install_config/install/prerequisites.html#system-requirements) Guide.

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

### Wildcard DNS 
Define a wildcard DNS address. The default routing suffix is **ocplab.example.com** but it can be updated
in the inventory/singlemaster file.

The easiest way to define a wildcard address it to use **dnsmasq** package. If libvirt is the choosen
hypervisor, a dnsmasq process is already installed to offer name resolution and dhcp to local vms.

Update the default config file by adding the following entry:

```
address=/.ocplab.example.com/192.168.0.1
```

Where the IPv4 address is the address for the infra node scheduled to execute the router pod.

## OpenShift Origin installation

To install the Origin cluster:

```
bash origin_install.sh
```

## Post Installation tasks

After installation add users to the htpasswd Identity Provider in order to grant access from workstations.
Keep in mind that the default cluster-admin user, **system:admin** cannot be used to login with password
from remote hosts.

To add a new user:

```
htpasswd -b /etc/origin/master/htpasswd admin openshift
htpasswd -b /etc/origin/master/htpasswd developer developer
```


