1. chmod +x ./install_kubernetescluster.sh && time ./install_kubernetescluster.sh
2. This install kubernetes cluster with the help of kubeadm.
3.  1 Master Node and 2 worker nodes vagrant machines are created with 1 gb RAM and 1 VCPU. Please modify vagrant files and increase CPU adn RAM as per your need.
4. Follow below commands to get the nodes



**student@Grayskull:~/MJ_Kubeadm_KubernetesV1.24_ubuntu22-mj$ vagrant status
**Current machine states:

k8sMaster                 running (virtualbox)
k8sWorker1                running (virtualbox)
k8sWorker2                running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
**student@Grayskull:~/MJ_Kubeadm_KubernetesV1.24_ubuntu22-mj$ vagrant ssh k8sMaster
**Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-67-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Jul 31 07:42:14 AM UTC 2023

  System load:  0.44921875         Users logged in:          0
  Usage of /:   19.9% of 30.34GB   IPv4 address for cni0:    10.244.0.1
  Memory usage: 73%                IPv4 address for docker0: 172.17.0.1
  Swap usage:   0%                 IPv4 address for eth0:    10.0.2.15
  Processes:    161                IPv4 address for eth1:    192.168.57.8


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Mon Jul 31 07:37:34 2023 from 10.0.2.2
**vagrant@k8sMaster:~$ kubectl get nodes -o wide
**NAME         STATUS   ROLES           AGE     VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
k8smaster    Ready    control-plane   5m31s   v1.27.3   192.168.57.8    <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21
k8sworker1   Ready    <none>          3m39s   v1.27.3   192.168.57.9    <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21
k8sworker2   Ready    <none>          111s    v1.27.3   192.168.57.10   <none>        Ubuntu 22.04.2 LTS   5.15.0-67-generic   containerd://1.6.21
