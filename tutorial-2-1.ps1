
param (
    [string]
    $StartLocation = "C:\Source\Binaries"
)
. .\invoke-demo.ps1

Write-Host "Composition: Pipes and Sequences"
 
Push-Location $startLocation

try {
    @{
        "ExampleHeader"="First 20 items."
        "Command"="Get-ChildItem | Select-Object -First 20"
    },
    @{
        "ExampleHeader"="Full paths."
        "Command"="Get-ChildItem | Select-Object FullName | Format-Table | Select-Object -First 20"
    },
    @{
        "ExampleHeader"="Match Product anywhere in path."
        "Command"="Get-ChildItem | Select-Object FullName | Select-String -Pattern '.*Product.*'"
    },
    @{
        "ExampleHeader"="Blank"
        "Command"="0"
    },
    @{
        "ExampleHeader"="Fin"
        "Command"="'THE END'"
    } |
    ForEach-Object {
        New-Object PSObject `
            -Property $_
    } |
    Invoke-Demo
}
finally
{
    Pop-Location
}
