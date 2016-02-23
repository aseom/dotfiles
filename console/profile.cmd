@echo off
:: cmd.exe 실행시 이 스크립트를 실행
:: cmd /k profile.cmd
set "architecture=x64"

:: ASeom@PC-ASEOM
title %USERNAME%@%USERDOMAIN%

:: 옵션으로 경로가 지정되지 않은 경우 사용자 폴더로 이동
IF "%~1" == "" (pushd "%USERPROFILE%") ELSE (pushd "%~1")

:: Print version
ver | find "Windows"
"%~dp0clink\clink_%architecture%.exe" | find "Clink v"

:: Inject Clink & Ansicon
"%~dp0clink\clink_%architecture%.exe" inject --quiet
"%~dp0ansicon\%architecture%\ansicon.exe" -p

:: Load aliases
doskey /macrofile="%~dp0aliases.txt"

:: Set colored prompt
prompt $E[32;40m$P$_$E[0;37;40m$G$S$E[m