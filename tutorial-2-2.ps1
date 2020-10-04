
param (
    [string]
    $StartLocation = "."
)
. .\invoke-demo.ps1

Write-Host 'Simplifying conditionals - if ($test) and Test-Path'
 
Push-Location $startLocation

try {
    @{
        "ExampleHeader"="Test Undefined"
        "Command"='if ($x) { "Defined" } else { "Undefined" }'
    },
    @{
        "ExampleHeader"="Test empty string."
        "Command"='$x = ""' + "`n" + '    if ($x) { $true } else { $false }'
    },
    @{
        "ExampleHeader"="Test non-empty string."
        "Command"='$x = "Defined"' + "`n" + '    if ($x) { $true } else { $false }'
    },
    @{
        "ExampleHeader"="Test-Path - path exists."
        "Command"='Test-Path ' + $(Get-Location)
    },
    @{
        "ExampleHeader"="Test-Path - path doesn't exists."
        "Command"='Test-Path ' + "$(Get-Location)\$(New-GUid)" 
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
