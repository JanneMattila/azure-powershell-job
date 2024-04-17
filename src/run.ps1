#!/usr/bin/env pwsh

Write-Output "Running Azure PowerShell Job..."

# Use managed identity:
Connect-AzAccount -Identity -AccountId $env:AZURE_CLIENT_ID

if ($env:SCRIPT_FILE.Length -gt 0) {
    Write-Output "Running script: $env:SCRIPT_FILE"
    . $env:SCRIPT_FILE
}
else {
    Write-Warning "No script file provided."
}
