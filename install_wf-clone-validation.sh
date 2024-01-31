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

# !Move nextflow executable to the place $PATH can access to, so that nextflow can be sourced at any place.


# Singularity also requires several dependencies. Before install singularity, Go language needs to be installed beforehand.
# Several dependencies
# Update and install several dependencies for Singularity
sudo apt-get update && sudo apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config

# GO installation

wget -q "https://go.dev/dl/go1.21.6.linux-amd64.tar.gz"
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
echo PATH=$PATH:/usr/local/go/bin >> $HOME/.profile
go version

# Singularity installation
export VERSION=3.0.3 && # adjust this as necessary \
    mkdir -p $GOPATH/src/github.com/sylabs && \
    cd $GOPATH/src/github.com/sylabs && \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && \ 
    tar -xzf singularity-${VERSION}.tar.gz && \
    cd ./singularity && \
    ./mconfig

./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install

# !Add the following command to ~/.bashrc file, so that bash completion is available in singulairty.
# . /usr/local/etc/bash_completion.d/singularity

# Obtain wf-clone-validation 
nextflow run epi2me-labs/wf-clone-validation –help


