DISTR=`lsb_release -ds`
if [ "$DISTR" = "Ubuntu 18.04.3 LTS" ]; then
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get nodes
else
    echo "This installer is for Ubuntu 18.04.3 LTS and  you are using a different OS";
fi