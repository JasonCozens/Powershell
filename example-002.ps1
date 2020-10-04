<#
    Example of setting up a demo using Invoke-Demo.
#>
. .\invoke-demo.ps1

@{
    "ExampleHeader"="Example Command 1."
    "Command"="Get-ChildItem"
},
@{
    "ExampleHeader"="Example Command 2."
    "Command"="Get-ChildItem"
} |
ForEach-Object {
    New-Object PSObject `
        -Property $_
} |
Invoke-Demo