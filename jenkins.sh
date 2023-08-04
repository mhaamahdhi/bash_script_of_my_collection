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

