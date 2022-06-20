function Test-PercentOffParamPath {
  $ModuleRoot = Split-Path $PSScriptRoot
  $PercentOffParamPath = Join-Path $ModuleRoot PercentOffParam.json

  $PercentOffPathTest = Test-Path $PercentOffParamPath
  if (-not $PercentOffPathTest) {
    throw "Cannot locate the Percent Off Parameter *.json file"
  } else {
    Write-Output $PercentOffParamPath
  }
}
