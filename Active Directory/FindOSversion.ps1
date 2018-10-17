Get-ADComputer -Filter * -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion -Wrap –Auto

Get-ADComputer -Filter {OperatingSystem -Like “Windows *Server*”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto