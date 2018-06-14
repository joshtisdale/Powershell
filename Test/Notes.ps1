$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://exchangeserver.domain/PowerShell"

Import-PSSession $ExchangeSession