@echo off
set VERSION=8.9
set BASE=%USERPROFILE%\.gradle\whitelines-bootstrap\gradle-%VERSION%
if not exist "%BASE%\bin\gradle.bat" (
  if not exist "%USERPROFILE%\.gradle\whitelines-bootstrap" mkdir "%USERPROFILE%\.gradle\whitelines-bootstrap"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$u='https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip'; $z=Join-Path $env:TEMP 'whitelines-gradle.zip'; Invoke-WebRequest $u -OutFile $z; Expand-Archive -Path $z -DestinationPath (Join-Path $env:USERPROFILE '.gradle\whitelines-bootstrap') -Force; Remove-Item $z" || exit /b 1
)
call "%BASE%\bin\gradle.bat" %*
