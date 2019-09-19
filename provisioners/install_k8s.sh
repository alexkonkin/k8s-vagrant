#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y mc ansible
mkdir /home/vagrant/k8s
cd /home/vagrant/k8s
git clone https://github.com/alexkonkin/k8s-ubuntu.git .
ansible-playbook playbook.yml

