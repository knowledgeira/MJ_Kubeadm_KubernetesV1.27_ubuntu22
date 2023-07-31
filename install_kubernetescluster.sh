#!/usr/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if lscpu | grep -E 'CPU\(s\)|Thread|Core' &>/dev/null; then
    echo -e "STEP 1 :" ${BLUE}CPU, Thread, and Core information:${NC}\n\n"
    echo "------------------------------------------------"

    lscpu | grep -E 'CPU\(s\)|Thread|Core'
else
    echo -e "${BLUE}Unable to get CPU, Thread, and Core information.${NC}"
    echo "------------------------------------------------"

fi

if lscpu | grep -i -E 'svm|vmx' &>/dev/null; then
    echo -e "STEP 2 : \n\n${GREEN}Virtualization Status : It is enabled.${NC}\n\n"
    echo "------------------------------------------------"

else
    echo -e "STEP 2 : ${GREEN}Virtualization Status: Not enabled.${NC}\n\n"
    echo "------------------------------------------------"

fi

if ! command -v vagrant &> /dev/null; then
    echo -e "\n\n ${BLUE}Vagrant is not installed. Installing...${NC}"
    echo "------------------------------------------------"

    sudo apt update
    sudo apt install vagrant -y
else
    echo -e "\n\n${GREEN}You already have Vagrant installed. Moving forward.${NC}"
    echo "------------------------------------------------"

fi

# Check if VirtualBox is installed
if ! command -v virtualbox &> /dev/null; then
    echo -e "\n\n${BLUE}VirtualBox is not installed. Installing...${NC}"
    echo "------------------------------------------------"

    sudo apt update
    sudo apt install virtualbox -y
else
    echo -e "\n\n${GREEN}You already have VirtualBox installed. Moving forward...${NC}"
    echo "------------------------------------------------"

fi

echo -e "Step 4: \n\n${BLUE}Deploying Kubernetes cluster${NC}"
echo "------------------------------------------------"

vagrant up
