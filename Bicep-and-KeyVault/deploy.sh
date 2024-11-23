#!/bin/bash

# Variables
RESOURCE_GROUP="<YourResourceGroupName>" # Replace with your resource group name
LOCATION="australiaeast" # Replace with your desired Azure region (e.g., eastus, westus2)
TEMPLATE_FILE="main.bicep" # Replace with the path to your Bicep file
ENVIRONMENT="dev" # Replace with environment 3 letter word rule (dev/tst/stg/prd)
PARAM_FILE="main.$ENVIRONMENT.bicepparam" # Replace with the path to your parameter file
DEPLOYMENT_NAME="deployment-$(date +%Y%m%d%H%M%S)" # Unique deployment name

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it to continue."
    exit 1
fi

# Check if Bicep is installed
if ! az bicep version &> /dev/null; then
    echo "Bicep CLI is not installed. Installing now..."
    az bicep install
fi

# Login to Azure if not already logged in
if ! az account show &> /dev/null; then
    echo "You are not logged into Azure. Logging in now..."
    az login
fi

# Check if the resource group exists
if ! az group show --name "$RESOURCE_GROUP" &> /dev/null; then
    echo "Resource group $RESOURCE_GROUP does not exist. Creating it now..."
    az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
fi

# Deploy the Bicep file with parameter file
echo "Deploying $TEMPLATE_FILE with parameters $PARAM_FILE to resource group $RESOURCE_GROUP..."
az deployment group create \
    --name "$DEPLOYMENT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "$TEMPLATE_FILE" \
    --parameters "$PARAM_FILE"

# Check the deployment status
if [ $? -eq 0 ]; then
    echo "Deployment successful!"
else
    echo "Deployment failed. Check the error message above for more details."
fi