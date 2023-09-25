# 
```
$WebClient=New-Object Net.WebClient
$Uri='https://github.com/chubbyhippo/windows/archive/refs/heads/main.zip'
$WebClient.DownloadFile($Uri, "$Home\downloads\windows.zip")
