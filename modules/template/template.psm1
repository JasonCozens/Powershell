Write-Host "LOADING $PSScriptRoot"

$privatePath = "$PSScriptRoot\Private\"
$publicPath = "$PSScriptRoot\Public\"
Write-Host "Public Path: $publicPath"

$PrivateFunctions = Get-ChildItem -Path $privatePath -ErrorAction SilentlyContinue
$PublicFunctions = Get-ChildItem -Path $publicPath -ErrorAction SilentlyContinue

foreach ($import in $PrivateFunctions) {
    try {
        Write-Host "Importing $($import.FullName)"
        . $import.FullName
    } catch {
        Write-Error "Failed to import function $($import.FullName): $_"
    }
}

$existing = Get-Command -CommandType Function | Select -ExpandProperty Name
Write-Host $existing.Count

# Dot-source the files.
foreach ($import in $PublicFunctions) {
    try {
        Write-Host "Importing $($import.FullName)"
        . $import.FullName
    } catch {
        Write-Error "Failed to import function $($import.FullName): $_"
    }
}

$ToExport = [System.Collections.ArrayList]@()

$new = Get-Command -CommandType Function | Select -ExpandProperty Name
Write-Host $new.Count

foreach ($f in $new) {
    if (-not $existing.contains($f)) {
        $ToExport.Add($f)
    }
}

foreach ($export in $ToExport) {
    Write-Host "Exporting: $export"
    Export-ModuleMember -Function $export
}
