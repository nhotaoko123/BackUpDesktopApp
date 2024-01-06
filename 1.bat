@echo off
::__      __           _____              
::\ \    / /          |  __ \             
:: \ \  / /_ _ _ __   | |  | |_   _ _   _ 
::  \ \/ / _` | '_ \  | |  | | | | | | | |
::   \  / (_| | | | | | |__| | |_| | |_| |
::    \/ \__,_|_| |_| |_____/ \__,_|\__, |
::                                   __/ |
::                                  |___/ 

REM Check if Scoop is installed
if not exist "%USERPROFILE%\scoop" (
    echo Installing Scoop...
    
    REM Install Scoop
    powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser ; $env:scoop = 'D:\Program Files\scoop' ; [environment]::setEnvironmentVariable('SCOOP','D:\Program Files\scoop','User') ; iex ""& {$(irm get.scoop.sh)} -RunAsAdmin"""

    echo Scoop installation complete.
) else (
    echo Scoop is already installed.
)

powershell -Command "scoop install git; scoop bucket rm main; scoop bucket add main; scoop install 7zip git openssh; scoop bucket add extras"

REM Install the app using Scoop
set str = extras/notepadplusplus
set list = extras/vscode extras/googlechrome extras/winrar extras/android-studio versions/python38 extras/ldplayer extras/rufus extras/skype extras/zoom extras/postman extras/putty main/dotnet-sdk
echo Installing %str%
powershell -Command "scoop install %list%"
echo %str% Installation Complete.

REM Pause to keep the command window open for viewing the output
pause