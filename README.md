# azure-scripts

A collection of one-off bash scripts that are useful for quickly spinning up test SLE workloads in Azure.  

Necessary Dependendies:

azure-cli

bash

Access to https://ifconfig.me

Must be logged in to azure-cli with a valid Microsoft Azure subscription

!!DON'T FORGET TO DELETE YOUR RESOURCE GROUP WHEN YOU ARE DONE WITH IT!!

### Az Env Setup ###

Output available locations on user request, set up resource group in given location, create VNet, subnet, and Network Security Group, add user's SSH client IP to NSG allowed list, and start VM build workflow (list image and VM sizes boolean, name VM, and configure SSH key, choose image type and VM size).

Usage Example: 

bash <(curl -s https://raw.githubusercontent.com/grantmarcroft/azure-scripts/main/az-env-setup.sh)

### Azure Update SSH IP ###

Update rule in NSG in case public IP changed after NSG was created.

Usage Example:

bash <(curl -s https://raw.githubusercontent.com/grantmarcroft/azure-scripts/main/azure-update-ssh-ip.sh)

### Build VM ###

Supplemental script useful after environment (Resource Group, VNet, subnet and NSG) is already set up via Az Env Setup script.

Usage Example:

bash <(curl -s https://raw.githubusercontent.com/grantmarcroft/azure-scripts/main/build-vm.sh)
