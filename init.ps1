Invoke-Expression Set-WinUserLanguageList en-US,th-TH -Force
# install git
#winget install --id Git.Git -e -h --accept-package-agreements --accept-source-agreements
# install choco
Invoke-Expression Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# install programs
Invoke-Expression choco install git -y
Invoke-Expression choco install autohotkey -y
# refresh
Invoke-Expression $Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# install autohotkey
#winget install -e -h Autohotkey.Autohotkey
Invoke-Expression $WebClient=New-Object Net.WebClient
Invoke-Expression $Uri='https://raw.githubusercontent.com/chubbyhippo/windows/main/CapsToChangeInputLanguage.ahk'
Invoke-Expression $WebClient.DownloadFile($Uri, "$Home\CapsToChangeInputLanguage.ahk")
Invoke-Expression $WshShell = New-Object -comObject WScript.Shell
Invoke-Expression $Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.lnk")
Invoke-Expression $Shortcut.TargetPath = "$Home\CapsToChangeInputLanguage.ahk"
Invoke-Expression $Shortcut.Save()

# debloat
Invoke-Expression git clone https://github.com/Raphire/Win11Debloat.git
Invoke-Expression Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
Invoke-Expression rm -fo -r Win11Debloat
