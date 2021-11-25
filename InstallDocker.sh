#!/bin/sh
#This script installs docker with commands from https://docs.docker.com/engine/install/ubuntu/

#check if ran as sudo
if [ $(id -u) -ne 0 ]
  then echo "Please run as root"
  exit
fi
echo "Starting Installation"

#remove old versions installation
echo "Removing old versions"
sleep 0.4
apt-get remove docker docker-engine docker.io containerd runc

#Installing Docker
echo "Installing Now"
sleep 0.4

#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
apt-get update
apt-get apt-get install ca-certificates curl gnupg lsb-release

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#set up the stable repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
tee /etc/apt/sources.list.d/docker.list > /dev/null

#installing docker engine
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

echo "Installation done if no errors above"
echo
echo "Verify Docker Engine is installed correctly by running hello-world image"
sleep 1

docker run hello-world


