::Playlist in Dos assisted by Gemini Ai in 30 minutes
::No preperation Game Over Finished Programme 15:00 pass 30:00 debugging
:: Problem () in Same line rather than new line. Program Worked and debugged total 1 hour more or less... 

echo off
title Playlist Majos Music

:menu

echo ______------_____-------______-----
echo P L A Y L I S T  M A J O S MUSIC
echo ______------_____-------______-----
echo Choose Song: 1-9
echo 1.BubuKa Gangsta!?
echo 2.Jazzy Drill
echo 3.Ice Ice Toobig
echo 4.Hindi na Ako Galit
echo 5.Kamusta HipHop!?
echo 6.Mangkukulam na Bata
echo 7.Paldo Wey
echo 8.VG Grammar Villagrande Papilo
echo 9. EXIT PLAYER
echo ______------_____-------______-----
pause

:: Input so that chosen number opens File path

set /p choice="Choose a number (1-9) and press Enter:"

if "%choice%"=="1" ( echo Opening track BubuKa Gangsta!?
start "" "majosmusicplaylist\bubukaGangsta.mp3"
pause 
goto menu

) else if "%choice%"=="2" ( 
    
echo Opening track jazzy n Drill
start "" "majosmusicplaylist\JazzynDrill.mp3"
pause 
goto menu


) else if "%choice%"=="3" ( 
echo Opening track Ice Ice Toobig
start "" "majosmusicplaylist\IceIcetubig.mp3"
pause 
goto menu

) else if "%choice%"=="4" (
echo Opening track Hindi na Ako Galit
start "" "majosmusicplaylist\HindinaGalit.mp3"
pause 
goto menu


) else if "%choice%"=="5" (
echo Opening track Kamusta HipHop!?
start "" "majosmusicplaylist\kamustahiphop32bars.mp3"
pause 
goto menu


) else if "%choice%"=="6" (
 echo Opening track Mangkukulam na Bata
start "" "majosmusicplaylist\makukulamnabata.mp3"
pause 
goto menu


) else if "%choice%"=="7" (
 echo Opening track Paldo Wey
start "" "majosmusicplaylist\paldowey.mp3"
pause 
goto menu


 ) else if "%choice%"=="8" (
 echo Opening track Villagrande Papilo VG Grammar
start "" "majosmusicplaylist\vgrammarVillagrandepapilo.mp3"
pause 
goto menu

 ) else if "%choice%"=="9" ( 
echo Exiting the player
pause
exit


) else (

    echo invalid choice ... 
    echo Choose again...
    goto menu
)





