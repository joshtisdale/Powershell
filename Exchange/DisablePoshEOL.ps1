#Create list of users that are DirSynced and have a license. 
$DSA = Get-User -ResultSize unlimited -Filter {(IsDirSynced -eq $true) -and (LastName -ne 'Tisdale') -and (SKUAssigned -eq $true)}

#Set the property to disallow powershell connection to EOL
$DSA | foreach {Set-User -RemotePowerShellEnabled $false}

$DSA | Set-User -RemotePowerShellEnabled $false

Get-User -ResultSize unlimited -Filter {(RemotePowerShellEnabled -eq $true) -and (SKUAssigned -eq $true) -and (LastName -ne 'Tisdale') -and (IsDirSynced -eq $true)}