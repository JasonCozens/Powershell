<#
.DESCRIPTION
    Invoke an expression passed in as a string.
    Write a header with prompt before invoking the expression.
.EXAMPLE
    Invoke-Example -ExampleHeader "Use Format List" -Command "Get-ChildItem | Format-List"
#>
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
        -ForegroundColor yellow `
        "`n$ExampleHeader [ENTER]" 
    Read-Host
    Write-Host `
        -BackgroundColor black `
        -ForegroundColor white `
        "`n`nPS> $Command`n"
    Write-Host
    Invoke-Expression $Command
    Write-Host "`n$('-' * 80)"
}
