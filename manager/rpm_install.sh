#!/bin/bash

set -e

if [[ $# < 3 ]]; then
  echo 'Usage: '$0' <PRIVATE_IP> <PUBLIC_IP> <ADMIN_PASSWD>'
  exit 1
fi

yum install -y wget
wget -q http://repository.cloudifysource.org/cloudify/19.07.18/community-release/cloudify-manager-install-community-19.07.18.rpm -O cfymanager.rpm
yum install -y cfymanager.rpm
rm -r cfymanager.rpm

yum install -y firewalld
systemctl unmask firewalld
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --add-service=https
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --zone=public --add-port=5671/tcp
firewall-cmd --zone=public --permanent --add-port=5671/tcp
firewall-cmd --zone=public --add-port=53229/tcp
firewall-cmd --zone=public --permanent --add-port=53229/tcp
firewall-cmd --zone=public --add-port=53333/tcp
firewall-cmd --zone=public --permanent --add-port=53333/tcp

sed -i -e "s|private_ip: ''|private_ip: '$1'|g" /etc/cloudify/config.yaml
sed -i -e "s|public_ip: ''|public_ip: '$2'|g" /etc/cloudify/config.yaml

sed -i -e "s|admin_password: ''|admin_password: '$3'|g" /etc/cloudify/config.yaml

cfy_manager install
cfy plugins bundle-upload
