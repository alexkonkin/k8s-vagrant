#!/bin/bash
sudo apt update &&\
sudo apt install -y mc ansible &&\
mkdir /home/vagrant/k8s &&\
cd /home/vagrant/k8s &&\
git clone https://github.com/alexkonkin/k8s-ubuntu.git . &&\
git checkout k8s_v.16_vagrant &&\
git branch &&\
ansible-playbook playbook.yml

