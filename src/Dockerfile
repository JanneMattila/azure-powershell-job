# https://mcr.microsoft.com/en-us/product/azure-powershell/tags
FROM mcr.microsoft.com/azure-powershell:alpine-3.17

COPY init.ps1 /bin/
RUN chmod 755 /bin/init.ps1

COPY run.ps1 /bin/
RUN chmod 755 /bin/run.ps1

ENTRYPOINT ["/bin/init.ps1", "/bin/run.ps1"]
