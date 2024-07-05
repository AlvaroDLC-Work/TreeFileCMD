@echo off
set OutFile=TreeTestFile.txt
powershell.exe -NoProfile -Command "& {Get-ChildItem -Recurse | Sort-Object FullName | ForEach-Object {if ($_.PSIsContainer) { Write-Output ($_.FullName)} else {$size = [math]::round($_.Length / 1KB, 2); Write-Output ($_.FullName + ' - ' + $size + ' KB')}} | Out-File -FilePath '%OutFile%'}"
