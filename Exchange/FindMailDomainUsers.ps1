$domain = Read-Host -Prompt 'Enter Domain to Seach'

Get-MailBox -Filter {Emailaddresses -like "*@'$domain'"} | FT name,userprincipalname,primarysmtpaddress,OrganizationalUnit -AutoSize | Out-File -FilePath c:\temp\"$domain".txt