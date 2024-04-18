#!/usr/bin/env pwsh

Import-Module -Name Az

@"
Azure PowerShell Job

https://github.com/JanneMattila/azure-powershell-job

PowerShell $($PSVersionTable.PSVersion)
$([System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription)
Az $((Get-InstalledModule -Name 'Az').Version)

"@ > /etc/motd
