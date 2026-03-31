

@echo off
setlocal enabledelayedexpansion


:: --- CONFIGURATION ---
set "masterFile=fivxtokenvalue.txt"
set "lockFile=daily_session.txt"
set /a maxClicksPerHour=8
set /a clickValue=22

:: --- 1. LOAD MASTER VALUE ---
if exist "%masterFile%" (
    set /p totalAccumulated=<"%masterFile%"
) else (
    set /a totalAccumulated=0
    echo 0 > "%masterFile%"
)

:: --- DAILY CHECK ---
if exist %lockFile% (
    for /f "tokens=2 delims==" %%A in ('findstr "ClicksInPhase=" %lockFile%') do set /a phaseCount=%%A
    
    if !phaseCount! GEQ %maxClicksPerHour% (
        echo "! HOURLY LIMIT REACHED !phaseCount!/%maxClicksPerHour%"
        echo Current Lifetime Token Value: !totalAccumulated! units
        echo.
        echo To start a new shift, delete '%lockFile%'.
        pause & exit
    )
) else (
    set /a phaseCount=0
)

:: --- PROCESSING CLICK ---
cls
echo ==========================================
echo           FIVX AD TOKENS
echo ==========================================
echo Lifetime Units: !totalAccumulated!
echo Today's Progress: !phaseCount! / %maxClicksPerHour%
echo.
set /p choice="Press [ENTER] to open Ad or [X] to exit: "
if /i "%choice%"=="X" exit

start "" "https://www.facebook.com/majos.belgica/"

:: 2. Update Daily Phase
set /a phaseCount+=1

:: 3. Update Master Accumulation (This is the "Infinite" part)
set /a totalAccumulated+=%clickValue%

:: --- SAVE BOTH FILES ---
:: Save Daily Lock
echo Session Started: %date% %time% > %lockFile%
echo ClicksInPhase=!phaseCount! >> %lockFile%

:: Save Lifetime Total (Overwrites with new total)
echo !totalAccumulated! > "%masterFile%"

:: --- STEP 1: UNHIDE FOR UPDATING ---
if exist "%lockFile%" attrib -s -h "%lockFile%"
if exist "%masterFile%" attrib -s -h "%masterFile%"

:: --- STEP 2: SAVE THE DATA ---
:: Save Daily Lock
echo Session Started: %date% %time% > "%lockFile%"
echo ClicksInPhase=!phaseCount! >> "%lockFile%"

:: Save Lifetime Total
echo !totalAccumulated! > "%masterFile%"

:: --- STEP 3: RE-HIDE (STEALTH MODE) ---
attrib +s +h "%lockFile%"
attrib +s +h "%masterFile%"

echo.
echo SUCCESS: Click #!phaseCount! registered.
echo [DATA SECURED IN STEALTH MODE]
pause

echo.
echo SUCCESS: Click #!phaseCount! registered.
echo New Lifetime Value: !totalAccumulated! units.
pause