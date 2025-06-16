@description('Deploying Storage Account')

param name string = deployment().name

//param sku string = 'Standard_LRS'
param sku string 

param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: sku
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    }

}
