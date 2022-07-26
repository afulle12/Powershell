#cd install directory
md -Path $env:temp\edgeinstall -erroraction SilentlyContinue | Out-Null
$Download = "MicrosoftEdgeEnterpriseX64.msi"
Write-Output "Downloading Installer..."
Invoke-WebRequest -Uri 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a2662b5b-97d0-4312-8946-598355851b3b/MicrosoftEdgeEnterpriseX64.msi' -OutFile $Download
msiexec /i $Download
Write-Output "Installing Edge..."
Start-Sleep -Seconds 60
cd "C:\Program Files\Mozilla Firefox\uninstall"
Write-Output "Removing Firefox..."
.\helper.exe '/s'
cd "C:\uwapps"
Remove-Item $Download
