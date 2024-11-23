## Use Azure Key Vault to pass secure parameter value during Bicep deployment

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

3. Create Secret to KeyVault

```bash
az keyvault secret set --vault-name ExampleVault --name "ExamplePassword" --value "hVFkk965BuUv"
```