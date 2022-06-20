$ModuleHome = $PSScriptRoot

$DirsToLoad = @(
  "Public",
  "Private"
)

$PathsToLoad = $DirsToLoad | ForEach-Object {
  Join-Path $ModuleHome $_
}

$PathsToLoad | ForEach-Object {
  $Path = $_
  if ( -not (Test-Path $Path) ) {
    Write-Warning ( "Failed to locate " + $Path )
  } else {
    Get-ChildItem $Path\*.ps1 | ForEach-Object {
      . $_.FullName
    }
  }
}

Get-ChildItem $PSScriptRoot\Public | ForEach-Object {
  $FuncName = $_.BaseName
  Export-ModuleMember -Function $FuncName
}
