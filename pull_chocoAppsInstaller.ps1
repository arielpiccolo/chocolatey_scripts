clear
echo "Downloading chocoAppsInstaller"
echo ""
Invoke-WebRequest https://github.com/arielpiccolo/chocolatey_scripts/archive/refs/heads/main.zip  -OutFile ./main.zip
Start-Sleep -s 2
clear
$filepath = Resolve-Path "main.zip"
Expand-Archive "$filepath" -Force
Remove-Item *.zip
Start-Sleep -s 2
clear
echo ""
echo "Extracting Files..."
echo ""
Start-Sleep -s 2
echo "Done!"