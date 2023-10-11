################## START OF CODE ##################

function get-systemInfo()
{
   $computerName = $env:COMPUTERNAME
   $computerOS = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ProductName).ProductName
   $osversion = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name CurrentBuild).CurrentBuild
   $network = Get-NetIPAddress -InterfaceAlias "*Ethernet*" -AddressFamily "IPv4" | Select-Object -ExpandProperty IPAddress

   Write-Host "Computer Name: $computerName"
   Write-Host "Operating System: $computerOS $osversion"
   Write-Host "IP Address: $network"
}

get-systemInfo

################## END OF CODE ##################
