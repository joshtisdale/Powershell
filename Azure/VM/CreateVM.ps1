
#To get a list of Offers by publisher:
#RedHat:
#Get-AzureRmVMImageSku -Location "East US" -PublisherName RedHat

#To then get the list of SKUs:
#Get-AzureRmVMImageSku -Location "East US" -PublisherName RedHat -Offer RHEL

#The -ImageName property is in the format of "PublisherName:Offer:SKU"

New-AzureRmVm `
    -ResourceGroupName "APP-PLM" `
    -Name "APP-AEUS-PLM04" `
    -Location "EastUS" `
    -Credential $cred `
    -VirtualNetworkName "10.208.16.0-US" `
    -SubnetName "App-10.208.19.0" `
    -SubnetAddressPrefix "10.208.19.0/27" `
    -SecurityGroupName "None" `
    -Image "RHEL:6.9" `
    -PublicIpAddressName $null `
    -Size "Standard_E4s_v3" `
    -AvailabilitySetName "APP-PLM-PROD" `
    -whatif `
    -verbose

    #The -AsJob parameter creates the VM as a background task, so the PowerShell prompts return to you. You can view details of background jobs with the Get-Job cmdlet.