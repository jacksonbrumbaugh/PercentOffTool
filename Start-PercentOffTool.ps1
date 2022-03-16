function Start-PercentOffTool {
  $PercentOff = Get-PercentOff

  $ExitOptions = (
    "End",
    "Exit",
    "Stop",
    "X"
  )

  $MenuLines =
  "Please enter the value to take $(100 * $PercentOff)% off `n" +
  "or enter 'X' to exit the PercentOff Tool `n" +
  ""

  $KeepTooling = $true
  while ($KeepTooling) {
    Write-Host $MenuLines

    $Prompt = Read-Host "Value"

    Clear-Host

    if ($Prompt -in $ExitOptions) {
      $KeepTooling = $false
      Write-Host $PreviousHeader
    }

    $ValueAsDouble = $Prompt -as [double]
    $HeaderLines = if ( -not $ValueAsDouble ) {
      if( $KeepTooling) {
        "Did not input a valid value `n "
      } else {
        ""
      }
    } else {
      $PercentOffValue = [Math]::Floor(100 * (1 - $PercentOff) * $ValueAsDouble) / 100
      "Previous Value `nValue: $ValueAsDouble `nTo:    $PercentOffValue `n "
    }

    $PreviousHeader = $HeaderLines

    Write-Host $HeaderLines

  } # End While $KeepTooling

} # End function

('Start-PerOff', 'PerOff') | ForEach-Object {
  Set-Alias -Name $_ -Value 'Start-PercentOffTool'
}
