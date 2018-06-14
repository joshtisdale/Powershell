#Import the AD module to powershell, then use these commands to count users.
#Add the -server switch to change domains. i.e. -server delta.lftltd.net


#For all accounts
(get-aduser -filter *).count

#For only Enabled User Accounts 
(get-aduser -filter *|where {$_.enabled -eq "True"}).count

#For only Disabled User Accounts 
(get-aduser -filter *|where {$_.enabled -ne "False"}).count