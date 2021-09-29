param(
    [parameter()]
    [ValidateSet('Build','Deploy')]
    [string]
    $fileName
)
Import-Module  D:\a\1\s\PSModule\psake\psake-master\src\psake.psm1

#$Error.Clear()

Invoke-PSake $PSScriptRoot\DSC\$fileName.ps1

<#if($Error.count)
{
    Throw "$fileName script failed. Check logs for failure details."
}
#>
