#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"
$PSStyle.OutputRendering = "PlainText"

Get-Content /etc/motd

"Job parameters:"
"AZURE_CLIENT_ID: $env:AZURE_CLIENT_ID"
"SCRIPT_FILE: $env:SCRIPT_FILE"

# Use managed identity:
if ($env:AZURE_CLIENT_ID.Length -eq 0) {
    Write-Error "AZURE_CLIENT_ID environment variable is not set."
    exit 1
}

if ($env:SCRIPT_FILE.Length -eq 0) {
    Write-Error "SCRIPT_FILE environment variable is not set."
    exit 1
}

# https://github.com/Azure/azure-powershell/issues/22213
if ($env:AZURE_FEDERATED_TOKEN_FILE.Length -gt 0) {
    Write-Information "AZURE_FEDERATED_TOKEN_FILE environment variable is set to $($env:AZURE_FEDERATED_TOKEN_FILE)."
    $params = @{
        ServicePrincipal = $true
        Scope            = "Process"
        ApplicationId    = $env:AZURE_CLIENT_ID
        Tenant           = $env:AZURE_TENANT_ID
        FederatedToken   = Get-Content $env:AZURE_FEDERATED_TOKEN_FILE -Raw
    }
}
else {
    $params = @{
        Identity  = $true
        Scope     = "Process"
        AccountId = $env:AZURE_CLIENT_ID
    }
}

Connect-AzAccount @params

Write-Output "Running script: $env:SCRIPT_FILE"
. $env:SCRIPT_FILE
