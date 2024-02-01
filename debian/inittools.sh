#!/bin/bash
# This script sets up the tools I like on a new debian/ubuntu system.

apt-get update && apt-get upgrade -y

echo "---------- UPDATE & UPGRADE COMPLETE ----------\n\n"

apt-get install curl -y

echo "---------- `curl` INSTALLED ----------\n\n"

# Install speedtest-cli
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash 
apt-get install speedtest -y 

echo "---------- SPEEDTEST INSTALLED ----------\n\n"

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh 

echo "---------- TAILSCALE INSTALLED ----------\n\n"

# Install iperf3
apt-get install iperf3 -y 

echo "---------- IPERF3 INSTALLED ----------"
echo "---------- SCRIPT COMPLETE ----------"
