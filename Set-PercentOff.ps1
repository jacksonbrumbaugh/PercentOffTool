function Set-PercentOff {
  param(
    [Double]
    [Parameter(Mandatory, ValueFromPipeline)]
    $Value
  )

  process {
    $PercentOffParamPath = Test-PercentOffParamPath

    @{ PercentOff = $Value } | ConvertTo-Json | Set-Content -Path $PercentOffParamPath

    $Result = @{
      Path = $PercentOffParamPath
      Value = $Value
    }

    Write-Output $Result
  }
} # End function

('Set-PerOff') | ForEach-Object {
  Set-Alias -Name $_ -Value 'Set-PercentOff'
}
