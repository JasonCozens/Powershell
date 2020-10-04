. .\invoke-example.ps1

<#
    Set up a simple directory.

    Display contents on the way.
#>
$rootDirectory = "Example-001"
if (Test-Path $rootDirectory) {
    Remove-Item `
        -Recurse `
        -Force `
        -Path $rootDirectory
}
New-Item -ItemType Directory $rootDirectory
Push-Location $rootDirectory

try {
    Invoke-Example `
        -ExampleHeader "Set-Content" `
        -Command "Set-Content -Path file01.txt -Value 'ABCD'"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem" `
        -Command "Get-ChildItem"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem pipe into Format-List" `
        -Command "Get-ChildItem | Format-List"

    Invoke-Example `
        -ExampleHeader "Set-Content" `
        -Command "Set-Content -Path file02.txt -Value 'EFGH'"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem" `
        -Command "Get-ChildItem"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem pipe into Get-Member" `
        -Command "Get-ChildItem | Get-Member | Format-Table"


    Invoke-Example `
        -ExampleHeader "Add directory" `
        -Command "New-Item -ItemType Directory Example-01 `nNew-Item -ItemType Directory Example-02"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem" `
        -Command "Get-ChildItem"

    Invoke-Example `
        -ExampleHeader "Get-ChildItem pipe into Get-Member" `
        -Command "Get-ChildItem | Get-Member | Format-Table"

} finally {
    Pop-Location
}
