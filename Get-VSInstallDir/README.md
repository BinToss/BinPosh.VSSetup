# BinPosh.GVSID | Get-VSInstallDir

Leverage [VSSetup](https://www.powershellgallery.com/packages/VSSetup) to get the path of the latest-versioned Visual Studio or MSBuild instance.

| param         | type      | desc
| ------------- | --------- | ----
| -Prerelease   | boolean   | If $true, search a list of instances including pre-releases. Otherwise, search only stable releases.
| -Filter       | string[]  | Filter the list of instances for the latest-versioned instance containing the specified workloads, components, component groups. (Learn them from an exported VS Installer config file)

Use Filter to find an instance that provides the dependencies required by your project.
i.e.

```powershell
Get-VSInstallDir -Prerelease -Criteria (Get-Content -Path .\criteria.txt).Split("\`n")
```

`Get-VSInstallDir` will return strings such as
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
or
"C:\Program Files\Microsoft Visual Studio\2022\Preview"
