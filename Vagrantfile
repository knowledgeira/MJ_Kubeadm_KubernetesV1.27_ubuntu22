Vagrant.configure("2") do |config|
  config.vm.define "k8sMaster" do |k8sMaster|
    k8sMaster.vm.box = "bento/ubuntu-22.04"
    k8sMaster.vm.network "private_network", ip: "192.168.57.8"
    k8sMaster.vm.hostname = "k8sMaster"
   # k8sMaster.vm.network "forwarded_port", guest: 6443, host: 6443

    k8sMaster.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
    end

    k8sMaster.vm.provision "shell", path: "k8sMaster.sh"
  end

  config.vm.define "k8sWorker1" do |k8sWorker1|
    k8sWorker1.vm.box = "bento/ubuntu-22.04"
    k8sWorker1.vm.network "private_network", ip: "192.168.57.9"
    k8sWorker1.vm.hostname = "k8sWorker1"

    k8sWorker1.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
    end

    k8sWorker1.vm.provision "shell", path: "k8sWorker1.sh"
  end

  config.vm.define "k8sWorker2" do |k8sWorker2|
    k8sWorker2.vm.box = "bento/ubuntu-22.04"
    k8sWorker2.vm.network "private_network", ip: "192.168.57.10"
    k8sWorker2.vm.hostname = "k8sWorker2"

   k8sWorker2.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
    end

    k8sWorker2.vm.provision "shell", path: "k8sWorker2.sh"
  end
end

