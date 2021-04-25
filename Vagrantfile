VAGRANTFILE_API_VERSION = "2"

$info = <<-SCRIPT
  echo "------------------------------------------------------------------"
  echo "| Installation of Ubuntu 16.04 on km1,n1 and n2 has finished     |"
  echo "------------------------------------------------------------------"
  echo ""
  echo "Available options to install Kubernetes"
  echo "1. Install Kubernetes version 1.19.00"
  echo "   execute a command:"
  echo "   vagrant up km1 --provision --provision-with k8s_1.19"
  echo " "
  echo "   To get an access to Kubernetes Dashboard run the command:"
  echo "   sudo kubectl proxy --address='0.0.0.0' --disable-filter=true&"
  echo " "
  echo "   To get a tocken to login to Kubernetes Dashboard run the command:"
  echo "   kubectl -n kubernetes-dashboard describe secret \\$(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print \\$1}')"
  echo " "

SCRIPT


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
    km1.vm.network "forwarded_port", guest: 8001, host: 8888

    config.vm.provision "info", type: "shell", run: "always" do |shell|
        shell.inline = $info
    end
	
    config.vm.provision "k8s_1.19", type: "shell", run: "never" do |shell|
        shell.path = 'provisioners/install_k8s.sh'
        shell.privileged = false
		shell.args = ["1.19.0-00"]
    end
   end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end
