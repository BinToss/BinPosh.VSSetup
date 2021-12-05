# BinPosh.VSSetup

A collection of scripts and modules to assist in tasks related to Visual Studio and MSBuild Tools.

## BinPosh.GVSID | Get-VSInstallDir

Leverage the Microsoft module 'VSSetup' to get the path of the latest-versioned MSBuild Tools or Visual Studio instance.

- `-Prerelease`: include prereleases in the list of discovered instances.
- `-Filter`: Filter the discovered instances for specified Workloads, ComponentGroups, Components.

## BinPosh.EVSDE | Enter-VSDevEnv

Imports an instance's DevShell module (`Microsoft.VisualStudio.DevShell.dll`). Then, loads into the developer environment.

- `-VSInstallDir`: the root directory of an instance i.e. `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community` or `C:\Program Files\Microsoft Visual Studio\2022\Preview`. If VSInstallDir is not supplied, invokes Get-VSInstallDir with default parameters.
