FROM mcr.microsoft.com/powershell:7.4-alpine-3.17

RUN pwsh -c "Install-Module -Name Az -RequiredVersion 11.5.0 -Scope AllUsers -Repository PSGallery -Force -AllowClobber"

COPY prepare.ps1 /bin/
RUN chmod 755 /bin/prepare.ps1
RUN /bin/prepare.ps1
RUN rm /bin/prepare.ps1

COPY run.ps1 /bin/
RUN chmod 755 /bin/run.ps1

ENTRYPOINT ["/bin/run.ps1"]
