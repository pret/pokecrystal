HRAM_START         EQU $ff80
hPushOAM           EQU $ff80 ; 10 bytes

hROMBankBackup     EQU $ff8a
hBuffer            EQU $ff8b
hFF8C              EQU $ff8c
hRTCDayHi          EQU $ff8d
hRTCDayLo          EQU $ff8e
hRTCHours          EQU $ff8f
hRTCMinutes        EQU $ff90
hRTCSeconds        EQU $ff91

hHours             EQU $ff94

hMinutes           EQU $ff96

hSeconds           EQU $ff98

hVBlankCounter     EQU $ff9b

hROMBank           EQU $ff9d
hVBlank            EQU $ff9e
hMapEntryMethod    EQU $ff9f
hMenuReturn        EQU $ffa0

hJoypadReleased    EQU $ffa2
hJoypadPressed     EQU $ffa3
hJoypadDown        EQU $ffa4
hJoypadSum         EQU $ffa5
hJoyReleased       EQU $ffa6
hJoyPressed        EQU $ffa7
hJoyDown           EQU $ffa8
hJoyLast           EQU $ffa9
hInMenu            EQU $ffaa

hPrinter           EQU $ffac
hGraphicStartTile           EQU $ffad
hMoveMon           EQU $ffae
hMapObjectIndexBuffer EQU $ffaf
hObjectStructIndexBuffer EQU $ffb0

hConnectionStripLength EQU $ffaf
hConnectedMapWidth EQU $ffb0

hPastLeadingZeroes EQU $ffb3

hStringCmpString1  EQU $ffb1
hStringCmpString2  EQU $ffb5

hDividend          EQU $ffb3 ; length in b register, before 'call Divide' (max 4 bytes)
hDivisor           EQU $ffb7 ; 1 byte long
hQuotient          EQU $ffb4 ; result (3 bytes long)
hRemainder         EQU $ffb7

hMultiplicand      EQU $ffb4 ; 3 bytes long
hMultiplier        EQU $ffb7 ; 1 byte long
hProduct           EQU $ffb3 ; result (4 bytes long)

hMathBuffer        EQU $ffb8

hPrintNum1         EQU $ffb3
hPrintNum2         EQU $ffb4
hPrintNum3         EQU $ffb5
hPrintNum4         EQU $ffb6
hPrintNum5         EQU $ffb7
hPrintNum6         EQU $ffb8
hPrintNum7         EQU $ffb9
hPrintNum8         EQU $ffba
hPrintNum9         EQU $ffbb
hPrintNum10        EQU $ffbc

hMGStatusFlags     EQU $ffbc

hUsedSpriteIndex   EQU $ffbd
hUsedSpriteTile    EQU $ffbe
hFFBF              EQU $ffbf
hFFC0              EQU $ffc0
hFFC1              EQU $ffc1
hFFC2              EQU $ffc2
hMoneyTemp         EQU $ffc3

hMGJoypadPressed   EQU $ffc3
hMGJoypadReleased  EQU $ffc4

hLCDCPointer              EQU $ffc6
hLYOverrideStart   EQU $ffc7
hLYOverrideEnd     EQU $ffc8
hMobileReceive     EQU $ffc9
hFFCA              EQU $ffca
hLinkPlayerNumber  EQU $ffcb
hFFCC              EQU $ffcc
hSerialSend        EQU $ffcd
hSerialReceive     EQU $ffce

hSCX               EQU $ffcf
hSCY               EQU $ffd0
hWX                EQU $ffd1
hWY                EQU $ffd2
hTilesPerCycle     EQU $ffd3
hBGMapMode         EQU $ffd4
hBGMapThird        EQU $ffd5
hBGMapAddress      EQU $ffd6

hOAMUpdate         EQU $ffd8
hSPBuffer          EQU $ffd9

hBGMapUpdate       EQU $ffdb
hFFDC              EQU $ffdc

hMapAnims          EQU $ffde
hTileAnimFrame     EQU $ffdf

hLastTalked        EQU $ffe0

hRandom            EQU $ffe1
hRandomAdd         EQU $ffe1
hRandomSub         EQU $ffe2
hSecondsBackup     EQU $ffe3
hBattleTurn        EQU $ffe4 ; Which trainers turn is it? 0: Player, 1: Opponent Trainer
hCGBPalUpdate      EQU $ffe5
hCGB               EQU $ffe6
hSGB               EQU $ffe7
hDMATransfer       EQU $ffe8
hMobile            EQU $ffe9
hFFEA              EQU $ffea
hClockResetTrigger EQU $ffeb

HRAM_END EQU $ffff
