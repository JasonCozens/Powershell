<#
.DESCRIPTION
    Invoke a series of examples from a pipeline.
#>
function Invoke-Demo {
[CmdletBinding()] 
param (
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ExampleHeader,   
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Command
)
begin {
    . .\invoke-example.ps1
}
process {
    Invoke-Example `
        -ExampleHeader $ExampleHeader `
        -Command $Command
}
end {

}
}