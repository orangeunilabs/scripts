#!/bin/bash
# This script sets up the tools I like on a new debian/ubuntu system.

apt-get update && apt-get upgrade -y

apt-get install curl -y

# Install speedtest-cli
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash > /dev/null
apt-get install speedtest -y > /dev/null

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh > /dev/null

# Install iperf3
apt-get install iperf3 -y > /dev/null