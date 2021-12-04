function Get-VSInstallPath {
    [CmdletBinding()] param (
        [Parameter()] [bool] $Prerelease = $true
    )

    Write-Verbose -Message "`$Prerelease == $Prerelease"

    if ($Prerelease) {
        Write-Verbose -Message '"${env:ProgramFiles(x86)}/Microsoft Visual Studio/Installer/vswhere.exe" -prerelease -latest -property installationPath;'
        return & "${env:ProgramFiles(x86)}/Microsoft Visual Studio/Installer/vswhere.exe" -prerelease -latest -property installationPath;
    }
    else {
        Write-Verbose -Message '"${env:ProgramFiles(x86)}/Microsoft Visual Studio/Installer/vswhere.exe" -latest -property installationPath;'
        return & "${env:ProgramFiles(x86)}/Microsoft Visual Studio/Installer/vswhere.exe" -latest -property installationPath;
    }
}
