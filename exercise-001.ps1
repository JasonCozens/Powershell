$exerciseDirectory = "ex01-" + [guid]::NewGuid().ToString()

New-Item `
    -ItemType Directory `
    -Path $exerciseDirectory

Push-Location `
    -Path $exerciseDirectory

function Remove-Exercise {
    Pop-Location

    Remove-Item `
        -Force `
        -Recurse `
        -Path $exerciseDirectory
}

