#Requires -Modules VSSetup
$VsReqs = "Microsoft.Component.VC.Runtime.UCRTSDK", "Microsoft.VisualStudio.Workload.NativeDesktop", "Microsoft.VisualStudio.Component.WinXP";
$MatchedVsInstallDir = "";
$msg_noMatches = "Failed to find a Visual Studio or MSBuild Tools install with the following criteria:`n";
foreach ($entry in $VsReqs) {
    $msg_noMatches += "`t" + $entry + "`n";
}

Install-Module -Name VSSetup;
Import-Module VSSetup;
$MatchedVsInstall = Get-VSSetupInstance -All -Prerelease | Select-VSSetupInstance -Latest -Require ($VsReqs);
$MatchedVsInstallDir = $MatchedVsInstall.InstallationPath;
Write-Host $MatchedVsInstallDir;

if ([String]::isNullOrEmpty($MatchedVsInstallDir)) {
    Write-Error -Message $msg_noMatches;
}
