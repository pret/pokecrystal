; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

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

sgb_mask_en: MACRO
	db (SGB_MASK_EN << 3) + 1
	db \1
	ds 14
ENDM

sgb_data_snd: MACRO
	db (SGB_DATA_SND << 3) + 1
	dw \1 ; address
	db \2 ; bank
	db \3 ; length (1-11)
ENDM

; Crystal does not support SGB, so this is unused.

PalTrnPacket:  sgb_pal_trn
MltReq1Packet: sgb_mlt_req 1
MltReq2Packet: sgb_mlt_req 2
ChrTrnPacket:  sgb_chr_trn 0, 0
PctTrnPacket:  sgb_pct_trn

MaskEnFreezePacket: sgb_mask_en 1
MaskEnCancelPacket: sgb_mask_en 0

; These are packets containing SNES code.
; This set of packets is found in several Japanese SGB-compatible titles.
; It appears to be part of NCL's SGB devkit.

DataSndPacket1:
	sgb_data_snd $085d, $0, 11
	db  $8c                 ; cpx #$8c (2)
	db  $d0, $f4            ; bne -$0c
	db  $60                 ; rts
	ds  7

DataSndPacket2:
	sgb_data_snd $0852, $0, 11
	db  $a9, $e7            ; lda #$e7
	db  $9f, $01, $c0, $7e  ; sta $7ec001, x
	db  $e8                 ; inx
	db  $e8                 ; inx
	db  $e8                 ; inx
	db  $e8                 ; inx
	db  $e0                 ; cpx #$8c (1)

DataSndPacket3:
	sgb_data_snd $0847, $0, 11
	db  $c4                 ; cmp #$c4 (2)
	db  $d0, $16            ; bne +$16
	db  $a5                 ; lda dp
	db  $cb                 ; wai
	db  $c9, $05            ; cmp #$05
	db  $d0, $10            ; bne +$10
	db  $a2, $28            ; ldx #$28

DataSndPacket4:
	sgb_data_snd $083c, $0, 11
	db  $f0, $12            ; beq +$12
	db  $a5                 ; lda dp
	db  $c9, $c9            ; cmp #$c9
	db  $c8                 ; iny
	db  $d0, $1c            ; bne +$1c
	db  $a5                 ; lda dp
	db  $ca                 ; dex
	db  $c9                 ; cmp #$c4 (1)

DataSndPacket5:
	sgb_data_snd $0831, $0, 11
	dbw $0c, $caa5          ; tsb $caa5
	db  $c9, $7e            ; cmp #$7e
	db  $d0, $06            ; bne +$06
	db  $a5                 ; lda dp
	db  $cb                 ; wai
	db  $c9, $7e            ; cmp #$7e

DataSndPacket6:
	sgb_data_snd $0826, $0, 11
	db  $39                 ; bne +$39 (2)
	dbw $cd, $0c48          ; cmp $0c48
	db  $d0, $34            ; bne +$34
	db  $a5                 ; lda dp
	db  $c9, $c9            ; cmp #$c9
	db  $80, $d0            ; bra -$30

DataSndPacket7:
	sgb_data_snd $081b, $0, 11
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	                        ; $0820:
	db  $a9, $01            ; lda #01
	dbw $cd, $0c4f          ; cmp $c4f
	db  $d0                 ; bne +$39 (1)

DataSndPacket8:
	sgb_data_snd $0810, $0, 11
	dbw $4c, $0820          ; jmp $0820
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $ea                 ; nop
	db  $60                 ; rts
	db  $ea                 ; nop
	db  $ea                 ; nop
