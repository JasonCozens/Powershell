
param (
    [string]
    $StartLocation = "."
)
. .\invoke-command-demo.ps1

Write-Host 'Double and Single Quotes'
 
Push-Location $startLocation

try {
    @{
        "ExampleHeader"="Define variables"
        "Command"={    $hello = "Hello"
        $world = ", world" }
    },
    @{
        "ExampleHeader"="Double quotes"
        "Command"={ Write-Output "$hello$world" }
    # },
    # @{
    #     "ExampleHeader"="SIngle quotes"
    #     "Command"="'$hello$world'"
    # },
    # @{
    #     "ExampleHeader"="Test-Path - path exists."
    #     "Command"='Test-Path ' + $(Get-Location)
    # },
    # @{
    #     "ExampleHeader"="Test-Path - path doesn't exists."
    #     "Command"='Test-Path ' + "$(Get-Location)\$(New-GUid)" 
    # },
    # @{
    #     "ExampleHeader"="Blank"
    #     "Command"="0"
    # },
    # @{
    #     "ExampleHeader"="Fin"
    #     "Command"="'THE END'"
    } |
    ForEach-Object {
        New-Object PSObject `
            -Property $_
    } |
    Invoke-CommandDemo
}
finally
{
    Pop-Location
}
