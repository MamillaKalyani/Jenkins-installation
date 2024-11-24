#!/bin/bash

echo "Ensure that your software packages are up to date"
sudo yum update –y

echo "Add the Jenkins repo"
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo "Import a key file from Jenkins-CI to enable installation from the package:"
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

echo "Install Java"
sudo dnf install java-17-amazon-corretto -y

echo "Install Jenkins"
sudo yum install jenkins -y

echo "Enable the Jenkins service "
sudo systemctl enable jenkins

echo "Start Jenkins as a service"
sudo systemctl start jenkins