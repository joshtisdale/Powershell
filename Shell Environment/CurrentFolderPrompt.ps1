#Put this in your powershell profile to make your prompt only display the current folder.
#If you want to see the path for your profile, just type $profile in powershell and it will show you a file. 
#The file may not exist and you may need to create it.

function prompt {
    $p = Split-Path -leaf -path (Get-Location)
    "$p> "
  }