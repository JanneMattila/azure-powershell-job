#!/usr/bin/env pwsh

$PSStyle.OutputRendering = "PlainText"

@"
Azure PowerShell Job

https://github.com/JanneMattila/azure-powershell-job

PowerShell $($PSVersionTable.PSVersion)
$([System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription)
"@ > /etc/motd

Get-Content /etc/motd

# Run the main application
. $args[0]
