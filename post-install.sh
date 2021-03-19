#!/bin/bash 

read -r -p 'Red Hat Cloud Login: ' rhc_login
read -rs -p 'Red Hat Cloud Password: ' rhc_password

sudo podman login -u "${rhc_login}" -p "${rhc_password}" https://registry.redhat.io
sudo ansible-runner-service.sh -s
for i in ceph-deploy ceph-{0..3}
do
  echo ssh-copy-id -o StrictHostKeyChecking=no -f -i /usr/share/ansible-runner-service/env/ssh_key.pub admin@$i
done

