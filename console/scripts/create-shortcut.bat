@echo off

nircmd.exe shortcut "~$folder.system$\cmd.exe" "~$folder.start_menu$\Programs" "Cmd+" "/k C:\Console\profile.cmd"
IF %ERRORLEVEL% EQU 0 echo Done!
pause
