# Ansible Hosts installation and configuration in the system [Author by Sudarshan Damahe]


    Do the Following steps to Configure the Ansible agents
        winrm get winrm/config/Service
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $url = "http://172.18.7.60/ramp/bitbucket_repos/ConfigureRemotingForAnsible.ps1"
        $file = "$env:temp\ConfigureRemotingForAnsible.ps1"
        (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
        powershell.exe -ExecutionPolicy ByPass -File $file
        
        winrm get winrm/config/Service
        winrm get winrm/config/Winrs
        winrm enumerate winrm/config/Listener
# Java install in ansible workspace.

    Download the Java from the "http://172.18.7.60/ramp/bitbucket_repos/jdk-21_windows-x64_bin.msi"
    and add to ansible playbook path.

# Setup Ansible agents 

    log in to windows agents and open powershell with run as administrator.
    and use following commands
        set-executionPolicy remotesigned
        enter A
    
    then,
        Copy the existing file @ansible_agents-setup.ps1 to downloads 
        Run the ansible_agents-setup.ps1 with administrator
    Done