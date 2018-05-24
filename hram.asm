INCLUDE "constants.asm"

SECTION "HRAM", HRAM

hTransferVirtualOAM:: ds 10 ; FF80

hROMBankBackup:: ds 1 ; FF8A
hBuffer:: ds 1
hFF8C:: ds 1

hRTCDayHi:: ds 1
hRTCDayLo:: ds 1
hRTCHours:: ds 1
hRTCMinutes:: ds 1 ; FF90
hRTCSeconds:: ds 1
	ds 2

hHours:: ds 1
	ds 1
hMinutes:: ds 1
	ds 1
hSeconds:: ds 1
	ds 1
	ds 1

hVBlankCounter:: ds 1
	ds 1
hROMBank:: ds 1
hVBlank:: ds 1
hMapEntryMethod:: ds 1
hMenuReturn:: ds 2 ; FFA0

hJoypadReleased:: ds 1
hJoypadPressed:: ds 1
hJoypadDown:: ds 1
hJoypadSum:: ds 1
hJoyReleased:: ds 1
hJoyPressed:: ds 1
hJoyDown:: ds 1
hJoyLast:: ds 1
hInMenu:: ds 1
	ds 1
hPrinter:: ds 1
hGraphicStartTile:: ds 1
hMoveMon:: ds 1

UNION
hMapObjectIndexBuffer:: ds 1
hObjectStructIndexBuffer:: ds 1
NEXTU
hConnectionStripLength:: ds 1
hConnectedMapWidth:: ds 1
ENDU

hStringCmpString1:: ds 2
UNION
hPastLeadingZeroes:: ds 2
hStringCmpString2:: ds 2
NEXTU
UNION
hDividend:: ds 4
hDivisor:: ds 1
NEXTU
	ds 1
hQuotient:: ds 3
hRemainder:: ds 1
NEXTU
	ds 1
hMultiplicand:: ds 3
hMultiplier:: ds 1
NEXTU
hProduct:: ds 4
ENDU
hMathBuffer:: ds 5
NEXTU
hPrintNum1:: ds 1
hPrintNum2:: ds 1
hPrintNum3:: ds 1
hPrintNum4:: ds 1
hPrintNum5:: ds 1
hPrintNum6:: ds 1
hPrintNum7:: ds 1
hPrintNum8:: ds 1
hPrintNum9:: ds 1
hMGStatusFlags::
hPrintNum10:: ds 1
ENDU

hUsedSpriteIndex:: ds 1 ; $ffbd
hUsedSpriteTile:: ds 1 ; $ffbe
hFFBF:: ds 1 ; $ffbf
hFFC0:: ds 1 ; $ffc0
hFFC1:: ds 1 ; $ffc1
hFFC2:: ds 1 ; $ffc2

UNION
hMoneyTemp:: ds 3 ; $ffc3
NEXTU
hMGJoypadPressed:: ds 1 ; $ffc3
hMGJoypadReleased:: ds 1 ; $ffc4
ENDU

hLCDCPointer:: ds 1 ; $ffc6
hLYOverrideStart:: ds 1 ; $ffc7
hLYOverrideEnd:: ds 1 ; $ffc8

hMobileReceive:: ds 1 ; $ffc9
hSerialReceivedNewData:: ds 1 ; $ffca
hSerialConnectionStatus:: ds 1 ; $ffcb
hSerialIgnoringInitialData:: ds 1 ; $ffcc
hSerialSend:: ds 1 ; $ffcd
hSerialReceive:: ds 1 ; $ffce

hSCX:: ds 1 ; $ffcf
hSCY:: ds 1 ; $ffd0
hWX:: ds 1 ; $ffd1
hWY:: ds 1 ; $ffd2
hTilesPerCycle:: ds 1 ; $ffd3
hBGMapMode:: ds 1 ; $ffd4
hBGMapThird:: ds 1 ; $ffd5
hBGMapAddress:: ds 2 ; $ffd6

hOAMUpdate:: ds 1 ; $ffd8
hSPBuffer:: ds 2 ; $ffd9

hBGMapUpdate:: ds 1 ; $ffdb
hBGMapTileCount:: ds 1 ; $ffdc
	ds 1
hMapAnims:: ds 1 ; $ffde
hTileAnimFrame:: ds 1 ; $ffdf

hLastTalked:: ds 1 ; $ffe0

hRandom::
hRandomAdd:: ds 1 ; $ffe1
hRandomSub:: ds 1 ; $ffe2

hSecondsBackup:: ds 1 ; $ffe3
hBattleTurn:: ds 1 ; $ffe4 ; Which trainers turn is it? 0: Player, 1: Opponent Trainer
hCGBPalUpdate:: ds 1 ; $ffe5
hCGB:: ds 1 ; $ffe6
hSGB:: ds 1 ; $ffe7
hDMATransfer:: ds 1 ; $ffe8
hMobile:: ds 1 ; $ffe9
hSystemBooted:: ds 1 ; $ffea
hClockResetTrigger:: ds 1 ; $ffeb
