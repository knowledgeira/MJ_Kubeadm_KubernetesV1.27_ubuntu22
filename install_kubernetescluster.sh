#!/usr/bin/bash
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
clear

secure_boot_status=$(sudo mokutil --sb-state)
if [[ $secure_boot_status == "SecureBoot enabled" ]]; then
    echo -e "${BLUE}Secure boot: enabled . You need to disbale secure boot from bios\n\n.${NC}"
else
    echo -e "${BLUE}Secure boot: disabled.\n\n.${NC}"
fi

if lscpu | grep -E 'CPU\(s\)|Thread|Core|Virtualization' &>/dev/null; then
    echo -e "\n\nSTEP 1 : ${BLUE}CPU, Thread, and Core information:${NC}"
    echo "------------------------------------------------"

    lscpu | grep -E 'CPU\(s\)|Thread|Core|Virtualization'
else
    echo -e "${BLUE}Unable to get CPU, Thread, and Core information.${NC}"
    echo "------------------------------------------------"

fi

if lscpu | grep -i -E 'svm|vmx' &>/dev/null; then
    echo -e "\n\n${GREEN}STEP 2:Virtualization Status : It is enabled.${NC}"
    echo "------------------------------------------------"

else
    echo -e "\n\n${GREEN}STEP 2 :Virtualization Status: Not enabled.${NC}"
    echo "------------------------------------------------"

fi

if ! command -v vagrant &> /dev/null; then
    echo -e "\n\n ${BLUE}STEP 3 :Vagrant is not installed. Installing...${NC}"
    echo "------------------------------------------------"

    sudo apt update
    sudo apt install vagrant -y
else
    echo -e "\n\n${GREEN} STEP 3 :You already have Vagrant installed. Moving forward.${NC}"
    echo "------------------------------------------------"

fi

# Check if VirtualBox is installed
if ! command -v virtualbox &> /dev/null; then
    echo -e "\n\n${BLUE}STEP 4 :VirtualBox is not installed. Installing...${NC}"
    echo "------------------------------------------------"

    sudo apt update
    sudo apt install virtualbox -y
else
    echo -e "\n\n${GREEN}STEP 4 :You already have VirtualBox installed. Moving forward...${NC}"
    echo "------------------------------------------------"

fi

echo -e "Step 5: \n\n${BLUE}Deploying Kubernetes cluster${NC}"
echo "------------------------------------------------"
sleep 30
vagrant up
