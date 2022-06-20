function Get-PercentOff {
  $PercentOffParamPath = Test-PercentOffParamPath

  $PercentOffParamContent = Get-Content $PercentOffParamPath
  $PercentOffParamJson = $PercentOffParamContent | ConvertFrom-Json
  $PercentOffParam = $PercentOffParamJson | Select-Object -ExpandProperty PercentOff

  Write-Output $PercentOffParam
} # End function

('Get-PerOff') | ForEach-Object {
  Set-Alias -Name $_ -Value 'Get-PercentOff'
}
