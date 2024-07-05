@echo off
setlocal

rem Prompt the user to enter the directory path
set /p directory=Enter the directory path: 

rem Prompt the user to enter the output file name (without extension)
set /p filename=Enter the output file name (without extension): 
set fullfilename=%filename%.txt

rem Combine directory path and file name
set filepath=%directory%\%filename%.txt



rem Navigate to the specified directory
cd /d "%directory%"

@REM 
@REM rem Execute the PowerShell command
@REM powershell -NoProfile -Command ^
@REM "Get-ChildItem -Recurse | Sort-Object FullName | ForEach-Object { if ($_.PSIsContainer) { Write-Output ('`n' + $_.FullName) } else { $size = [math]::round($_.Length / 1KB, 2); Write-Output ($_.FullName + ' - ' + $size + ' KB') } } | Out-File -FilePath '%fullfilename%'"
@REM 

echo %directory%
echo %fullfilename%
echo Tree view with file sizes has been generated in %filepath%
pause
endlocal
