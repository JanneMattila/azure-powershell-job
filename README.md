# Azure PowerShell Job

Azure PowerShell Job enables you to run Azure PowerShell script automations.

## Local development

```bash
cd src

# Build
docker build . -t azure-powershell-job:latest --build-arg BUILD_VERSION=local

# Build (DEBUG)
docker build . -t azure-powershell-job:latest --build-arg BUILD_VERSION=local --progress=plain --no-cache

# Run interactively
docker run -it --rm azure-powershell-job:latest

docker run -e AZURE_CLIENT_ID="123" -e SCRIPT_FILE="/scripts/example-job1.ps1" -it --rm azure-powershell-job:latest
```

[Azure/azure-powershell](https://github.com/Azure/azure-powershell)

[mcr.microsoft.com/azure-powershell](https://mcr.microsoft.com/en-us/product/azure-powershell/tags)

[Using Azure PowerShell in a Docker container](https://learn.microsoft.com/en-us/powershell/azure/azureps-in-docker)

[hub.docker.com/microsoft-powershell](https://hub.docker.com/_/microsoft-powershell)

[hub.docker.com/microsoft-azure-powershell](https://hub.docker.com/_/microsoft-azure-powershell)

[mcr.microsoft.com/azure-powershell](https://mcr.microsoft.com/en-us/product/azure-powershell/tags)

[PowerShell-Docker](https://github.com/PowerShell/PowerShell-Docker)
