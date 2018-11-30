@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\My\Desktop\homework\Cerberus.exe
REM BFCPEICON=C:\Users\My\Desktop\homework\icon.ico
REM BFCPEICONINDEX=2
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Cerberus
REM BFCPEVERDESC=Not a Virus
REM BFCPEVERCOMPANY=Baddwolf
REM BFCPEVERCOPYRIGHT=Open Source
REM BFCPEOPTIONEND
@ECHO ON
cls
@ECHO OFF

echo                                                    Welcome
echo                                                      To
echo    ===================================================================================================================
echo    "                   ______  _______  ______       ______   _______   ______       __    __       _______          "
echo    "                  /      ||   ____||   _  \     |   _  \ |   ____| |   _  \     |  |  |  |     /   ____|         "
echo    "                 |  ,----||  |__   |  |_)  |    |  |_)  ||  |__    |  |_)  |    |  |  |  |    |   (              "
echo    "                 |  |     |   __|  |      /     |   _  < |   __|   |      /     |  |  |  |     \   \             "
echo    "                 |  `----||  |____ |  |\  \____ |  |_)  ||  |____  |  |\  \____ |  `--'  |  ____)   |            "
echo    "                  \______||_______||__| \______||______/ |_______| |__| \______| \______/  |_______/             "
echo    ===================================================================================================================
echo    "                                     Dear Reader, should you chance to go                                        "
echo    "                                        To Hades, do not fail to throw                                           "
echo    "                                       A "Sop to Cerberus" at the gate,                                          "
echo    "                                           His anger to propitiate                                               "
echo    "                                    Don't say "Good dog!" and hope thereby                                       "
echo    "                                      His three fierce heads to pacify.                                          "
echo    "                                      What though he try to be polite                                            "
echo    "                                     And wag his tail with all his might,                                        "
echo    "                                      The Heads must win.-What puzzles me                                        "
echo    "                                       Is why in Hades there should be                                           "
echo    "                                     A Watch dog; 'tis, I should surmise,                                        "
echo    "                                     The last place one would burglarize.                                        "
echo    "==================================================================================================================
title Cerberus
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Vault goto CHOICE
:CONFIRM
powershell -Command $pword = read-host "Enter password" -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword) ; ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .init.txt
set /p pass=<.init.txt & del .init.txt
if NOT %pass%==password goto RETRY
if %pass%==password goto LOCK
echo Invalid choice.
goto CONFIRM

:LOCK
ren Vault "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End

:RETRY
echo Invalid password!!!
goto CONFIRM

:UNLOCK

powershell -Command $pword = read-host "Enter password" -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword) ; ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .init.txt
set /p pass=<.init.txt & del .init.txt
if NOT %pass%==password goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Vault
echo Folder Unlocked successfully
goto End

:FAIL
echo Invalid password!!!
goto UNLOCK

:MAKE
md Vault
goto End

:CHOICE
echo Let's Play A Game!(Y/N)
set/p "cho=>"
if %cho%==Y goto MAKE
if %cho%==y goto MAKE
if %cho%==n goto END
if %cho%==N goto END
goto CHOICE

:End
