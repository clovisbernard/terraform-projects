#!/bin/bash

COUNT_UBUNT=$(grep -i "ubuntu" /etc/*release | wc -l)
COUNT_REDHAT=$(cat /etc/*release | grep -i "rhel" | wc -l)
COUNT_CENTOS=$(cat /etc/*release | grep -i "centos" | wc -l)
if [ "$COUNT_UBUNT" -ne 0 ]; then 
    echo "This is Ubuntu server"
    sleep 2
    echo "Installing Apache2. Please wait================="
    sleep 5
    sudo apt update
    sudo apt install apache2 -y
    sudo systemctl status apache2
elif [ "$COUNT_REDHAT" -ne 0 ]; then
    echo "This is Red Hat server"
    sleep 2
    echo "Installing Apache2. Please wait================="
    sleep 5
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
elif [ "$COUNT_CENTOS" -ne 0 ]; then
    echo "This is CentOS server"
    sleep 2
    echo "Installing Apache2. Please wait================="
    sleep 5
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
else
    echo "I don't know this distro"
fi

function packages_installlation () {
    if [ "$UBUNT_DISTRO" == "Ubuntu" ]; then
        echo "This is Ubuntu OS"
        echo "Installing packages ================"
        apt update
        apt install zip -y
        
        sudo apt-get install -y \
        curl \
        wget \
        vim \
        git \
        make \
        ansible \
        python3-pip \
        openssl \
        rsync \
        jq \
        postgresql-client \
        mariadb-client \
        unzip \
        tree
    else
        echo "Humm, I don't know this one"
    fi
}

function aws_cli () {
    command -v aws >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "AWS CLI is installed already"
    else
        echo "Installing AWS CLI. Please wait ================="
        sleep 2
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        aws --version
    fi
}

function docker () {
    command -v docker >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "docker is installed already"
    else
        echo "Installing docker Please wait ================="
        sleep 2
        sudo apt update
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update
        sudo apt install -y docker-ce docker-ce-cli containerd.io
        sudo usermod -aG docker $USER
        sudo systemctl start docker
        sudo systemctl enable docker
        docker --version
    fi
}

function terraform () {
    command -v terraform >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "terraform is installed already"
    else
        echo "Installing terraform Please wait ================="
        sleep 2
        TERRAFORM_VERSION="1.2.6"
        sudo wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        sudo mv terraform /usr/local/bin
        sudo rm -f terraform terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        terraform --version
    fi
}

function packer () {
    command -v packer >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "packer is installed already"
    else
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update && sudo apt install packer
        packer --version
    fi
}

function kubectl () {
    command -v kubectl >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "kubectl is installed already"
    else
        echo "Installing kubectl Please wait ================="
        sleep 2
        sudo curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl
        sudo chmod +x ./kubectl
        sudo mv kubectl /usr/local/bin/
    fi
}

function kubens_kubectx () {
    command -v kubens_kubectx >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "kubens_kubectx is installed already"
    else
        echo "Installing kubens_kubectx Please wait ================="
        sleep 2
        sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx
        sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens
        sudo chmod +x kubectx kubens
        sudo mv kubens kubectx /usr/local/bin
    fi
}

function helm () {
    command -v helm >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "helm is installed already"
    else
        echo "Installing helm Please wait ================="
        sleep 2
        curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
        sudo  chmod 700 get_helm.sh
        sudo ./get_helm.sh
        sudo helm version
    fi
}

function docker_compose () {
    command -v docker_compose >/dev/null 2>&1
    if [ "$?" -eq "0"]; then
        echo "docker_composeis installed already"
    else
        echo "Installing docker_compose Please wait ================="
        sleep 2
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        docker-compose --version
    fi
}

function create_automation_user () {
    echo "Hello"
}

packages_installlation
aws_cli
docker
terraform
packer
kubectl
kubens_kubectx
helm
docker_compose