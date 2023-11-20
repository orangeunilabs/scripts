#!/bin/bash
# This script installs docker on debian/ubuntu systems.

apt-get update > /dev/null


# Detect whether we're on debian or ubuntu
. /etc/os-release

apt-get install ca-certificates gnupg > /dev/null
install -m 0755 -d /etc/apt/keyrings  > /dev/null

# Check the ID variable
if [ "$ID" = "ubuntu" ]; then
    echo "Installing Docker Engine on Ubuntu"

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    
    echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

elif [ "$ID" = "debian" ]; then
    echo "Installing Docker Engine on Debian"

    # apt-get install ca-certificates gnupg > /dev/null
    # install -m 0755 -d /etc/apt/keyrings  > /dev/null
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.gpg > /dev/null

    echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

else
    exit 1 "This script only supports Ubuntu and Debian"
fi

apt-get update > /dev/null
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y > /dev/null