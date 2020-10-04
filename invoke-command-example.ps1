<#
.DESCRIPTION
    Invoke a command passed in as a script block.
    Write a header with prompt before invoking the command.
.EXAMPLE
    Invoke-CommandExample -ExampleHeader "Use Format List" -Command { Get-ChildItem | Format-List }
#>
function Invoke-CommandExample {
[CmdletBinding()]
param (
    [string]
    $ExampleHeader,
    [scriptblock]
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
    Invoke-Command -NoNewScope -ScriptBlock $Command
    Write-Host "`n$('-' * 80)"
}
