$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    $usage = ($drive.Used / ($drive.Used + $drive.Free)) * 100

    Write-Host "Drive:" $drive.Name
    Write-Host "Usage:" [math]::Round($usage,2) "%"

    if ($usage -gt 80) {
        Write-Host "⚠ WARNING: Disk usage above 80%" -ForegroundColor Red
    }

    Write-Host "---------------------------"
}