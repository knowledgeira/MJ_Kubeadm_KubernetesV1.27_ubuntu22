#!/usr/bin/bash
if ! command -v vagrant &> /dev/null; then
    echo -e "\033[0;31mVagrant is not installed. Installing...\033[0m"
    sudo apt update
    sudo apt install vagrant -y
else
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    echo -e "${GREEN}You already have Vagrant installed. Moving forward.${NC}"
fi

# Check if VirtualBox is installed
if ! command -v virtualbox &> /dev/null; then
    echo -e "\033[0;31mVirtualBox is not installed. Installing...\033[0m"
    sudo apt update
    sudo apt install virtualbox -y
else
    echo -e "${GREEN}You already have VirtualBox installed. Moving forward...${NC}"
fi

echo -e "Making Virtual Machines with Kubernetes Components"
vagrant up

