#! /usr/bin/bash
echo "What is the software you are going to install"
echo "****************************************************"
echo "****************************************************"
echo "** | 1=Jenkins | 2=Docker | 3=Ansible | x=Close | **"
echo "****************************************************"
echo "****************************************************"
read -p "Enter the your choice : " app
echo "You entered $app"



case "$app" in 
#case 1 jenkins installation
1)
    #! /usr/bin/bash
    echo "********************************************************************"
    echo "*Now we are going to install the Jenkins CI/CD Server to the system*"
    echo "********************************************************************"
    sudo apt update
    echo "********************************************************************"
    echo "*Now we are going to install the Java runtime to the system         *"
    echo "********************************************************************"
    sudo apt install openjdk-11-jre -y
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    echo "********************************************************************"
    echo "*Now we are going to install the Jenkins installation to the system*"
    echo "********************************************************************"
    sudo apt-get install jenkins -y
    systemctl status jenkins

;;

#case 2 docker installation
2)
    #! /usr/bin/bash
    sudo apt update
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo docker run hello-world
    sudo groupadd docker
    sudo usermod -aG docker ubuntu
    newgrp docker
    docker ps
;;

#case 3 ansible installation
3)
    #! /usr/bin/bash
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible -y

;;

#default case
x)
    echo "use me again :- "

esac