<#
.DESCRIPTION
    Invoke a series of command examples from a pipeline.
#>
function Invoke-CommandDemo {
[CmdletBinding()] 
param (
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ExampleHeader,   
    [Parameter(ValueFromPipelineByPropertyName)]
    [scriptblock]
    $Command
)
begin {
    . .\invoke-command-example.ps1
}
process {
    Invoke-CommandExample `
        -ExampleHeader $ExampleHeader `
        -Command $Command
}
end {

}
}