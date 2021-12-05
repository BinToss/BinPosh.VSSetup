# EVSDE
#Requires -Modules BinPosh.GVSID

function Enter-VSDevEnv {
    [CmdletBinding()] param (
        # Optional, but recommended. Get-VSInstallDir is used if VSInstallDir is not specified.
        [Parameter()] [String] $VSInstallDir
    )
    if ([string]::isNullOrEmpty($VSInstallDir)) {
        try{
            $VSInstallDir = Get-VSInstallDir -Prerelease $true;
            if ([string]::isNullOrEmpty($VSInstallDir)) {
                throw [System.IO.ArgumentNullException] "Parameter VSInstallDir is null or empty."
            }
        }
        catch {
            throw [System.IO.DirectoryNotFoundException] "Failed to find a Visual Studio or MSBuild instance automatically."
        }
    }
    # Use module `Microsoft.VisualStudio.DevShell.dll`
    Import-Module (Get-ChildItem $VSInstallDir -Recurse -File -Filter Microsoft.VisualStudio.DevShell.dll).FullName
    Enter-VsDevShell -VsInstallDir $VSInstallDir -SkipAutomaticLocation;
}
