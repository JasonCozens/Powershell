<#
    Set up a simple directory.
#>
Set-Content -Path file01.txt -Value "ABCD"
Set-COntent -Path file02.txt -Value "EFGH"
New-Item -ItemType Directory Example-01
New-Item -ItemType Directory Example-02
