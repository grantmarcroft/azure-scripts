#!/bin/bash
# Add VMs to existing RG and Network
# Author: Grant Marcroft

# Deprecation Notice
echo "# DEPRECATION NOTICE #"
echo "This script is deprecated and no longer maintained.  Script currently maintained under https://github.com/susegrant/azure-scripts"
read -p "Continue anyways? (y|n): " continue

if [ $continue != "y" ]; then
        exit;
fi


echo -e "--------\nVM Setup\n--------"

read -p "Remind me, what's your Resource Group name again?: " group
read -p "Region?: " region
read -p "VNet name?: " vnet
read -p "Subnet name?: " subnet
read -p "NSG name?: " nsg

read -p "List Sizes? (y|n): " list_sizes
if [ $list_sizes == "y" ]; then
	az vm list-sizes --location $region | grep "name" | cut -d'"' -f 4 | sort
fi

read -p "List SUSE Images? (y|n): " list_images
if [ $list_images == "y" ]; then
	az vm image list --publisher suse --all | grep urn | cut -d'"' -f4 | sort -r -k 4 -t':'
fi

read -p "Name your VM: " vm_name

read -p "Existing SSH Key Pair? (y|n): " key_exists
if [ $key_exists == "y" ]; then
	read -p "Path To Public Key: " pub_key
	ssh_config="--ssh-key-value $pub_key"
else 
	ssh_config="--generate-ssh-keys"
fi

read -p "Select size (Default is Standard_DS1_v2): " size
if [ -z $size ]; then
	size="Standard_DS1_v2"
fi

read -p "Image to use: (Default is urnAlias: suse:sles-15-sp3:gen2:latest): " image
if [ -z $image ]; then
	image="suse:sles-15-sp3:gen2:latest"
fi

az vm create --resource-group $group --name $vm_name --image $image --size $size --public-ip-sku Standard $ssh_config --vnet-name $vnet --subnet $subnet --nsg $nsg
