@echo off
setlocal enabledelayedexpansion
color 2
echo.
echo              Dumping W-Fi Data
echo ***********************************************
for /f "skip=9 tokens=*" %%a in ('netsh wlan show profiles') do (
    set "Line=%%a"
    for /f "tokens=3,* delims=: " %%b in ("!Line!") do (
        set "Name=%%c"
        for /f "skip=32 tokens=1,* delims=: " %%d in ('netsh wlan show profile name^="!Name!" key^=clear') do (
    set "tmp=%%d"
    if "!tmp!" == "Key" (
                set "tmp2=%%e"
        for /f "tokens=1,* delims=:" %%f in ("!tmp2!") do (
            set "pass=%%g"

        echo SSID: '!Name!' Password: '!pass:~1!'
        echo ***********************************************
        )
    )

        )
    )
)
echo                   @DarkBitx
