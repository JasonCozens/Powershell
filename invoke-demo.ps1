<#
.DESCRIPTION
    Invoke a series of examples from a pipeline.
#>
function Invoke-Demo {
[CmdletBinding()] 
param (
    [Parameter(ValueFromPipeline)]
    [string[]]
    $Example
)
begin {
    . .\invoke-example.ps1
}
process {
    Invoke-Example `
        -ExampleHeader $_[0] `
        -Command $_[1]
}
end {

}
}