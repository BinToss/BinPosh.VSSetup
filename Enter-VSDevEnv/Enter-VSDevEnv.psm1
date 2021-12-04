function Enter-VSDevEnv {
    [CmdletBinding()] param (
        [Parameter()] [bool] $Prerelease = $true
    )

    try {
        $vsInstallDir = Get-vsInstallDir;
    }
    catch {
        Import-Module "$PSScriptRoot\..\deps\Posh.Get-VSInstallDir\src\Get-VSInstallDir.psm1"
        $vsInstallDir = Get-vsInstallDir;
    }

    Import-Module "$vsInstallDir/Common7/Tools/Microsoft.VisualStudio.DevShell.dll";
    Enter-VsDevShell -VsInstallDir $vsInstallDir -SkipAutomaticLocation;
}
