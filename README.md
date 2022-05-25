# azure-scripts

A collection of one-off bash scripts that are useful for quickly spinning up test workloads in Azure.  

Necessary Dependendies:

azurecli

bash

Access to https://ifconfig.me

### Az Env Setup ###

Output available locations on user request, sets up resource group in said location, creates VNet, subnet, and Network Security Group, adds SSH IP to NSG, and starts VM build workflow.

### Build VM ###

Useful once environment is already set up via Az Env Setup script.

### Azure Update SSH IP ###

Self-explanatory.
