
$GWName = "P2S-VPN-GW"
$ResourceGroup = "INF-AEUS"

#Get the virtual network gateway that you want to delete.
$GW=get-azurermvirtualnetworkgateway -Name $GWName -ResourceGroupName $ResourceGroup

#Check to see if the virtual network gateway has any connections
get-azurermvirtualnetworkgatewayconnection -ResourceGroupName $ResourceGroup | where-object {$_.VirtualNetworkGateway1.Id -eq $GW.Id}


#Delete all connections.
$Conns = get-azurermvirtualnetworkgatewayconnection -ResourceGroupName $ResourceGroup | where-object {$_.VirtualNetworkGateway1.Id -eq $GW.Id}

$Conns | ForEach-Object {Remove-AzureRmVirtualNetworkGatewayConnection -Name $_.name -ResourceGroupName $_.ResourceGroupName}

#Delete the virtual network gateway.
Remove-AzureRmVirtualNetworkGateway -Name $GWName -ResourceGroupName $ResourceGroup



