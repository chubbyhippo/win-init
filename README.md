# 
```
$WebClient=New-Object Net.WebClient
$Uri='https://github.com/chubbyhippo/windows/archive/refs/heads/main.zip'
$WebClient.DownloadFile($Uri, "$Home\downloads\windows-main.zip")
Expand-Archive -Path $Home\downloads\windows-main.zip
cmd.exe -/c windows-main\windows-main\Run.bat
rm -fo -r "$Home\downloads\windows-main.zip"
rm -fo -r "$Home\windows-main"
```
```
irm https://raw.githubusercontent.com/chubbyhippo/windows/main/init.ps1 | iex
```
