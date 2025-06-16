@description('Deploying Storage Account')

param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'storageaccountname01'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }

}
