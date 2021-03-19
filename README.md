# rhcs4-lab
automation to deploy a 1+4 (deployer+workers) RHCS4 cluster on a laptop using libvirt and an existing virtual switch

![alt text](https://raw.githubusercontent.com/gprocunier/rhcs4-lab/main/lab-network-logical.png)

In this example I have using VyOS virtual switch with an interface configuration similar to:

```
interfaces {
    ethernet eth0 {
        address 10.0.0.1/24
        description Core
        hw-id 52:54:00:de:00:00
        vif 102 {
            address 10.102.0.1/24
            description "VLAN 102 - Ceph Public"
        }
        vif 103 {
            address 10.103.0.1/24
            description "VLAN 103 - Ceph Cluster"
        }
    }
    ethernet eth3 {
        address 192.168.122.50/24
        description Outside
        hw-id 52:54:00:de:00:03
    }
    loopback lo {
    }
}
```


I use ansible with virt-inst(1), cloud-init and genisoimage(1) to bootstrap a RHEL 8.3 cloud image and build the environment:

$ ansible-playbook -i localhost, rhcs4-lab.yml
