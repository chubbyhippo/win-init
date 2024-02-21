# Check to see if we are currently running "as Administrator"
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {  
    # We are not running "as Administrator" - so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter with ExecutionPolicy Bypass and NoProfile
    $newProcess.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"" + $PSCommandPath + `""";

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
}

Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force
# install git
#winget install --id Git.Git -e -h --accept-package-agreements --accept-source-agreements
# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# install programs
choco install git autohotkey -y
# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# install autohotkey
#winget install -e -h Autohotkey.Autohotkey
$WebClient=New-Object Net.WebClient
$Uri='https://raw.githubusercontent.com/chubbyhippo/windows/main/CapsToChangeInputLanguage.ahk'
$WebClient.DownloadFile($Uri, "$Home\CapsToChangeInputLanguage.ahk")
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.lnk")
$Shortcut.TargetPath = "$Home\CapsToChangeInputLanguage.ahk"
$Shortcut.Save()

git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
