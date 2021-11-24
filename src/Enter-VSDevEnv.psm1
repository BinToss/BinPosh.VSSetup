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

function Enter-VSDevEnv {
    [CmdletBinding()] param (
        [Parameter()] [bool] $Prerelease = $true
    )

    $vsInstallPath = Get-vsInstallPath;
    Write-Verbose -Message "`$vsInstallPath == $vsInstallPath"

    Import-Module "$vsInstallPath/Common7/Tools/Microsoft.VisualStudio.DevShell.dll";
    Enter-VsDevShell -VsInstallPath $vsInstallPath -SkipAutomaticLocation;
}
