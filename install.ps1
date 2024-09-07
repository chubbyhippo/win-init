Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force

# install glazewm
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/.glaze-wm/main/setup.ps1 | Invoke-Expression

# setup autohotkey
$url = "https://raw.githubusercontent.com/chubbyhippo/windows/main/remap.ahk"
$destinationPath = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk"
Invoke-WebRequest -Uri $url -OutFile $destinationPath

# debloat
git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
rm -fo -r Win11Debloat

# ideavim
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/.ideavimrc/main/install.ps1 | Invoke-Expression

# vscode setup
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/code-settings/main/install.ps1| Invoke-Expression

# allow running unsigned scripts 
Set-ExecutionPolicy RemoteSigned
