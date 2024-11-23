# Bicep and KeyVault

### Use Azure Key Vault to pass secure parameter value during Bicep deployment

<div style="display: flex; align-items: center;">
  <img src="https://raw.githubusercontent.com/benc-uk/icon-collection/master/other/bicep.svg" alt="Bicep Logo" width="100">
  <img src="https://raw.githubusercontent.com/benc-uk/icon-collection/master/azure-icons/Key-Vaults.svg" alt="Key Vault Logo" width="100">
</div>

[Reference](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/key-vault-parameter?tabs=azure-cli)

1. Check keyvault is enabled for template deployment.

    ```bash
    az keyvault update  --name ExampleVault --enabled-for-template-deployment true
    ```

2. Create Keyvault if it didn't exists.

    ```bash
    az keyvault create \
    --name ExampleVault \
    --resource-group ExampleGroup \
    --location centralus \
    --enabled-for-template-deployment true
    ```

3. Create Secret to KeyVault.

    ```bash
    az keyvault secret set --vault-name ExampleVault --name "ExamplePassword" --value "hVFkk965BuUv"
    ```
