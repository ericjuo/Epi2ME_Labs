# Nextflow installation 
#
# Description: This script is to install nextflow application automatically
# 
# Written by: Eric Juo
# 
# First written: Jan 31, 2024
# Last modified: Jan 31,2024

# ------------------------------------------
# Prerequisites
# -----------------------------------------
# Java 11 or later verstion
# Singularity
#
# The follwoing script will install the dependencies, including SDKMAN, a software management tools, and Java 11 from Corretto 17


# Java is recommanded to install through SDK
# The following command is to install SDKMAN, if the system has installed before. Add # before the command to ignore it.
#
# SDK installation
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# Java installation
# If the system has installed Java before. Add # before the command to ignore it.
sdk install java 17.0.6-amzn

# Nextflow installation
# After installation of Java, it meets the requirement to install Nextflow application.
wget -qO- https://get.nextflow.io | bash
chmod +x nextflow

# Install docker
# # Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version of docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test run docker
sudo docker run hello-world

# Obtain wf-clone-validation and show instrucitons
nextflow run epi2me-labs/wf-clone-validation --help

