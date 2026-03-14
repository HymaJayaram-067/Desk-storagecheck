Write-Host "==============================="
Write-Host "   Laptop Storage Report"
Write-Host "==============================="

Get-PSDrive -PSProvider FileSystem | Select-Object Name,
@{Name="Total(GB)";Expression={[math]::Round(($_.Used + $_.Free)/1GB,2)}},
@{Name="Used(GB)";Expression={[math]::Round($_.Used/1GB,2)}},
@{Name="Free(GB)";Expression={[math]::Round($_.Free/1GB,2)}},
@{Name="Usage(%)";Expression={[math]::Round(($_.Used/($_.Used+$_.Free))*100,2)}}

Write-Host ""
Write-Host "Report Generated On: $(Get-Date)"
Write-Host "==============================="