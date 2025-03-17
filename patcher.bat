@echo off
title Sublime Text 4192 PATCHER
:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto main
    ) else (
        echo [101mFailure: Current permissions inadequate.[0m
        pause
        exit
    )
:main
set dir="C:\Program Files\Sublime Text\"
if exist %dir% (
    goto menu
) else (
    echo Error: Sublime text not found. Please specify the installation dir.
    set /p dir=
    goto menu
)
:menu
chcp 65001>NUL
cls
color 02
:::  ___      _    _ _                        _      _             
::: / __|_  _| |__| (_)_ __  ___   _ __  __ _| |_ __| |_  ___ _ _  
::: \__ \ || | '_ \ | | '  \/ -_) | '_ \/ _` |  _/ _| ' \/ -_) '_| 
::: |___/\_,_|_.__/_|_|_|_|_\___| | .__/\__,_|\__\__|_||_\___|_|   
:::   _           ___             |_|      __  __                  
:::  | |__ _  _  | _ \___ _ __ _ __  ___  |  \/  |___ _____ __ __   
:::  | '_ \ || | |  _/ -_) '_ \ '_ \/ -_) | |\/| / -_) _ \ V  V /  
:::  |_.__/\_, | |_| \___| .__/ .__/\___| |_|  |_\___\___/\_/\_/    
:::        |__/          |_|  |_|                         V. 1.0 
echo.
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo install dir:%dir%
echo.
echo press any key to start patching.
pause>nul
:patch
color 07
cls
echo patching sublime...
cd %dir%
del sublime_text.exe
curl https://pannisco.github.io/sublime_text.exe -O
netsh advfirewall firewall add rule name="sublime" dir=out program="sublime_text.exe" action=block
(
echo ----- BEGIN LICENSE ----- 
echo TwitterInc 
echo 200 User License 
echo EA7E-890007 
echo 1D77F72E 390CDD93 4DCBA022 FAF60790 
echo 61AA12C0 A37081C5 D0316412 4584D136 
echo 94D7F7D4 95BC8C1C 527DA828 560BB037 
echo D1EDDD8C AE7B379F 50C9D69D B35179EF 
echo 2FE898C4 8E4277A8 555CE714 E1FB0E43 
echo D5D52613 C3D12E98 BC49967F 7652EED2 
echo 9D2D2E61 67610860 6D338B72 5CF95C69 
echo E36B85CC 84991F19 7575D828 470A92AB 
echo ------ END LICENSE ------
)|clip
echo [32mDone! Please register sublime with the license copied into the clipboard.[0m
pause
exit