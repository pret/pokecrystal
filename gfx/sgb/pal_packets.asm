; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

MACRO sgb_pal_set
	db (SGB_PAL_SET << 3) + 1
	dw PREDEFPAL_\1, PREDEFPAL_\2, PREDEFPAL_\3, PREDEFPAL_\4
	ds 7, 0
ENDM

MACRO sgb_pal01
	db (SGB_PAL01 << 3) + 1
ENDM

MACRO sgb_pal23
	db (SGB_PAL23 << 3) + 1
ENDM

PalPacket_GSTitleScreen:
	sgb_pal_set GS_TITLE_SCREEN_0, GS_TITLE_SCREEN_1, GS_TITLE_SCREEN_2, GS_TITLE_SCREEN_3

PalPacket_MagnetTrain:
	sgb_pal_set BETA_SHINY_GREENMON, CGB_BADGE, RB_BROWNMON, ROUTES

PalPacket_BetaPoker:
	sgb_pal_set BETA_POKER_0, BETA_POKER_1, BETA_POKER_2, BETA_POKER_3

PalPacket_UnownPuzzle:
	sgb_pal_set UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE

PalPacket_AllPal0:
	sgb_pal_set ROUTES, ROUTES, ROUTES, ROUTES

PalPacket_GSIntroShellderLapras:
	sgb_pal_set GS_INTRO_SHELLDER_LAPRAS, ROUTES, ROUTES, ROUTES

PalPacket_BetaIntroLapras: ; unreferenced
	sgb_pal_set BETA_INTRO_LAPRAS, ROUTES, ROUTES, ROUTES

PalPacket_GSIntroJigglypuffPikachu:
	sgb_pal_set GS_INTRO_JIGGLYPUFF_PIKACHU_BG, GS_INTRO_JIGGLYPUFF_PIKACHU_OB, ROUTES, ROUTES

PalPacket_GSIntroStartersTransition:
	sgb_pal_set GS_INTRO_STARTERS_TRANSITION, ROUTES, ROUTES, ROUTES

PalPacket_BetaIntroVenusaur:
	sgb_pal_set BETA_INTRO_VENUSAUR, ROUTES, ROUTES, ROUTES

PalPacket_Pack:
	sgb_pal_set PACK, ROUTES, ROUTES, ROUTES

PalPacket_BetaPikachuMinigame:
	sgb_pal_set GS_INTRO_JIGGLYPUFF_PIKACHU_OB, ROUTES, ROUTES, ROUTES

PalPacket_PartyMenu:
	sgb_pal_set PARTY_ICON, HP_GREEN, HP_YELLOW, HP_RED

PalPacket_BattleGrayscale:
	sgb_pal_set BLACKOUT, BLACKOUT, BLACKOUT, BLACKOUT

PalPacket_Pokegear:
	sgb_pal_set POKEGEAR, ROUTES, ROUTES, ROUTES

PalPacket_Pack2: ; unreferenced
	sgb_pal_set PACK, ROUTES, ROUTES, ROUTES

PalPacket_SlotMachine:
	sgb_pal_set SLOT_MACHINE_0, SLOT_MACHINE_1, SLOT_MACHINE_2, SLOT_MACHINE_3

PalPacket_BetaTitleScreen:
	sgb_pal_set BETA_LOGO_1, BETA_LOGO_2, DIPLOMA, RB_PURPLEMON

PalPacket_Diploma:
	sgb_pal_set DIPLOMA, ROUTES, ROUTES, ROUTES

PalPacket_TradeTube:
	sgb_pal_set TRADE_TUBE, ROUTES, ROUTES, ROUTES

PalPacket_GamefreakLogo:
	sgb_pal_set GS_INTRO_GAMEFREAK_LOGO, ROUTES, ROUTES, ROUTES

PalPacket_Pal01:
	sgb_pal01
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	db 0

PalPacket_Pal23:
	sgb_pal23
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	db 0
