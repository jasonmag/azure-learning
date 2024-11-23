using './main.bicep'

param sqlServerName = 'azraeenvprjsql01' // Follow azure naming convention
param adminLogin = 'admin-987654321'
param adminPassword = az.getSecret('<subscription-id>', '<rg-name>', '<key-vault-name>', '<secret-name>', '<secret-version>')
