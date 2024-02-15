pip install pywinrm
winrm get winrm/config/Service
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "http://172.18.7.60/ramp/bitbucket_repos/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file

winrm get winrm/config/Service
winrm get winrm/config/Winrs
winrm enumerate winrm/config/Listener