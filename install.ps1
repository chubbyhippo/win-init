Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force

# scoop
runas.exe /user:$(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName) "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/scoop/main/install.ps1 | Invoke-Expression\""

# debloat
git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
rm -fo -r Win11Debloat

# setup autohotkey
$url = "https://raw.githubusercontent.com/chubbyhippo/windows/main/remap.ahk"
$destinationPath = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk"
Invoke-WebRequest -Uri $url -OutFile $destinationPath

# ideavim
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/.ideavimrc/main/install.ps1 | Invoke-Expression

# vscode setup
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/code-settings/main/install.ps1| Invoke-Expression

# install wsl
wsl --install

# allow running unsigned scripts 
Set-ExecutionPolicy RemoteSigned
