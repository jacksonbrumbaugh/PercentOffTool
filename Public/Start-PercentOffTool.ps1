function Start-PercentOffTool {
  $PercentOff = Get-PercentOff

  $ExitOptions = Get-ExitPhraseList

  $MenuLines = (
    ( "Please enter the value to take {0:N0}% off`n" -f (100 * $PercentOff) ) +
      "or enter 'X' to exit the PercentOff Tool`n" +
      ""
  )

  $PreviousHeader = $null
  $HeaderLines = $null
  $KeepTooling = $true
  do {
    Write-Host $MenuLines
    $Prompt = Read-Host "Value"

    Clear-Host

    if ( $Prompt -in $ExitOptions ) {
      $KeepTooling = $false
      if ( $PreviousHeader ) {
        Write-Host $PreviousHeader
      }
    } else {
      $ValueAsDouble = $Prompt -as [double]
      $HeaderLines = if ( -not $ValueAsDouble ) {
        if( $KeepTooling ) {
          "Did not input a valid value `n "
        }
      } else {
        $PercentOffValue = [Math]::Floor(100 * (1 - $PercentOff) * $ValueAsDouble) / 100
        "Previous Value `nValue: {0:N2} `nTo:    {1:N2} `n " -f $ValueAsDouble, $PercentOffValue
      }

      $PreviousHeader = $HeaderLines
      Write-Host $HeaderLines
    }

  } while ($KeepTooling) # End While $KeepTooling

} # End function

('Start-PerOff', 'PerOff') | ForEach-Object {
  Set-Alias -Name $_ -Value 'Start-PercentOffTool'
  Export-ModuleMember -Alias $_
}
