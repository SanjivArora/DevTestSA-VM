param(
    [parameter(Mandatory=$true)]
    [string]
    $OutputPath
)

Import-Module $PSScriptRoot\..\Assets\DscPipelineTools\DscPipelineTools.psd1 -Force

# Define Unit Test Environment
$DevEnvironment = @{
    Name                        = 'DevEnv';
    Roles = @(
        @{  Role                = 'DNSServer';
            VMName              = 'WindowsVM1';
            Zone                = 'Contoso.com';
            ARecords            = @{'TFSSrv1'= '10.0.0.10';'Client'='10.0.0.15';'BuildAgent'='10.0.0.30';'WindowsVM1'='10.0.0.40';'WindowsVM0'='10.0.0.50'};
            CNameRecords        = @{'DNS' = 'TWindowsVM1.contoso.com'};
        }
    )
}

return New-DscConfigurationDataDocument -RawEnvData $DevEnvironment -OutputPath $OutputPath