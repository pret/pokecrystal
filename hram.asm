hPushOAM           EQU $ff80

hROMBankBackup     EQU $ff8a
hBuffer            EQU $ff8b

hRTCDayHi          EQU $ff8d
hRTCDayLo          EQU $ff8e
hRTCHours          EQU $ff8f
hRTCMinutes        EQU $ff90
hRTCSeconds        EQU $ff91

hHours             EQU $ff94

hMinutes           EQU $ff96

hSeconds           EQU $ff98

hROMBank           EQU $ff9d
hVBlank            EQU $ff9e
hMapEntryMethod    EQU $ff9f

hJoypadReleased    EQU $ffa2
hJoypadPressed     EQU $ffa3
hJoypadDown        EQU $ffa4
hJoypadSum         EQU $ffa5
hJoyReleased       EQU $ffa6
hJoyPressed        EQU $ffa7
hJoyDown           EQU $ffa8
hJoyLast           EQU $ffa9

hConnectionStripLength EQU $ffaf
hConnectedMapWidth EQU $ffb0

hPastLeadingZeroes EQU $ffb3

hStringCmpString1  EQU $ffb1
hStringCmpString2  EQU $ffb5

hDividend          EQU $ffb3 ; length in b register, before 'call Divide' (max 4 bytes)
hDivisor           EQU $ffb7 ; 1 byte long
hQuotient          EQU $ffb4 ; result (3 bytes long)

hMultiplicand      EQU $ffb4 ; 3 bytes long
hMultiplier        EQU $ffb7 ; 1 byte long
hProduct           EQU $ffb3 ; result (4 bytes long)

hPrintNum1         EQU $ffb3
hPrintNum2         EQU $ffb4
hPrintNum3         EQU $ffb5
hPrintNum4         EQU $ffb6
hPrintNum5         EQU $ffb7
hPrintNum6         EQU $ffb8
hPrintNum7         EQU $ffb9
hMathBuffer        EQU $ffb8

hMoneyTemp         EQU $ffc3

hLCDStatCustom     EQU $ffc6

hSerialSend        EQU $ffcd
hSerialReceive     EQU $ffce

hSCX               EQU $ffcf
hSCY               EQU $ffd0
hWX                EQU $ffd1
hWY                EQU $ffd2

hBGMapMode         EQU $ffd4
hBGMapThird        EQU $ffd5
hBGMapAddress      EQU $ffd6

hOAMUpdate         EQU $ffd8
hSPBuffer          EQU $ffd9

hBGMapUpdate       EQU $ffdb

hTileAnimFrame     EQU $ffdf

hLastTalked        EQU $ffe0

hRandom            EQU $ffe1
hRandomAdd         EQU $ffe1
hRandomSub         EQU $ffe2

hBattleTurn        EQU $ffe4 ; Which trainers turn is it? 0: Player, 1: Opponent Trainer
hCGBPalUpdate      EQU $ffe5
hCGB               EQU $ffe6
hSGB               EQU $ffe7
hDMATransfer       EQU $ffe8
