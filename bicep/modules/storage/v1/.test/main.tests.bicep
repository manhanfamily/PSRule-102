@description('Configures the location to deploy the Azure resources.')
param location string = resourceGroup().location

module basicstorage '../main.bicep' = {
  name: 'test2334'
  params: {
    sku: 'Storage_LRS'
    location: location
    accessTier_value: 'Cool'
    tags: {
      env: 'test'
    }
  }
}
