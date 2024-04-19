#!/usr/bin/env pwsh
Param (
    [Parameter(HelpMessage = "Image build version", Mandatory = $true)]
    [string] $BuildVersion
)

Import-Module -Name Az

@"
Azure PowerShell Job

https://github.com/JanneMattila/azure-powershell-job
https://hub.docker.com/r/jannemattila/azure-powershell-job
Image: $($BuildVersion)

PowerShell $($PSVersionTable.PSVersion)
$([System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription)
Az $((Get-InstalledModule -Name 'Az').Version)

"@ > /etc/motd
