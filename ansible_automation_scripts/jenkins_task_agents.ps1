param(
    [string]$username,
    [string]$password
)

# Restart the task with specific credentials
$SecurePassword = ConvertTo-SecureString $password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $SecurePassword
$Password = $Credentials.GetNetworkCredential().Password
# Retrieve the scheduled task
$scheduledTask = Get-ScheduledTask -TaskPath '\' | Where-Object { $_.TaskName -match 'Jenkins' }
Stop-ScheduledTask -TaskName $scheduledTask.TaskName
Get-ScheduledTask -TaskName $scheduledTask.TaskName
# Check if the task is found
if ($scheduledTask) {
    $taskAction = $scheduledTask.Actions[0]
    # Create a new action object with the desired properties
    $javaPath = '"C:\Program Files\Java\jdk-21\bin\java.exe"'
    $currentArguments = $taskAction.Arguments
    $modifiedArguments = $currentArguments 

    $newAction = New-ScheduledTaskAction -Execute $javaPath -Argument $modifiedArguments
    
    # Update the scheduled task with the new action
    Set-ScheduledTask -TaskName $scheduledTask.TaskName -TaskPath $scheduledTask.TaskPath -Action $newAction -User $username -Password $Password

} else {
    Write-Host "Scheduled task 'jenkins' not found."
}

Start-ScheduledTask -TaskName $scheduledTask.TaskName
Get-ScheduledTask -TaskName $scheduledTask.TaskName

