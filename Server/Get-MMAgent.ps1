Function Get-MMAgent {
    [CmdletBinding()]
                 
    # Parameters used in this function
    Param
    (
        [Parameter(Position=0, Mandatory = $True, HelpMessage="Provide server names", ValueFromPipeline = $true)] 
        $Computername
    ) 
       
    $Results = @()
    #$Credentials = Get-Credential "domain\pawel.janowicz"
 
    ForEach($Server in $Computername)
    {
        Write-Verbose "Processing $server"
     
        Try
        {
            $SCOMGroups = Invoke-Command -Computername $Server -ErrorAction Stop -ScriptBlock { (Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\3.0\Agent Management Groups\") } #-Credential $CRED
        }
        Catch
        {
            $_.Exception.Message
            Continue
        }       
 
        If(!$SCOMGroups)
        {
            Write-Warning "No SCOM groups have been found"
        }
        Else
        {
            ForEach($item in $SCOMGroups)
            {
                $Path = "HKLM:\SOFTWARE\Microsoft\Microsoft Operations Manager\3.0\Agent Management Groups\" + $item.PSChildName + "\Parent Health Services\0"
             
                Try
                {
                    $reg = Invoke-Command -Computername $Server -ErrorAction Stop -ScriptBlock {param($Path) (Get-ItemProperty $Path) }  -ArgumentList $Path #-Credential $Cred
                }
                Catch
                {
                    $_.Exception.Message
                    Continue
                }
 
                If($Reg)
                {
                    $Status = (Get-Service -ComputerName $Server -name HealthService).status
                    $Object = New-Object PSObject -Property ([ordered]@{ 
    
                        Server                  = $Server
                        HealthService           = $Status
                        SCOMGroup               = $item.PSChildName
                        MgmtServer              = $reg.AuthenticationName
                        Port                    = $reg.Port
   
                    })
     
                    $Results += $Object
                }
            }        
        }
    }
 
    If($Results)
    {
        Return $Results
    }
}