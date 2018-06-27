Get-User -ResultSize unlimited -Filter {(MemberOfGroup -eq 'TechOps')}

#-and (Department -eq 'Accounting')} | Set-User -RemotePowerShellEnabled $false (delete this)