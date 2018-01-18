; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

sgb_pal_set: MACRO
	db (SGB_PAL_SET << 3) + 1
	dw PREDEFPAL_\1, PREDEFPAL_\2, PREDEFPAL_\3, PREDEFPAL_\4
	ds 7
ENDM

sgb_pal01: MACRO
	db (SGB_PAL01 << 3) + 1
ENDM

sgb_pal23: MACRO
	db (SGB_PAL23 << 3) + 1
ENDM

sgb_pal_trn: MACRO
	db (SGB_PAL_TRN << 3) + 1
	ds 15
ENDM

sgb_mlt_req: MACRO
	db (SGB_MLT_REG << 3) + 1
	db \1 - 1
	ds 14
ENDM

sgb_chr_trn: MACRO
	db (SGB_CHR_TRN << 3) + 1
	db \1 + (\2 << 1)
	ds 14
ENDM

sgb_pct_trn: MACRO
	db (SGB_PCT_TRN << 3) + 1
	ds 15
ENDM


PalPacket_9b96: sgb_pal_set 48, 49, 4A, 4B
PalPacket_9ba6: sgb_pal_set 2B, 24, 20, 00
PalPacket_9bb6: sgb_pal_set 41, 42, 43, 44
PalPacket_9bc6: sgb_pal_set 4C, 4C, 4C, 4C
PalPacket_9bd6: sgb_pal_set 00, 00, 00, 00
PalPacket_9be6: sgb_pal_set 36, 00, 00, 00
PalPacket_9bf6: sgb_pal_set 37, 00, 00, 00
PalPacket_9c06: sgb_pal_set 38, 39, 00, 00
PalPacket_9c16: sgb_pal_set 3A, 00, 00, 00
PalPacket_9c26: sgb_pal_set 3B, 00, 00, 00
PalPacket_9c36: sgb_pal_set 3C, 00, 00, 00
PalPacket_9c46: sgb_pal_set 39, 00, 00, 00
PalPacket_9c56: sgb_pal_set 2E, 2F, 30, 31
PalPacket_9c66: sgb_pal_set 1A, 1A, 1A, 1A
PalPacket_9c76: sgb_pal_set 32, 00, 00, 00
PalPacket_9c86: sgb_pal_set 3C, 00, 00, 00
PalPacket_9c96: sgb_pal_set 3D, 3E, 3F, 40
PalPacket_9ca6: sgb_pal_set 33, 34, 1B, 1F
PalPacket_9cb6: sgb_pal_set 1B, 00, 00, 00
PalPacket_9cc6: sgb_pal_set 1C, 00, 00, 00
PalPacket_9cd6: sgb_pal_set 35, 00, 00, 00

PalPacket_9ce6:
	sgb_pal01
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	ds 1

PalPacket_9cf6:
	sgb_pal23
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	ds 1

PalTrnPacket:  sgb_pal_trn
MltReq1Packet: sgb_mlt_req 1
MltReq2Packet: sgb_mlt_req 2
ChrTrnPacket:  sgb_chr_trn 0, 0
PctTrnPacket:  sgb_pct_trn
