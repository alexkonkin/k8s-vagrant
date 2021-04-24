#!/bin/bash

k8s_version=$1

mkdir -pv /home/vagrant/k8s
cd /home/vagrant/k8s

git clone https://github.com/alexkonkin/k8s-ubuntu.git .
git checkout k8s_v.16_vagrant

echo $k8s_version
ansible-playbook playbook.yml --extra-vars "k8s_version=$k8s_version"
