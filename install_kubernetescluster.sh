#!/usr/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if lscpu | grep -E 'CPU\(s\)|Thread|Core' &>/dev/null; then
    echo -e "${BLUE}CPU, Thread, and Core information:${NC}\n\n"
    lscpu | grep -E 'CPU\(s\)|Thread|Core'
else
    echo -e "${BLUE}Unable to get CPU, Thread, and Core information.${NC}"
fi

if lscpu | grep -i -E 'svm|vmx' &>/dev/null; then
    echo -e "\n\n${GREEN}Virtualization is enabled.${NC}\n\n"
else
    echo -e "${GREEN}Virtualization is not enabled.${NC}\n\n"
fi

if ! command -v vagrant &> /dev/null; then
    echo -e "${BLUE}Vagrant is not installed. Installing...${NC}"
    sudo apt update
    sudo apt install vagrant -y
else
    echo -e "${GREEN}You already have Vagrant installed. Moving forward.${NC}"
fi

# Check if VirtualBox is installed
if ! command -v virtualbox &> /dev/null; then
    echo -e "${BLUE}VirtualBox is not installed. Installing...${NC}"
    sudo apt update
    sudo apt install virtualbox -y
else
    echo -e "${GREEN}You already have VirtualBox installed. Moving forward...${NC}"
fi

echo -e "${BLUE}Making Virtual Machines with Kubernetes Components${NC}"

vagrant up
