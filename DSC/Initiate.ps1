param(
    [parameter()]
    [ValidateSet('Build','Deploy')]
    [string]
    $fileName
)
Import-Module  PSModule\psake\psake-master\src\psake.psm1

#$Error.Clear()

Invoke-PSake $PSScriptRoot\InfraDNS\$fileName.ps1

<#if($Error.count)
{
    Throw "$fileName script failed. Check logs for failure details."
}
#>
