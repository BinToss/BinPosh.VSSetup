# GVSID
#Requires -Modules VSSetup

#Install-Module -Name VSSetup;
#Import-Module VSSetup;

# Get-VSInstallDir -Prerelease -Criteria=(Get-Content -Path .\criteria.txt).Split("`n");

function Get-VSInstallDir {
    [CmdletBinding()] param (
        [Parameter()] [bool] $Prerelease = $false,
        [Parameter()] [string[]] $Filter = @()
    )

    $All = ($Prerelease ? (Get-VSSetupInstance -All -Prerelease) : (Get-VSSetupInstance -All));
    $Match = (($Filter.Count.Equals(0)) ? ($All | Select-VSSetupInstance -Latest) : ($All | Select-VSSetupInstance -Latest -Require $Filter));
    if ([String]::isNullOrEmpty($Match.InstallationPath)) {
        $msg_noMatches = "Failed to find a Visual Studio or MSBuild Tools install with the following criteria:`n";
        foreach ($entry in $Filter) {
            $msg_noMatches += "`t" + $entry + "`n";
        }
        Write-Error -Message $msg_noMatches;
    } else {
        return $Match.InstallationPath;
    }
}
