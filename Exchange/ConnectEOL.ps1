#This script connects a session to Exchange Online. 
#Created by: Josh Tisdale
#Originally Created: 1/28/2018

#Capture the credentials for the connection
$UserCredential = Get-Credential

#Connection string using stored creds. This creates the session and stores it to the $Session variable.
$EOLSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection | 

#Import the session from the variable
Import-PSSession -Session $EOLSession
