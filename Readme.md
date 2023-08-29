
 sudo apt-get update && sudo apt-get install -y git && sudo apt-get install -y mokutil && rm -rf MJ_Kubeadm_KubernetesV1.27_ubuntu22 && git clone https://github.com/knowledgeira/MJ_Kubeadm_KubernetesV1.27_ubuntu22.git && cd MJ_Kubeadm_KubernetesV1.27_ubuntu22 && sudo chmod +x ./install_kubernetescluster.sh && time ./install_kubernetescluster.sh

1.Pre-requisite is to disable secure boot and enable Virtualisation post  that run above command. 

2. This install's kubernetes cluster with the help of kubeadm on Ubuntu (Debian based systems)..tested on Ubuntu 18/20/22/23 version.

3. 1 Master Node and 2 worker nodes -->vagrant machines are created with 1 gb RAM and 1 VCPU.

4.  You can modify vagrant files and increase CPU and RAM as per your need.

5. Follow below commands to get the access Cluster



student@Grayskull:~/MJ_Kubeadm_KubernetesV1.27_ubuntu22-mj$ vagrant status


k8sMaster                 running (virtualbox)
k8sWorker1                running (virtualbox)
k8sWorker2                running (virtualbox)


student@Grayskull:~/MJ_Kubeadm_KubernetesV1.24_ubuntu22-mj$ vagrant ssh k8sMaster
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-67-generic x86_64)

This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Mon Jul 31 07:37:34 2023 from 10.0.2.2


vagrant@k8sMaster:~$ kubectl get nodes -o wide
**NAME         STATUS   ROLES           AGE     VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
k8smaster    Ready    control-plane   5m31s   v1.27.3   192.168.57.8    <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21
k8sworker1   Ready    <none>          3m39s   v1.27.3   192.168.57.9    <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21
k8sworker2   Ready    <none>          111s    v1.27.3   192.168.57.10   <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21




Post reboot go the directory where there is Vagrant file and do vagrant up
