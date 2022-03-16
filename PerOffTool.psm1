# $ExcludeList = "Test-PercentOffParamPath"
Get-ChildItem $PSScriptRoot\*.ps1 -Exclude $ExcludeList | ForEach-Object {
    . $_.FullName
}

# Default the Percentage off to 10% when 1st imported
Set-PercentOff 0.1 | Out-Null
