function Test-PercentOffParamPath {
  $PercentOffParamPath = Join-Path $PSScriptRoot PercentOffParam.json
    
  $PercentOffPathTest = Test-Path $PercentOffParamPath
  if (-not $PercentOffPathTest) {
    throw "Cannot locate the Percent Off Parameter *.json file"
  } else {
    Write-Output $PercentOffParamPath
  }
}
