VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "n1" do |n1|
    n1.vm.box = "bento/ubuntu-16.04"
    n1.vm.hostname = "c1-node1"
    n1.vm.network :private_network, ip: "172.16.94.11"
  end

  config.vm.define "n2" do |n2|
    n2.vm.box = "bento/ubuntu-16.04"
    n2.vm.hostname = "c1-node2"
    n2.vm.network :private_network, ip: "172.16.94.12"
  end

  config.vm.define "km1" do |km1|
    km1.vm.box = "bento/ubuntu-16.04"
    km1.vm.hostname = "c1-master1"
    km1.vm.network :private_network, ip: "172.16.94.10"
    km1.vm.provision "shell", path: 'provisioners/install_k8s.sh', privileged: false
   end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end
