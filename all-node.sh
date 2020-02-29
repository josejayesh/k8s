
# Install Docker CE, Kubeadm, Kubelet, and Kubectl in Ubuntu 18.04.3 LTS
# Check the version is Ubuntu - 18.04.3 
DISTR=`lsb_release -ds`
if [ "$DISTR" = "Ubuntu 18.04.3 LTS" ]; then

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
sudo apt-mark hold docker-
sudo usermod -ag docker $(whoami)
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update

sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00

sudo apt-mark hold kubelet kubeadm kubectl
else
    echo "This installer is for Ubuntu 18.04.3 LTS and  you are using a different OS";
fi
