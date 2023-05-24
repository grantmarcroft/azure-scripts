#!/bin/bash

# Deprecation Notice
echo "# DEPRECATION NOTICE #
echo "This script is deprecated and no longer maintained.  Script currently maintained under https://github.com/susegrant/azure-scripts"
read -p "Continue anyways? (y|n): " continue

if [ $continue != "y" ]; then
        exit;
fi

read -p "Resource Group: " group
read -p "NSG name: " nsg

az network nsg rule create --resource-group $group --nsg-name $nsg --name "Allow SSH" --priority 100 --access Allow --source-address-prefixes $(curl -s https://ifconfig.me)/32 --destination-port-ranges 22 --protocol Tcp --description="Accept SSH connections from my public IP"
