# Setting up 3 node K8s  Cluster with docker as container run time 

1. Setup three virtual machine on cloud or on your local computer with at least 4GB RAM
2.  Install same docker version on all 3 nodes 
3. Install same version of kubelet, kubeadm, kubectl on three nodes
4. Bootstrap the cluster on the master node . Out of 3 VM decide one node as master and only execute   the bootstrap commands on that cluster .
5. Verify that the cluster is responsive and that Kubectl is working: using the command 
	**sudo kubectl version** . You should get `Server Version` as well as `Client Version`. 
6. The `kubeadm init` command should output a `kubeadm join` command containing a token and hash. Copy that command and run it with `sudo` on both worker nodes.
7. Verify that all nodes have successfully joined the cluster: using `kubectl get nodes` command .