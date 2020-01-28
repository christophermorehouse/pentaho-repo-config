@echo off

cd /d %~dp0engine

call Kitchen.bat /file:.\transformations\ConfigureRepositoryJob.kjb /level:Basic > ..\ConfigurationRun.log

if %errorlevel% == 0 (
goto success
) else (
goto failure
)

:success
cd /d %~dp0
echo "Repository configuration process ran successfully!"
pause
exit

:failure
cd /d %~dp0
echo "Repository configuration process failed. Check ConfigurationRun.log"
pause