Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force
# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# install programs
choco install git -y
choco install autohotkey -y
# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

git clone https://github.com/chubbyhippo/ahk.git $Home\ahk
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.lnk")
$Shortcut.TargetPath = "$Home\ahk\CapsToChangeInputLanguage.ahk"
$Shortcut.Save()

git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force; ls -Recurse *.ps*1 | Unblock-File; .\Win11Debloat\"Win11Debloat.ps1 -RunDefaults -Silent" 'CLI'
