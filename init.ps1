# Check to see if we are currently running "as Administrator"
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    # We are not running "as Administrator" - so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Create a script that downloads and executes the script using irm | iex
    $downloadAndExecuteScript = 'irm https://raw.githubusercontent.com/chubbyhippo/windows/main/install.ps1 | iex';

    # Specify the new script as a parameter with ExecutionPolicy Bypass and NoProfile
    $newProcess.Arguments = "-NoProfile -ExecutionPolicy Bypass -Command {$downloadAndExecuteScript}";

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
}