@echo off

rem Prompt the user to enter the directory path
set /p directory=Enter the directory path: 

rem Navigate to the specified directory
cd /d "%directory%"

set OutFile=TreeFileOutput.txt

powershell.exe -NoProfile -Command "& {Get-ChildItem -Recurse | Sort-Object FullName | ForEach-Object {if ($_.PSIsContainer) { Write-Output ($_.FullName)} else {$size = [math]::round($_.Length / 1KB, 2); Write-Output ($_.FullName + ' - ' + $size + ' KB')}} | Out-File -FilePath '%OutFile%'}"
