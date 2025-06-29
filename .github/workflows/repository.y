#
# Analyze repository with PSRule
#

# For PSRule documentation see:
# https://aka.ms/ps-rule

# For action details see:
# https://aka.ms/ps-rule-action

name: Analyze repository

# Run for main or PRs against main
on:
  push:
    branches:
    - main
  pull_request:
    branches:
    - main

jobs:
  analyze:
    name: Analyze repository
    runs-on: ubuntu-latest
    steps:

    - name: Checkout
      uses: actions/checkout@v4

    - name: Run PSRule analysis
      uses: microsoft/ps-rule@v2.9.0
      with:
        modules: PSRule.Rules.Azure




##Testing Azure Bicep code using PSRule
##az-psrule-demo
#https://github.com/matsest/az-psrule-demo/blob/main/bicep/modules/storage/v1/main.bicep
#https://www.youtube.com/watch?v=3697rG8tkOI

