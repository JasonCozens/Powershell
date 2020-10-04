function Invoke-Example {
[CmdletBinding()]
param (
    [string]
    $ExampleHeader,
    [string]
    $Command
)
    Write-Host `
        -NoNewline `
        -Foreground yellow `
        "`n$ExampleHeader [ENTER]" 
    Read-Host
    Write-Output "PS> $Command"
    Invoke-Expression $Command
}

<#
    Set up a simple directory.
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
    $command = "Get-ChildItem"
    Invoke-Example `
        -ExampleHeader "Set-Content" `
        -Command "Set-Content -Path file01.txt -Value 'ABCD'"
    Invoke-Example `
        -ExampleHeader "Get-ChildItem" `
        -Command "Get-ChildItem"
    Read-Host
} finally {
    Pop-Location
}

return


Push-Location .\Example-001
Set-Content -Path file01.txt -Value "ABCD"
Set-Content -Path file02.txt -Value "EFGH"
New-Item -ItemType Directory Example-01
New-Item -ItemType Directory Example-02
