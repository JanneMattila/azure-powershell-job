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

Connect-AzAccount -Identity -AccountId $env:AZURE_CLIENT_ID

Write-Output "Running script: $env:SCRIPT_FILE"
. $env:SCRIPT_FILE
