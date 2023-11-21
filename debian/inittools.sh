#!/bin/bash
# This script sets up the tools I like on a new debian/ubuntu system.

apt-get update && apt-get upgrade -y

apt-get install curl -y

# Install speedtest-cli
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash 
apt-get install speedtest -y 

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh 

# Install iperf3
apt-get install iperf3 -y 