@description('Deploying Storage Account')

param name string = deployment().name

//param sku string = 'Standard_LRS'
param sku string 
param accessTier_value string 
param location string = resourceGroup().location

param tags object = resourceGroup().tags
@description('Tags to apply to the resource.')

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  tags: tags
  sku: {
    name: sku
  }
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Deny'
    }
    accessTier: accessTier_value
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    }


}
resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2019-06-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}
