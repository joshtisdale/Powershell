# Gets time stamps for all users in the domain that have NOT logged in since after specified date 
 
import-module activedirectory  
$domain = Read-Host -Prompt 'Enter Domain to Seach'  
$DaysInactive = 90  
$time = (Get-Date).Adddays(-($DaysInactive)) 
  
# Get all AD users with lastLogonTimestamp less than our time 
Get-ADUser -Filter {LastLogonTimeStamp -lt $time} -Server $domain -Properties LastLogonTimeStamp | 
  
# Output hostname and lastLogonTimestamp 
select-object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} | 

#Get the count of items. Comment out to get hostnames.
Measure