# 
```
$WebClient=New-Object Net.WebClient
$Uri='https://github.com/chubbyhippo/windows/archive/refs/heads/main.zip'
$WebClient.DownloadFile($Uri, "$Home\downloads\windows-main.zip")
Expand-Archive -Path $Home\downloads\windows-main.zip
cmd.exe -/c $Home\Desktop\windows-main\windows-main\Run.bat
```
