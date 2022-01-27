$basicAppList = "googlechrome,firefox,microsoft-edge,vscode,postman,filezilla,slack,zoom,notepadplusplus"
#$devsAppList = ""

echo "Looking for Chocolatey in the system..."
echo ""

try{
    choco config get cacheLocation
}catch{
     Write-Output "Chocolatey not detected, trying to install now"
     echo " "
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  
     echo " "    

     $appsToInstall = $basicAppList -split "," | foreach { "$($_.Trim())" }
     #$appsToInstall = $devsAppList -split "," | foreach { "$($_.Trim())" }

     foreach ($app in $appsToInstall)
     {
         Write-Host "Installing $app"
         & choco install $app /y
     }

}
