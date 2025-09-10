function IP {
    <#
.SYNOPSIS
    This script is part of the BStarkIT PowerShell module collection.
    It is designed to retrieve and display the local and public IP addresses of the system.
.DESCRIPTION
    A Script to retrieve and display the local and public IP addresses of the system.
.NOTES
    Script written by: Brian Stark
    Date: 17/12/2024
    Modified by:
    Date:
    Version: 1.0
.COMPONENT
    PowerShell Version 5
.PARAMETER None
.INPUTS
    This script does not take any input parameters.
.OUTPUTS
    The script outputs the local (LAN) and public (WAN) IP addresses of the system.
.EXAMPLE
    IP
    This command will retrieve and display the local and public IP addresses of the system.
.LINK
    Scripts can be found at: https://github.com/BStarkIT
#>
    $Wan = (New-Object System.Net.WebClient).DownloadString('https://api.ipify.org')
    $Lan = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { ($_.IPAddress -Like '10.*') -or ($_.IPAddress -Like '192.*') -or ($_.IPAddress -Like '172.*') } | Select-Object -ExpandProperty IPAddress
    Write-Output "Lan - $Lan"
    Write-Output "Wan - $WAN"
}
