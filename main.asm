SECTION "bank0",HOME

INCBIN "baserom.gbc",$0,$3041

ByteFill:  ; 0x3041
; fill BC bytes with the value of A, starting at HL
	inc b  ; we bail *when* b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.PutByte
	ld [hli], a
.HandleLoop
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret

GetFarByte: ; 0x304d
; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	ld [$ff00+$8b], a
	ld a, [$ff00+$9d]
	push af
	ld a, [$ff00+$8b]
	rst $10

	; get byte from new bank
	ld a, [hl]
	ld [$ff00+$8b], a

	; bankswitch to previous bank
	pop af
	rst $10

	; return retrieved value in a
	ld a, [$ff00+$8b]
	ret

INCBIN "baserom.gbc",$305d,$30fe-$305d

AddNTimes: ; 0x30fe
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x3105

INCBIN "baserom.gbc",$3105,$4000-$3105

SECTION "bank1",DATA,BANK[$1]

INCBIN "baserom.gbc",$4000,$4000

SECTION "bank2",DATA,BANK[$2]

INCBIN "baserom.gbc",$8000,$a68

CheckShininess: ; 0x8a68
; given a pointer to Attack/Defense DV in bc, determine if monster is shiny.
; if shiny, set carry.
	ld l,c
	ld h,b
	ld a,[hl]
	and a,%00100000 ; is attack DV xx1x?
	jr z,.NotShiny
	ld a,[hli]
	and a,%1111
	cp $A ; is defense DV 1010?
	jr nz,.NotShiny
	ld a,[hl]
	and a,%11110000
	cp $A0 ; is speed DV 1010?
	jr nz,.NotShiny
	ld a,[hl]
	and a,%1111
	cp $A ; is special DV 1010?
	jr nz,.NotShiny
	scf
	ret
.NotShiny
	and a ; clear carry flag
	ret

INCBIN "baserom.gbc",$8a88,$c000-$8a88

SECTION "bank3",DATA,BANK[$3]

INCBIN "baserom.gbc",$c000,$29

SpecialsPointers: ; 0xc029
	dbw $25,$7c28
	dbw $0a,$5ce8
	dbw $0a,$5d11
	dbw $0a,$5d92
	dbw $0a,$5e66
	dbw $0a,$5e82
	dbw $0a,$5efa
	dbw $0a,$5eee
	dbw $0a,$5c92
	dbw $0a,$5cf1
	dbw $0a,$5cfa
	dbw $0a,$5bfb
	dbw $0a,$5c7b
	dbw $0a,$5ec4
	dbw $0a,$5ed9
	dbw $0a,$5eaf
	dbw $0a,$5f47
	dbw $03,$42f6
	dbw $03,$4309
	dbw $41,$50b9
	dbw $03,$434a
	dbw $13,$59e5
	dbw $04,$7a12
	dbw $04,$7a31
	dbw $04,$75db
	dbw $3e,$7b32
	dbw $3e,$7cd2
	dbw $03,$4658
	dbw $05,$559a
	dbw $03,$42e7
	dbw $05,$66d6
	dbw $05,$672a
	dbw $05,$6936
	dbw $0b,$4547
	dbw $05,$6218
	dbw $23,$4c04
	dbw $03,$429d
	dbw $24,$4913
	dbw $03,$42c0
	dbw $03,$42cd
	dbw $03,$4355
	dbw $03,$4360
	dbw $03,$4373
	dbw $03,$4380
	dbw $03,$438d
	dbw $03,$43db
	dbw $23,$4084
	dbw $23,$4092
	dbw $23,$40b6
	dbw $23,$4079
	dbw $23,$40ab
	dbw $00,$0d91
	dbw $00,$31f3
	dbw $00,$0485
	dbw $00,$0fc8
	dbw $00,$1ad2
	dbw $00,$0e4a
	dbw $03,$4230
	dbw $03,$4252
	dbw $00,$3c55
	dbw $00,$3cdf
	dbw $00,$3d47
	dbw $04,$6324
	dbw $02,$4379
	dbw $03,$425a
	dbw $03,$4268
	dbw $03,$4276
	dbw $03,$4284
	dbw $03,$43ef
	dbw $05,$7421
	dbw $05,$7440
	dbw $04,$79a8
	dbw $03,$43fc
	dbw $09,$6feb
	dbw $09,$7043
	dbw $01,$7305
	dbw $01,$737e
	dbw $01,$73f7
	dbw $03,$4419
	dbw $09,$4b25
	dbw $09,$4b4e
	dbw $09,$4ae8
	dbw $13,$587a
	dbw $03,$4434
	dbw $03,$4422
	dbw $13,$59d3
	dbw $22,$4018
	dbw $03,$42b9
	dbw $03,$42da
	dbw $01,$718d
	dbw $01,$71ac
	dbw $0a,$64ab
	dbw $0a,$651f
	dbw $0a,$6567
	dbw $05,$4209
	dbw $3e,$7841
	dbw $03,$443d
	dbw $01,$7413
	dbw $01,$7418
	dbw $01,$741d
	dbw $03,$4472
	dbw $09,$65ee
	dbw $03,$4478
	dbw $03,$44b9
	dbw $05,$6dc7
	dbw $0a,$62a0
	dbw $03,$448f
	dbw $03,$449f
	dbw $03,$44ac
	dbw $46,$6c3e
	dbw $46,$7444
	dbw $46,$75e8
	dbw $46,$77e5
	dbw $46,$7879
	dbw $46,$7920
	dbw $46,$793b
	dbw $5c,$40b0
	dbw $5c,$40ba
	dbw $5c,$4114
	dbw $5c,$4215
	dbw $5c,$44e1
	dbw $5c,$421d
	dbw $5c,$4b44
	dbw $46,$7a38
	dbw $5c,$4bd3
	dbw $45,$7656
	dbw $00,$0150
	dbw $40,$51f1
	dbw $40,$5220
	dbw $40,$5225
	dbw $40,$5231
	dbw $12,$525b
	dbw $22,$6def
	dbw $47,$41ab
	dbw $5c,$4687
	dbw $22,$6e68
	dbw $5f,$5224
	dbw $5f,$52b6
	dbw $5f,$52ce
	dbw $5f,$753d
	dbw $40,$7612
	dbw $22,$6ddb
	dbw $40,$6142
	dbw $12,$589a
	dbw $12,$5bf9
	dbw $13,$70bc
	dbw $22,$6f6b
	dbw $22,$6fd4
	dbw BANK(SpecialDratini),SpecialDratini
	dbw $04,$5485
	dbw $12,$66e8
	dbw $12,$6711
	dbw $03,$4225
	dbw $5c,$4bd2
	dbw $40,$766e
	dbw $40,$77eb
	dbw $40,$783c
	dbw $41,$60a2
	dbw $05,$4168
	dbw $40,$77c2
	dbw $41,$630f
	dbw $40,$7780
	dbw $40,$787b
	dbw $12,$6e12
	dbw $41,$47eb
	dbw $12,$6927
	dbw $24,$4a54
	dbw $24,$4a88
	dbw $03,$4224

INCBIN "baserom.gbc",$c224,$10000-$c224

SECTION "bank4",DATA,BANK[$4]

INCBIN "baserom.gbc",$10000,$14000 - $10000

SECTION "bank5",DATA,BANK[$5]

INCBIN "baserom.gbc",$14000,$18000 - $14000

SECTION "bank6",DATA,BANK[$6]

INCBIN "baserom.gbc",$18000,$1C000 - $18000

SECTION "bank7",DATA,BANK[$7]

INCBIN "baserom.gbc",$1C000,$20000 - $1C000

SECTION "bank8",DATA,BANK[$8]

INCBIN "baserom.gbc",$20000,$24000 - $20000

SECTION "bank9",DATA,BANK[$9]

INCBIN "baserom.gbc",$24000,$28000 - $24000

SECTION "bankA",DATA,BANK[$A]

INCBIN "baserom.gbc",$28000,$2A5e9 - $28000

WildMons1: ; 0x2a5e9
; Johto Pokémon in grass

	db $03,$02 ; Sprout Tower 2F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; day
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; nite
	db 3,GASTLY
	db 4,GASTLY
	db 5,GASTLY
	db 3,RATTATA
	db 6,GASTLY
	db 5,RATTATA
	db 5,RATTATA

	db $03,$03 ; Sprout Tower 3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; day
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; nite
	db 3,GASTLY
	db 4,GASTLY
	db 5,GASTLY
	db 3,RATTATA
	db 6,GASTLY
	db 5,RATTATA
	db 5,RATTATA

	db $03,$05 ; Tin Tower 2F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$06 ; Tin Tower 3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$07 ; Tin Tower 4F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$08 ; Tin Tower 5F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$09 ; Tin Tower 6F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$0a ; Tin Tower 7F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$0b ; Tin Tower 8F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$0c ; Tin Tower 9F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db $03,$0d ; Burned Tower 1F
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE
	; day
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE
	; nite
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE

	db $03,$0e ; Burned Tower B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING
	; day
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING
	; nite
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING

	db $03,$0f ; National Park
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 14,LEDYBA
	db 13,PIDGEY
	db 10,CATERPIE
	db 10,WEEDLE
	db 10,WEEDLE
	; day
	db 12,NIDORAN_F
	db 12,NIDORAN_M
	db 14,SUNKERN
	db 13,PIDGEY
	db 10,CATERPIE
	db 10,WEEDLE
	db 10,WEEDLE
	; nite
	db 12,PSYDUCK
	db 13,HOOTHOOT
	db 14,SPINARAK
	db 15,HOOTHOOT
	db 10,VENONAT
	db 12,VENONAT
	db 12,VENONAT

	db $03,$16 ; Ruins of Alph (outside)
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 20,SMEARGLE
	db 22,SMEARGLE
	db 22,SMEARGLE
	; day
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 20,SMEARGLE
	db 22,SMEARGLE
	db 22,SMEARGLE
	; nite
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 22,WOOPER
	db 22,QUAGSIRE
	db 22,QUAGSIRE

	db $03,$1b ; Ruins of Alph (inner chamber)
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	; day
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	; nite
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN

	db $03,$25 ; Union Cave 1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 6,GEODUDE
	db 6,SANDSHREW
	db 5,ZUBAT
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX
	; day
	db 6,GEODUDE
	db 6,SANDSHREW
	db 5,ZUBAT
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX
	; nite
	db 6,GEODUDE
	db 6,RATTATA
	db 5,WOOPER
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX

	db $03,$26 ; Union Cave B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,ZUBAT
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA
	; day
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,ZUBAT
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA
	; nite
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,WOOPER
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA

	db $03,$27 ; Union Cave B1F
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,ZUBAT
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX
	; day
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,ZUBAT
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX
	; nite
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,QUAGSIRE
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX

	db $03,$28 ; Slowpoke Well B1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE
	; day
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE
	; nite
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE

	db $03,$29 ; Slowpoke Well B2F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; day
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; nite
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE

	db $03,$34 ; Ilex Forest
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 5,CATERPIE
	db 5,WEEDLE
	db 7,METAPOD
	db 7,KAKUNA
	db 7,PIDGEY
	db 6,PARAS
	db 6,PARAS
	; day
	db 5,CATERPIE
	db 5,WEEDLE
	db 7,METAPOD
	db 7,KAKUNA
	db 7,PIDGEY
	db 6,PARAS
	db 6,PARAS
	; nite
	db 5,ODDISH
	db 5,VENONAT
	db 7,ODDISH
	db 7,PSYDUCK
	db 7,HOOTHOOT
	db 6,PARAS
	db 6,PARAS

	db $03,$39 ; Mount Mortar 1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MACHOP
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE
	; day
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MACHOP
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE
	; nite
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MARILL
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE

	db $03,$3a ; Mount Mortar 1F (inside)
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 13,GEODUDE
	db 14,RATTATA
	db 15,MACHOP
	db 14,RATICATE
	db 15,ZUBAT
	db 15,GOLBAT
	db 15,GOLBAT
	; day
	db 13,GEODUDE
	db 14,RATTATA
	db 15,MACHOP
	db 14,RATICATE
	db 15,ZUBAT
	db 15,GOLBAT
	db 15,GOLBAT
	; nite
	db 13,GEODUDE
	db 14,RATTATA
	db 15,RATICATE
	db 14,ZUBAT
	db 15,MARILL
	db 15,GOLBAT
	db 15,GOLBAT

	db $03,$3b ; Mount Mortar 2F (inside)
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 31,GRAVELER
	db 32,MACHOKE
	db 31,GEODUDE
	db 30,RATICATE
	db 28,MACHOP
	db 30,GOLBAT
	db 30,GOLBAT
	; day
	db 31,GRAVELER
	db 32,MACHOKE
	db 31,GEODUDE
	db 30,RATICATE
	db 28,MACHOP
	db 30,GOLBAT
	db 30,GOLBAT
	; nite
	db 31,GRAVELER
	db 31,GEODUDE
	db 30,RATICATE
	db 30,GOLBAT
	db 28,MARILL
	db 32,GOLBAT
	db 32,GOLBAT

	db $03,$3c ; Mount Mortar B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MACHOP
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE
	; day
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MACHOP
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE
	; nite
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MARILL
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE

	db $03,$3d ; Ice Path 1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 21,SWINUB
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,SWINUB
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT
	; day
	db 21,SWINUB
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,SWINUB
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT
	; nite
	db 21,DELIBIRD
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,DELIBIRD
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT

	db $03,$3e ; Ice Path B1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 22,SWINUB
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,SWINUB
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,JYNX
	; day
	db 22,SWINUB
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,SWINUB
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,JYNX
	; nite
	db 22,DELIBIRD
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,DELIBIRD
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,SNEASEL

	db $03,$3f ; Ice Path B2F, Mahogany side
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; day
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; nite
	db 23,DELIBIRD
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,DELIBIRD
	db 26,GOLBAT
	db 22,SNEASEL
	db 24,SNEASEL

	db $03,$40 ; Ice Path B2F, Blackthorn side
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; day
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; nite
	db 23,DELIBIRD
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,DELIBIRD
	db 26,GOLBAT
	db 22,SNEASEL
	db 24,SNEASEL

	db $03,$41 ; Ice Path B3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 24,SWINUB
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,SWINUB
	db 22,JYNX
	db 24,JYNX
	db 26,JYNX
	; day
	db 24,SWINUB
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,SWINUB
	db 22,JYNX
	db 24,JYNX
	db 26,JYNX
	; nite
	db 24,DELIBIRD
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,DELIBIRD
	db 22,SNEASEL
	db 24,SNEASEL
	db 26,SNEASEL

	db $03,$42 ; Whirl Island NW
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db $03,$43 ; Whirl Island NE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db $03,$44 ; Whirl Island SW
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db $03,$45 ; Whirl Island, interior
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db $03,$46 ; Whirl Island SE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db $03,$47 ; Whirl Island B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 23,KRABBY
	db 24,ZUBAT
	db 23,SEEL
	db 25,KRABBY
	db 26,GOLBAT
	db 25,SEEL
	db 25,SEEL
	; day
	db 23,KRABBY
	db 24,ZUBAT
	db 23,SEEL
	db 25,KRABBY
	db 26,GOLBAT
	db 25,SEEL
	db 25,SEEL
	; nite
	db 23,KRABBY
	db 24,ZUBAT
	db 23,KRABBY
	db 25,KRABBY
	db 26,GOLBAT
	db 25,GOLBAT
	db 25,GOLBAT

	db $03,$48 ; Whirl Island B2F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 24,KRABBY
	db 25,ZUBAT
	db 24,SEEL
	db 26,KRABBY
	db 27,GOLBAT
	db 26,SEEL
	db 26,SEEL
	; day
	db 24,KRABBY
	db 25,ZUBAT
	db 24,SEEL
	db 26,KRABBY
	db 27,GOLBAT
	db 26,SEEL
	db 26,SEEL
	; nite
	db 24,KRABBY
	db 25,ZUBAT
	db 24,KRABBY
	db 26,KRABBY
	db 27,GOLBAT
	db 26,GOLBAT
	db 26,GOLBAT

	db $03,$49 ; Whirl Island, Lugia's chamber
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 25,KRABBY
	db 26,ZUBAT
	db 25,SEEL
	db 27,KRABBY
	db 28,GOLBAT
	db 27,SEEL
	db 27,SEEL
	; day
	db 25,KRABBY
	db 26,ZUBAT
	db 25,SEEL
	db 27,KRABBY
	db 28,GOLBAT
	db 27,SEEL
	db 27,SEEL
	; nite
	db 25,KRABBY
	db 26,ZUBAT
	db 25,KRABBY
	db 27,KRABBY
	db 28,GOLBAT
	db 27,GOLBAT
	db 27,GOLBAT

	db $03,$4a ; Silver Cave 1
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 43,GRAVELER
	db 44,URSARING
	db 42,ONIX
	db 45,MAGMAR
	db 45,GOLBAT
	db 20,LARVITAR
	db 15,LARVITAR
	; day
	db 43,GRAVELER
	db 44,URSARING
	db 42,ONIX
	db 45,MAGMAR
	db 45,GOLBAT
	db 20,LARVITAR
	db 15,LARVITAR
	; nite
	db 43,GRAVELER
	db 44,GOLBAT
	db 42,ONIX
	db 42,GOLBAT
	db 45,GOLDUCK
	db 46,GOLBAT
	db 46,GOLBAT

	db $03,$4b ; Silver Cave 2
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 48,GOLBAT
	db 48,MACHOKE
	db 47,URSARING
	db 46,PARASECT
	db 48,PARASECT
	db 15,LARVITAR
	db 20,LARVITAR
	; day
	db 48,GOLBAT
	db 48,MACHOKE
	db 47,URSARING
	db 46,PARASECT
	db 48,PARASECT
	db 15,LARVITAR
	db 20,LARVITAR
	; nite
	db 48,GOLBAT
	db 48,GOLDUCK
	db 46,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 45,MISDREAVUS
	db 45,MISDREAVUS

	db $03,$4c ; Silver Cave 3
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 50,URSARING
	db 20,LARVITAR
	db 15,LARVITAR
	db 20,PUPITAR
	; day
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 50,URSARING
	db 20,LARVITAR
	db 15,LARVITAR
	db 20,PUPITAR
	; nite
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 49,GOLBAT
	db 45,GOLDUCK
	db 53,GOLBAT
	db 53,GOLBAT

	db $03,$4d ; Silver Cave item rooms
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 48,GOLBAT
	db 46,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT
	; day
	db 48,GOLBAT
	db 46,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT
	; nite
	db 45,MISDREAVUS
	db 48,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT

	db $03,$4e ; Dark Cave, Violet entrance
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,TEDDIURSA
	db 4,ZUBAT
	db 4,DUNSPARCE
	; day
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,ZUBAT
	db 4,ZUBAT
	db 4,DUNSPARCE
	; nite
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,ZUBAT
	db 4,ZUBAT
	db 4,DUNSPARCE

	db $03,$4f ; Dark Cave, Blackthorn entrance
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 25,URSARING
	db 20,TEDDIURSA
	db 23,GOLBAT
	db 23,GOLBAT
	; day
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 25,URSARING
	db 30,URSARING
	db 23,GOLBAT
	db 23,GOLBAT
	; nite
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 20,WOBBUFFET
	db 25,WOBBUFFET
	db 23,GOLBAT
	db 23,GOLBAT

	db $18,$03 ; Route 29
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 2,PIDGEY
	db 2,SENTRET
	db 3,PIDGEY
	db 3,SENTRET
	db 2,RATTATA
	db 3,HOPPIP
	db 3,HOPPIP
	; day
	db 2,PIDGEY
	db 2,SENTRET
	db 3,PIDGEY
	db 3,SENTRET
	db 2,RATTATA
	db 3,HOPPIP
	db 3,HOPPIP
	; nite
	db 2,HOOTHOOT
	db 2,RATTATA
	db 3,HOOTHOOT
	db 3,RATTATA
	db 2,RATTATA
	db 3,HOOTHOOT
	db 3,HOOTHOOT

	db $1a,$01 ; Route 30
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 3,LEDYBA
	db 3,CATERPIE
	db 4,CATERPIE
	db 4,PIDGEY
	db 3,WEEDLE
	db 4,HOPPIP
	db 4,HOPPIP
	; day
	db 3,PIDGEY
	db 3,CATERPIE
	db 4,CATERPIE
	db 4,PIDGEY
	db 3,WEEDLE
	db 4,HOPPIP
	db 4,HOPPIP
	; nite
	db 3,SPINARAK
	db 3,HOOTHOOT
	db 4,POLIWAG
	db 4,HOOTHOOT
	db 3,ZUBAT
	db 4,HOOTHOOT
	db 4,HOOTHOOT

	db $1a,$02 ; Route 31
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 4,LEDYBA
	db 4,CATERPIE
	db 5,BELLSPROUT
	db 5,PIDGEY
	db 4,WEEDLE
	db 5,HOPPIP
	db 5,HOPPIP
	; day
	db 4,PIDGEY
	db 4,CATERPIE
	db 5,BELLSPROUT
	db 5,PIDGEY
	db 4,WEEDLE
	db 5,HOPPIP
	db 5,HOPPIP
	; nite
	db 4,SPINARAK
	db 4,POLIWAG
	db 5,BELLSPROUT
	db 5,HOOTHOOT
	db 4,ZUBAT
	db 5,GASTLY
	db 5,GASTLY

	db $0a,$01 ; Route 32
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 4,EKANS
	db 5,RATTATA
	db 7,BELLSPROUT
	db 6,HOPPIP
	db 7,PIDGEY
	db 7,HOPPIP
	db 7,HOPPIP
	; day
	db 4,EKANS
	db 5,RATTATA
	db 7,BELLSPROUT
	db 6,HOPPIP
	db 7,PIDGEY
	db 7,HOPPIP
	db 7,HOPPIP
	; nite
	db 4,WOOPER
	db 5,RATTATA
	db 7,BELLSPROUT
	db 6,ZUBAT
	db 7,HOOTHOOT
	db 7,GASTLY
	db 7,GASTLY

	db $08,$06 ; Route 33
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 6,RATTATA
	db 6,SPEAROW
	db 6,GEODUDE
	db 6,HOPPIP
	db 7,EKANS
	db 7,HOPPIP
	db 7,HOPPIP
	; day
	db 6,RATTATA
	db 6,SPEAROW
	db 6,GEODUDE
	db 6,HOPPIP
	db 7,EKANS
	db 7,HOPPIP
	db 7,HOPPIP
	; nite
	db 6,RATTATA
	db 6,ZUBAT
	db 6,GEODUDE
	db 6,ZUBAT
	db 7,RATTATA
	db 7,RATTATA
	db 7,RATTATA

	db $0b,$01 ; Route 34
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 10,SNUBBULL
	db 11,RATTATA
	db 12,PIDGEY
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 10,DITTO
	; day
	db 10,SNUBBULL
	db 11,RATTATA
	db 12,PIDGEY
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 10,DITTO
	; nite
	db 12,DROWZEE
	db 11,RATTATA
	db 12,HOOTHOOT
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 10,DITTO

	db $0a,$02 ; Route 35
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 12,SNUBBULL
	db 14,PIDGEY
	db 13,GROWLITHE
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 12,YANMA
	; day
	db 12,SNUBBULL
	db 14,PIDGEY
	db 13,GROWLITHE
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 12,YANMA
	; nite
	db 12,DROWZEE
	db 14,HOOTHOOT
	db 13,PSYDUCK
	db 10,ABRA
	db 12,JIGGLYPUFF
	db 10,DITTO
	db 12,YANMA

	db $0a,$03 ; Route 36
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 4,LEDYBA
	db 4,PIDGEY
	db 5,BELLSPROUT
	db 5,GROWLITHE
	db 5,PIDGEY
	db 6,PIDGEY
	db 6,PIDGEY
	; day
	db 4,PIDGEY
	db 4,PIDGEY
	db 5,BELLSPROUT
	db 5,GROWLITHE
	db 5,PIDGEY
	db 6,PIDGEY
	db 6,PIDGEY
	; nite
	db 4,SPINARAK
	db 4,HOOTHOOT
	db 5,BELLSPROUT
	db 5,HOOTHOOT
	db 5,HOOTHOOT
	db 5,GASTLY
	db 5,GASTLY

	db $0a,$04 ; Route 37
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 13,LEDYBA
	db 14,GROWLITHE
	db 15,PIDGEY
	db 16,GROWLITHE
	db 15,PIDGEOTTO
	db 15,LEDIAN
	db 15,LEDIAN
	; day
	db 13,PIDGEY
	db 14,GROWLITHE
	db 15,PIDGEY
	db 16,GROWLITHE
	db 15,PIDGEOTTO
	db 15,PIDGEY
	db 15,PIDGEY
	; nite
	db 13,SPINARAK
	db 14,STANTLER
	db 15,HOOTHOOT
	db 16,STANTLER
	db 15,NOCTOWL
	db 15,ARIADOS
	db 15,ARIADOS

	db $01,$0c ; Route 38
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 16,RATTATA
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,PIDGEOTTO
	db 13,TAUROS
	db 13,MILTANK
	db 13,MILTANK
	; day
	db 16,RATTATA
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,PIDGEOTTO
	db 13,TAUROS
	db 13,MILTANK
	db 13,MILTANK
	; nite
	db 16,MEOWTH
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,NOCTOWL
	db 16,MEOWTH
	db 16,MEOWTH
	db 16,MEOWTH

	db $01,$0d ; Route 39
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 16,RATTATA
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,PIDGEOTTO
	db 15,MILTANK
	db 15,TAUROS
	db 15,TAUROS
	; day
	db 16,RATTATA
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,PIDGEOTTO
	db 15,MILTANK
	db 15,TAUROS
	db 15,TAUROS
	; nite
	db 16,MEOWTH
	db 16,RATICATE
	db 16,MAGNEMITE
	db 16,NOCTOWL
	db 18,MEOWTH
	db 18,MEOWTH
	db 18,MEOWTH

	db $02,$05 ; Route 42
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 13,EKANS
	db 14,SPEAROW
	db 15,RATTATA
	db 16,RATICATE
	db 15,ARBOK
	db 16,FEAROW
	db 16,FEAROW
	; day
	db 13,EKANS
	db 14,SPEAROW
	db 15,RATTATA
	db 16,RATICATE
	db 15,ARBOK
	db 16,FEAROW
	db 16,FEAROW
	; nite
	db 13,RATTATA
	db 14,ZUBAT
	db 15,RATICATE
	db 16,GOLBAT
	db 15,MARILL
	db 16,GOLBAT
	db 16,GOLBAT

	db $09,$05 ; Route 43
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 15,SENTRET
	db 16,PIDGEOTTO
	db 16,FARFETCH_D
	db 15,FURRET
	db 17,RATICATE
	db 17,FURRET
	db 17,FURRET
	; day
	db 15,SENTRET
	db 16,PIDGEOTTO
	db 16,FARFETCH_D
	db 15,FURRET
	db 17,RATICATE
	db 17,FURRET
	db 17,FURRET
	; nite
	db 15,VENONAT
	db 16,NOCTOWL
	db 16,RATICATE
	db 17,VENONAT
	db 17,RATICATE
	db 17,VENOMOTH
	db 17,VENOMOTH

	db $02,$06 ; Route 44
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,TANGELA
	db 22,LICKITUNG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,LICKITUNG
	db 26,LICKITUNG
	db 26,LICKITUNG
	; day
	db 23,TANGELA
	db 22,LICKITUNG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,LICKITUNG
	db 26,LICKITUNG
	db 26,LICKITUNG
	; nite
	db 23,TANGELA
	db 22,POLIWAG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,POLIWHIRL
	db 26,POLIWHIRL
	db 26,POLIWHIRL

	db $05,$08 ; Route 45
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,DONPHAN
	db 20,PHANPY
	db 27,SKARMORY
	db 27,SKARMORY
	; day
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,DONPHAN
	db 30,DONPHAN
	db 27,SKARMORY
	db 27,SKARMORY
	; nite
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,GRAVELER
	db 27,GRAVELER
	db 27,GRAVELER
	db 27,GRAVELER

	db $05,$09 ; Route 46
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 2,GEODUDE
	db 2,SPEAROW
	db 3,GEODUDE
	db 3,RATTATA
	db 2,PHANPY
	db 2,RATTATA
	db 2,RATTATA
	; day
	db 2,GEODUDE
	db 2,SPEAROW
	db 3,GEODUDE
	db 3,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	; nite
	db 2,GEODUDE
	db 2,RATTATA
	db 3,GEODUDE
	db 3,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	db 2,RATTATA

	db $13,$02 ; Silver Cave outside
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 41,TANGELA
	db 42,PONYTA
	db 42,ARBOK
	db 44,RAPIDASH
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; day
	db 41,TANGELA
	db 42,PONYTA
	db 42,ARBOK
	db 44,RAPIDASH
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; nite
	db 41,TANGELA
	db 42,POLIWHIRL
	db 42,GOLBAT
	db 44,POLIWHIRL
	db 40,GOLBAT
	db 44,GOLBAT
	db 44,GOLBAT

	db $FF

WildMons2: ; 0x2b11d
; Johto Pokémon in water

	db $03,$16 ; Ruins of Alph (outside)
	db $05 ; encounter rate
	db 15,WOOPER
	db 20,QUAGSIRE
	db 15,QUAGSIRE

	db $03,$25 ; Union Cave 1F
	db $05 ; encounter rate
	db 15,WOOPER
	db 20,QUAGSIRE
	db 15,QUAGSIRE

	db $03,$26 ; Union Cave B1F
	db $05 ; encounter rate
	db 15,WOOPER
	db 20,QUAGSIRE
	db 15,QUAGSIRE

	db $03,$27 ; Union Cave B2F
	db $0a ; encounter rate
	db 15,TENTACOOL
	db 20,QUAGSIRE
	db 20,TENTACRUEL

	db $03,$28 ; Slowpoke Well B1F
	db $05 ; encounter rate
	db 15,SLOWPOKE
	db 20,SLOWPOKE
	db 10,SLOWPOKE

	db $03,$29 ; Slowpoke Well B2F
	db $05 ; encounter rate
	db 15,SLOWPOKE
	db 20,SLOWPOKE
	db 20,SLOWBRO

	db $03,$34 ; Ilex Forest
	db $05 ; encounter rate
	db 15,PSYDUCK
	db 10,PSYDUCK
	db 15,GOLDUCK

	db $03,$39 ; Mount Mortar 1F
	db $0a ; encounter rate
	db 15,GOLDEEN
	db 20,MARILL
	db 20,SEAKING

	db $03,$3b ; Mount Mortar 2F (inside)
	db $05 ; encounter rate
	db 20,GOLDEEN
	db 25,MARILL
	db 25,SEAKING

	db $03,$3c ; Mount Mortar B1F
	db $05 ; encounter rate
	db 15,GOLDEEN
	db 20,MARILL
	db 20,SEAKING

	db $03,$44 ; Whirl Island SW
	db $0a ; encounter rate
	db 20,TENTACOOL
	db 15,HORSEA
	db 20,TENTACRUEL

	db $03,$48 ; Whirl Island B2F
	db $0a ; encounter rate
	db 15,HORSEA
	db 20,HORSEA
	db 20,TENTACRUEL

	db $03,$49 ; Whirl Island, Lugia's chamber
	db $0a ; encounter rate
	db 20,HORSEA
	db 20,TENTACRUEL
	db 20,SEADRA

	db $03,$4b ; Silver Cave 2
	db $05 ; encounter rate
	db 35,SEAKING
	db 35,GOLDUCK
	db 35,GOLDEEN

	db $03,$4e ; Dark Cave, Violet entrance
	db $05 ; encounter rate
	db 15,MAGIKARP
	db 10,MAGIKARP
	db 5,MAGIKARP

	db $03,$4f ; Dark Cave, Blackthorn entrance
	db $05 ; encounter rate
	db 15,MAGIKARP
	db 10,MAGIKARP
	db 5,MAGIKARP

	db $03,$51 ; Dragon1s Den B1F
	db $0a ; encounter rate
	db 15,MAGIKARP
	db 10,MAGIKARP
	db 10,DRATINI

	db $0f,$01 ; Olivine Port
	db $05 ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $1a,$01 ; Route 30
	db $05 ; encounter rate
	db 20,POLIWAG
	db 15,POLIWAG
	db 20,POLIWHIRL

	db $1a,$02 ; Route 31
	db $05 ; encounter rate
	db 20,POLIWAG
	db 15,POLIWAG
	db 20,POLIWHIRL

	db $0a,$01 ; Route 32
	db $0f ; encounter rate
	db 15,TENTACOOL
	db 20,QUAGSIRE
	db 20,TENTACRUEL

	db $0b,$01 ; Route 34
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $0a,$02 ; Route 35
	db $0a ; encounter rate
	db 20,PSYDUCK
	db 15,PSYDUCK
	db 20,GOLDUCK

	db $16,$01 ; Route 40
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $16,$02 ; Route 41
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 20,TENTACRUEL
	db 20,MANTINE

	db $02,$05 ; Route 42
	db $0a ; encounter rate
	db 20,GOLDEEN
	db 15,GOLDEEN
	db 20,SEAKING

	db $09,$05 ; Route 43
	db $05 ; encounter rate
	db 20,MAGIKARP
	db 15,MAGIKARP
	db 10,MAGIKARP

	db $02,$06 ; Route 44
	db $05 ; encounter rate
	db 25,POLIWAG
	db 20,POLIWAG
	db 25,POLIWHIRL

	db $05,$08 ; Route 45
	db $05 ; encounter rate
	db 20,MAGIKARP
	db 15,MAGIKARP
	db 5,MAGIKARP

	db $18,$04 ; New Bark Town
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $1a,$03 ; Cherrygrove City
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $0a,$05 ; Violet City
	db $05 ; encounter rate
	db 20,POLIWAG
	db 15,POLIWAG
	db 20,POLIWHIRL

	db $16,$03 ; Cianwood City
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $01,$0e ; Olivine City
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $04,$09 ; Ecruteak City
	db $05 ; encounter rate
	db 20,POLIWAG
	db 15,POLIWAG
	db 20,POLIWHIRL

	db $09,$06 ; Lake of Rage
	db $0f ; encounter rate
	db 15,MAGIKARP
	db 10,MAGIKARP
	db 15,GYARADOS

	db $05,$0a ; Blackthorn City
	db $0a ; encounter rate
	db 15,MAGIKARP
	db 10,MAGIKARP
	db 5,MAGIKARP

	db $13,$02 ; Silver Cave outside
	db $05 ; encounter rate
	db 35,POLIWHIRL
	db 40,POLIWHIRL
	db 35,POLIWAG

	db $FF

WildMons3: ; 0x2b274
; Kanto Pokémon in grass

	db $03,$54 ; Diglett's Cave
	db $0a,$05,$14 ; encounter rates: morn/day/nite
	; morn
	db 3,DIGLETT
	db 6,DIGLETT
	db 12,DIGLETT
	db 24,DIGLETT
	db 24,DUGTRIO
	db 24,DUGTRIO
	db 24,DUGTRIO
	; day
	db 2,DIGLETT
	db 4,DIGLETT
	db 8,DIGLETT
	db 16,DIGLETT
	db 16,DUGTRIO
	db 16,DUGTRIO
	db 16,DUGTRIO
	; nite
	db 4,DIGLETT
	db 8,DIGLETT
	db 16,DIGLETT
	db 32,DIGLETT
	db 32,DUGTRIO
	db 32,DUGTRIO
	db 32,DUGTRIO

	db $03,$55 ; Mount Moon
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 6,ZUBAT
	db 8,GEODUDE
	db 8,SANDSHREW
	db 12,PARAS
	db 10,GEODUDE
	db 8,CLEFAIRY
	db 8,CLEFAIRY
	; day
	db 6,ZUBAT
	db 8,GEODUDE
	db 8,SANDSHREW
	db 12,PARAS
	db 10,GEODUDE
	db 8,CLEFAIRY
	db 8,CLEFAIRY
	; nite
	db 6,ZUBAT
	db 8,GEODUDE
	db 8,CLEFAIRY
	db 12,PARAS
	db 10,GEODUDE
	db 12,CLEFAIRY
	db 12,CLEFAIRY

	db $03,$57 ; Rock Tunnel 1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 10,CUBONE
	db 11,GEODUDE
	db 12,MACHOP
	db 12,ZUBAT
	db 15,MACHOKE
	db 12,MAROWAK
	db 12,MAROWAK
	; day
	db 10,CUBONE
	db 11,GEODUDE
	db 12,MACHOP
	db 12,ZUBAT
	db 15,MACHOKE
	db 12,MAROWAK
	db 12,MAROWAK
	; nite
	db 12,ZUBAT
	db 11,GEODUDE
	db 12,GEODUDE
	db 17,HAUNTER
	db 15,ZUBAT
	db 15,ZUBAT
	db 15,ZUBAT

	db $03,$58 ; Rock Tunnel B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 12,CUBONE
	db 14,GEODUDE
	db 16,ONIX
	db 12,ZUBAT
	db 15,MAROWAK
	db 15,KANGASKHAN
	db 15,KANGASKHAN
	; day
	db 12,CUBONE
	db 14,GEODUDE
	db 16,ONIX
	db 12,ZUBAT
	db 15,MAROWAK
	db 15,KANGASKHAN
	db 15,KANGASKHAN
	; nite
	db 12,ZUBAT
	db 14,GEODUDE
	db 16,ONIX
	db 15,ZUBAT
	db 15,HAUNTER
	db 15,GOLBAT
	db 15,GOLBAT

	db $03,$5b ; Victory Road
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 34,GRAVELER
	db 32,RHYHORN
	db 33,ONIX
	db 34,GOLBAT
	db 35,SANDSLASH
	db 35,RHYDON
	db 35,RHYDON
	; day
	db 34,GRAVELER
	db 32,RHYHORN
	db 33,ONIX
	db 34,GOLBAT
	db 35,SANDSLASH
	db 35,RHYDON
	db 35,RHYDON
	; nite
	db 34,GOLBAT
	db 34,GRAVELER
	db 32,ONIX
	db 36,GRAVELER
	db 38,GRAVELER
	db 40,GRAVELER
	db 40,GRAVELER

	db $03,$53 ; Tohjo Falls
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,ZUBAT
	db 22,RATICATE
	db 24,GOLBAT
	db 21,SLOWPOKE
	db 20,RATTATA
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; day
	db 22,ZUBAT
	db 22,RATICATE
	db 24,GOLBAT
	db 21,SLOWPOKE
	db 20,RATTATA
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; nite
	db 22,ZUBAT
	db 22,RATICATE
	db 24,GOLBAT
	db 21,SLOWPOKE
	db 20,RATTATA
	db 23,SLOWPOKE
	db 23,SLOWPOKE

	db $0d,$01 ; Route 1
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 2,PIDGEY
	db 2,RATTATA
	db 3,SENTRET
	db 3,PIDGEY
	db 6,FURRET
	db 4,PIDGEY
	db 4,PIDGEY
	; day
	db 2,PIDGEY
	db 2,RATTATA
	db 3,SENTRET
	db 3,PIDGEY
	db 6,FURRET
	db 4,PIDGEY
	db 4,PIDGEY
	; nite
	db 2,HOOTHOOT
	db 2,RATTATA
	db 3,RATTATA
	db 3,HOOTHOOT
	db 6,RATICATE
	db 4,HOOTHOOT
	db 4,HOOTHOOT

	db $17,$01 ; Route 2
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 3,CATERPIE
	db 3,LEDYBA
	db 5,PIDGEY
	db 7,BUTTERFREE
	db 7,LEDIAN
	db 4,PIKACHU
	db 4,PIKACHU
	; day
	db 3,CATERPIE
	db 3,PIDGEY
	db 5,PIDGEY
	db 7,BUTTERFREE
	db 7,PIDGEOTTO
	db 4,PIKACHU
	db 4,PIKACHU
	; nite
	db 3,HOOTHOOT
	db 3,SPINARAK
	db 5,HOOTHOOT
	db 7,NOCTOWL
	db 7,ARIADOS
	db 4,NOCTOWL
	db 4,NOCTOWL

	db $0e,$01 ; Route 3
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 5,SPEAROW
	db 5,RATTATA
	db 8,EKANS
	db 10,RATICATE
	db 10,ARBOK
	db 10,SANDSHREW
	db 10,SANDSHREW
	; day
	db 5,SPEAROW
	db 5,RATTATA
	db 8,EKANS
	db 10,RATICATE
	db 10,ARBOK
	db 10,SANDSHREW
	db 10,SANDSHREW
	; nite
	db 5,RATTATA
	db 10,RATTATA
	db 10,RATICATE
	db 6,ZUBAT
	db 5,RATTATA
	db 6,CLEFAIRY
	db 6,CLEFAIRY

	db $07,$0c ; Route 4
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 5,SPEAROW
	db 5,RATTATA
	db 8,EKANS
	db 10,RATICATE
	db 10,ARBOK
	db 10,SANDSHREW
	db 10,SANDSHREW
	; day
	db 5,SPEAROW
	db 5,RATTATA
	db 8,EKANS
	db 10,RATICATE
	db 10,ARBOK
	db 10,SANDSHREW
	db 10,SANDSHREW
	; nite
	db 5,RATTATA
	db 10,RATTATA
	db 10,RATICATE
	db 6,ZUBAT
	db 5,RATTATA
	db 6,CLEFAIRY
	db 6,CLEFAIRY

	db $19,$01 ; Route 5
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 13,PIDGEY
	db 13,SNUBBULL
	db 15,PIDGEOTTO
	db 12,ABRA
	db 14,JIGGLYPUFF
	db 14,ABRA
	db 14,ABRA
	; day
	db 13,PIDGEY
	db 13,SNUBBULL
	db 15,PIDGEOTTO
	db 12,ABRA
	db 14,JIGGLYPUFF
	db 14,ABRA
	db 14,ABRA
	; nite
	db 13,HOOTHOOT
	db 13,MEOWTH
	db 15,NOCTOWL
	db 12,ABRA
	db 14,JIGGLYPUFF
	db 14,ABRA
	db 14,ABRA

	db $0c,$01 ; Route 6
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 13,RATTATA
	db 13,SNUBBULL
	db 14,MAGNEMITE
	db 15,RATICATE
	db 12,JIGGLYPUFF
	db 15,GRANBULL
	db 15,GRANBULL
	; day
	db 13,RATTATA
	db 13,SNUBBULL
	db 14,MAGNEMITE
	db 15,RATICATE
	db 12,JIGGLYPUFF
	db 15,GRANBULL
	db 15,GRANBULL
	; nite
	db 13,MEOWTH
	db 13,DROWZEE
	db 14,MAGNEMITE
	db 15,PSYDUCK
	db 12,JIGGLYPUFF
	db 15,RATICATE
	db 15,RATICATE

	db $15,$01 ; Route 7
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 17,RATTATA
	db 17,SPEAROW
	db 18,SNUBBULL
	db 18,RATICATE
	db 18,JIGGLYPUFF
	db 16,ABRA
	db 16,ABRA
	; day
	db 17,RATTATA
	db 17,SPEAROW
	db 18,SNUBBULL
	db 18,RATICATE
	db 18,JIGGLYPUFF
	db 16,ABRA
	db 16,ABRA
	; nite
	db 17,MEOWTH
	db 17,MURKROW
	db 18,HOUNDOUR
	db 18,PERSIAN
	db 18,JIGGLYPUFF
	db 16,ABRA
	db 16,ABRA

	db $12,$01 ; Route 8
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 17,SNUBBULL
	db 19,PIDGEOTTO
	db 16,ABRA
	db 17,GROWLITHE
	db 16,JIGGLYPUFF
	db 18,KADABRA
	db 18,KADABRA
	; day
	db 17,SNUBBULL
	db 19,PIDGEOTTO
	db 16,ABRA
	db 17,GROWLITHE
	db 16,JIGGLYPUFF
	db 18,KADABRA
	db 18,KADABRA
	; nite
	db 17,MEOWTH
	db 20,NOCTOWL
	db 16,ABRA
	db 17,HAUNTER
	db 16,JIGGLYPUFF
	db 18,KADABRA
	db 18,KADABRA

	db $07,$0d ; Route 9
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 15,RATTATA
	db 15,SPEAROW
	db 15,RATICATE
	db 15,FEAROW
	db 15,FEAROW
	db 18,MAROWAK
	db 18,MAROWAK
	; day
	db 15,RATTATA
	db 15,SPEAROW
	db 15,RATICATE
	db 15,FEAROW
	db 15,FEAROW
	db 18,MAROWAK
	db 18,MAROWAK
	; nite
	db 15,RATTATA
	db 15,VENONAT
	db 15,RATICATE
	db 15,VENOMOTH
	db 15,ZUBAT
	db 18,RATICATE
	db 18,RATICATE

	db $07,$0e ; Route 10
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 15,SPEAROW
	db 17,VOLTORB
	db 15,RATICATE
	db 15,FEAROW
	db 15,MAROWAK
	db 16,ELECTABUZZ
	db 16,ELECTABUZZ
	; day
	db 15,SPEAROW
	db 17,VOLTORB
	db 15,RATICATE
	db 15,FEAROW
	db 15,MAROWAK
	db 18,ELECTABUZZ
	db 18,ELECTABUZZ
	; nite
	db 15,VENONAT
	db 17,VOLTORB
	db 15,RATICATE
	db 15,VENOMOTH
	db 15,ZUBAT
	db 16,ELECTABUZZ
	db 16,ELECTABUZZ

	db $0c,$02 ; Route 11
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 14,HOPPIP
	db 13,RATICATE
	db 15,MAGNEMITE
	db 16,PIDGEOTTO
	db 16,RATTATA
	db 16,HOPPIP
	db 16,HOPPIP
	; day
	db 14,HOPPIP
	db 13,RATICATE
	db 15,MAGNEMITE
	db 16,PIDGEOTTO
	db 16,RATTATA
	db 16,HOPPIP
	db 16,HOPPIP
	; nite
	db 14,DROWZEE
	db 13,MEOWTH
	db 15,MAGNEMITE
	db 16,NOCTOWL
	db 16,RATICATE
	db 16,HYPNO
	db 16,HYPNO

	db $11,$01 ; Route 13
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,NIDORINO
	db 23,NIDORINA
	db 25,PIDGEOTTO
	db 25,HOPPIP
	db 27,HOPPIP
	db 27,HOPPIP
	db 25,CHANSEY
	; day
	db 23,NIDORINO
	db 23,NIDORINA
	db 25,PIDGEOTTO
	db 25,HOPPIP
	db 27,HOPPIP
	db 27,HOPPIP
	db 25,CHANSEY
	; nite
	db 23,VENONAT
	db 23,QUAGSIRE
	db 25,NOCTOWL
	db 25,VENOMOTH
	db 25,QUAGSIRE
	db 25,QUAGSIRE
	db 25,CHANSEY

	db $11,$02 ; Route 14
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 26,NIDORINO
	db 26,NIDORINA
	db 28,PIDGEOTTO
	db 28,HOPPIP
	db 30,SKIPLOOM
	db 30,SKIPLOOM
	db 28,CHANSEY
	; day
	db 26,NIDORINO
	db 26,NIDORINA
	db 28,PIDGEOTTO
	db 28,HOPPIP
	db 30,SKIPLOOM
	db 30,SKIPLOOM
	db 28,CHANSEY
	; nite
	db 26,VENONAT
	db 26,QUAGSIRE
	db 28,NOCTOWL
	db 28,VENOMOTH
	db 28,QUAGSIRE
	db 28,QUAGSIRE
	db 28,CHANSEY

	db $11,$03 ; Route 15
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,NIDORINO
	db 23,NIDORINA
	db 25,PIDGEOTTO
	db 25,HOPPIP
	db 27,HOPPIP
	db 27,HOPPIP
	db 25,CHANSEY
	; day
	db 23,NIDORINO
	db 23,NIDORINA
	db 25,PIDGEOTTO
	db 25,HOPPIP
	db 27,HOPPIP
	db 27,HOPPIP
	db 25,CHANSEY
	; nite
	db 23,VENONAT
	db 23,QUAGSIRE
	db 25,NOCTOWL
	db 25,VENOMOTH
	db 25,QUAGSIRE
	db 25,QUAGSIRE
	db 25,CHANSEY

	db $15,$02 ; Route 16
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 26,GRIMER
	db 27,FEAROW
	db 28,GRIMER
	db 29,FEAROW
	db 29,FEAROW
	db 30,MUK
	db 30,MUK
	; day
	db 26,GRIMER
	db 27,FEAROW
	db 28,GRIMER
	db 29,FEAROW
	db 29,SLUGMA
	db 30,MUK
	db 30,MUK
	; nite
	db 26,GRIMER
	db 27,GRIMER
	db 28,GRIMER
	db 29,MURKROW
	db 29,MURKROW
	db 30,MUK
	db 30,MUK

	db $15,$03 ; Route 17
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 30,FEAROW
	db 29,GRIMER
	db 31,GRIMER
	db 32,FEAROW
	db 33,GRIMER
	db 33,MUK
	db 33,MUK
	; day
	db 30,FEAROW
	db 29,SLUGMA
	db 29,GRIMER
	db 32,FEAROW
	db 32,SLUGMA
	db 33,MUK
	db 33,MUK
	; nite
	db 30,GRIMER
	db 29,GRIMER
	db 31,GRIMER
	db 32,GRIMER
	db 33,GRIMER
	db 33,MUK
	db 33,MUK

	db $11,$04 ; Route 18
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 26,GRIMER
	db 27,FEAROW
	db 28,GRIMER
	db 29,FEAROW
	db 29,FEAROW
	db 30,MUK
	db 30,MUK
	; day
	db 26,GRIMER
	db 27,FEAROW
	db 28,GRIMER
	db 29,FEAROW
	db 29,SLUGMA
	db 30,MUK
	db 30,MUK
	; nite
	db 26,GRIMER
	db 27,GRIMER
	db 28,GRIMER
	db 29,GRIMER
	db 29,GRIMER
	db 30,MUK
	db 30,MUK

	db $06,$07 ; Route 21
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 30,TANGELA
	db 25,RATTATA
	db 35,TANGELA
	db 20,RATICATE
	db 30,MR__MIME
	db 28,MR__MIME
	db 28,MR__MIME
	; day
	db 30,TANGELA
	db 25,RATTATA
	db 35,TANGELA
	db 20,RATICATE
	db 28,MR__MIME
	db 30,MR__MIME
	db 30,MR__MIME
	; nite
	db 30,TANGELA
	db 25,RATTATA
	db 35,TANGELA
	db 20,RATICATE
	db 30,TANGELA
	db 28,TANGELA
	db 28,TANGELA

	db $17,$02 ; Route 22
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 3,RATTATA
	db 3,SPEAROW
	db 5,SPEAROW
	db 4,DODUO
	db 6,PONYTA
	db 7,FEAROW
	db 7,FEAROW
	; day
	db 3,RATTATA
	db 3,SPEAROW
	db 5,SPEAROW
	db 4,DODUO
	db 6,PONYTA
	db 7,FEAROW
	db 7,FEAROW
	; nite
	db 3,RATTATA
	db 3,POLIWAG
	db 5,RATTATA
	db 4,POLIWAG
	db 6,RATTATA
	db 7,RATTATA
	db 7,RATTATA

	db $07,$0f ; Route 24
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 8,CATERPIE
	db 10,CATERPIE
	db 12,METAPOD
	db 12,ABRA
	db 10,BELLSPROUT
	db 14,BUTTERFREE
	db 14,BUTTERFREE
	; day
	db 8,CATERPIE
	db 12,SUNKERN
	db 10,CATERPIE
	db 12,ABRA
	db 10,BELLSPROUT
	db 14,BUTTERFREE
	db 14,BUTTERFREE
	; nite
	db 10,VENONAT
	db 10,ODDISH
	db 12,ODDISH
	db 12,ABRA
	db 10,BELLSPROUT
	db 14,GLOOM
	db 14,GLOOM

	db $07,$10 ; Route 25
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 10,CATERPIE
	db 10,PIDGEY
	db 12,PIDGEOTTO
	db 12,METAPOD
	db 10,BELLSPROUT
	db 14,BUTTERFREE
	db 14,BUTTERFREE
	; day
	db 10,CATERPIE
	db 10,PIDGEY
	db 12,PIDGEOTTO
	db 12,METAPOD
	db 10,BELLSPROUT
	db 14,BUTTERFREE
	db 14,BUTTERFREE
	; nite
	db 10,ODDISH
	db 10,HOOTHOOT
	db 10,VENONAT
	db 12,NOCTOWL
	db 10,BELLSPROUT
	db 14,NOCTOWL
	db 14,NOCTOWL

	db $18,$01 ; Route 26
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 28,DODUO
	db 28,SANDSLASH
	db 32,PONYTA
	db 30,RATICATE
	db 30,DODUO
	db 30,ARBOK
	db 30,ARBOK
	; day
	db 28,DODUO
	db 28,SANDSLASH
	db 32,PONYTA
	db 30,RATICATE
	db 30,DODUO
	db 30,ARBOK
	db 30,ARBOK
	; nite
	db 28,NOCTOWL
	db 28,RATICATE
	db 32,NOCTOWL
	db 30,RATICATE
	db 30,QUAGSIRE
	db 30,QUAGSIRE
	db 30,QUAGSIRE

	db $18,$02 ; Route 27
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 28,DODUO
	db 28,ARBOK
	db 30,RATICATE
	db 30,DODUO
	db 32,PONYTA
	db 30,DODRIO
	db 30,DODRIO
	; day
	db 28,DODUO
	db 28,ARBOK
	db 30,RATICATE
	db 30,DODUO
	db 32,PONYTA
	db 30,DODRIO
	db 30,DODRIO
	; nite
	db 28,QUAGSIRE
	db 28,NOCTOWL
	db 30,RATICATE
	db 30,QUAGSIRE
	db 32,NOCTOWL
	db 32,NOCTOWL
	db 32,NOCTOWL

	db $13,$01 ; Route 28
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 39,TANGELA
	db 40,PONYTA
	db 40,RAPIDASH
	db 42,ARBOK
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; day
	db 39,TANGELA
	db 40,PONYTA
	db 40,RAPIDASH
	db 42,ARBOK
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; nite
	db 39,TANGELA
	db 40,POLIWHIRL
	db 40,GOLBAT
	db 40,POLIWHIRL
	db 42,GOLBAT
	db 42,GOLBAT
	db 42,GOLBAT

	db $FF

WildMons4: ; 0x2b7f7
; Kanto Pokémon in water

	db $03,$53 ; Tohjo Falls
	db $0a ; encounter rate
	db 20,GOLDEEN
	db 20,SLOWPOKE
	db 20,SEAKING

	db $0f,$02 ; Vermilion Port
	db $05 ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $07,$0c ; Route 4
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db $0c,$01 ; Route 6
	db $05 ; encounter rate
	db 10,PSYDUCK
	db 5,PSYDUCK
	db 10,GOLDUCK

	db $07,$0d ; Route 9
	db $0a ; encounter rate
	db 15,GOLDEEN
	db 10,GOLDEEN
	db 15,SEAKING

	db $07,$0e ; Route 10
	db $0a ; encounter rate
	db 15,GOLDEEN
	db 10,GOLDEEN
	db 15,SEAKING

	db $12,$02 ; Route 12
	db $0f ; encounter rate
	db 25,TENTACOOL
	db 25,QUAGSIRE
	db 25,TENTACRUEL

	db $11,$01 ; Route 13
	db $0f ; encounter rate
	db 25,TENTACOOL
	db 25,QUAGSIRE
	db 25,TENTACRUEL

	db $06,$05 ; Route 19
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $06,$06 ; Route 20
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $06,$07 ; Route 21
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $17,$02 ; Route 22
	db $05 ; encounter rate
	db 10,POLIWAG
	db 5,POLIWAG
	db 10,POLIWHIRL

	db $07,$0f ; Route 24
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db $07,$10 ; Route 25
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db $18,$01 ; Route 26
	db $0f ; encounter rate
	db 30,TENTACOOL
	db 25,TENTACOOL
	db 30,TENTACRUEL

	db $18,$02 ; Route 27
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db $13,$01 ; Route 28
	db $05 ; encounter rate
	db 40,POLIWAG
	db 35,POLIWAG
	db 40,POLIWHIRL

	db $0d,$02 ; Pallet Town
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $17,$03 ; Viridian City
	db $05 ; encounter rate
	db 10,POLIWAG
	db 5,POLIWAG
	db 10,POLIWHIRL

	db $07,$11 ; Cerulean City
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db $0c,$03 ; Vermilion City
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $15,$04 ; Celadon City
	db $05 ; encounter rate
	db 20,GRIMER
	db 15,GRIMER
	db 15,MUK

	db $11,$05 ; Fuchsia City
	db $05 ; encounter rate
	db 20,MAGIKARP
	db 15,MAGIKARP
	db 10,MAGIKARP

	db $06,$08 ; Cinnabar Island
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $FF

WildMons5: ; 0x2b8d0
; swarms in grass

; Dunsparce swarm
	db $03,$4e ; Dark Cave, Violet Entrance
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE
	; day
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE
	; nite
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE

; Yanma swarm
	db $0a,$02 ; Route 35
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,PIDGEY
	db 10,DITTO
	db 10,DITTO
	; day
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,PIDGEY
	db 10,DITTO
	db 10,DITTO
	; nite
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,HOOTHOOT
	db 10,DITTO
	db 10,DITTO

	db $FF

WildMons6: ; 0x2b92f
; swarms in water

	; no swarms encountered while surfing in Crystal
	db $FF

INCBIN "baserom.gbc",$2b930,$2c000 - $2b930

SECTION "bankB",DATA,BANK[$B]

INCBIN "baserom.gbc",$2C000,$30000 - $2C000

SECTION "bankC",DATA,BANK[$C]

INCBIN "baserom.gbc",$30000,$34000 - $30000

SECTION "bankD",DATA,BANK[$D]

INCBIN "baserom.gbc",$34000,$38000 - $34000

SECTION "bankE",DATA,BANK[$E]

INCBIN "baserom.gbc",$38000,$39999 - $38000

TrainerGroupPointerTable: ; 0x39999
	dw FalknerTrainerGroupHeader
	dw WhitneyTrainerGroupHeader
	dw BugsyTrainerGroupHeader
	dw MortyTrainerGroupHeader
	dw PryceTrainerGroupHeader
	dw JasmineTrainerGroupHeader
	dw ChuckTrainerGroupHeader
	dw ClairTrainerGroupHeader
	dw Rival1TrainerGroupHeader
	dw EliteFourWillTrainerGroupHeader
	dw EliteFourWillTrainerGroupHeader
	dw SpecialPKMN1TrainerGroupHeader
	dw EliteFourBrunoTrainerGroupHeader
	dw EliteFourKarenTrainerGroupHeader
	dw EliteFourKogaTrainerGroupHeader
	dw ChampionTrainerGroupHeader
	dw BrockTrainerGroupHeader
	dw MistyTrainerGroupHeader
	dw LtSurgeTrainerGroupHeader
	dw ScientistTrainerGroupHeader
	dw ErikaTrainerGroupHeader
	dw YoungsterTrainerGroupHeader
	dw SchoolboyTrainerGroupHeader
	dw BirdKeeperTrainerGroupHeader
	dw LassTrainerGroupHeader
	dw JanineTrainerGroupHeader
	dw CooltrainerMTrainerGroupHeader
	dw CooltrainerFTrainerGroupHeader
	dw BeautyTrainerGroupHeader
	dw PokemaniacTrainerGroupHeader
	dw GruntMTrainerGroupHeader
	dw GentlemanTrainerGroupHeader
	dw SkierTrainerGroupHeader
	dw TeacherTrainerGroupHeader
	dw SabrinaTrainerGroupHeader
	dw BugCatcherTrainerGroupHeader
	dw FisherTrainerGroupHeader
	dw SwimmerMTrainerGroupHeader
	dw SwimmerFTrainerGroupHeader
	dw SailorTrainerGroupHeader
	dw SuperNerdTrainerGroupHeader
	dw Rival2TrainerGroupHeader
	dw GuitaristTrainerGroupHeader
	dw HikerTrainerGroupHeader
	dw BikerTrainerGroupHeader
	dw BlaineTrainerGroupHeader
	dw BurglarTrainerGroupHeader
	dw FirebreatherTrainerGroupHeader
	dw JugglerTrainerGroupHeader
	dw BlackbeltTrainerGroupHeader
	dw ExecutiveMTrainerGroupHeader
	dw PsychicTrainerGroupHeader
	dw PicnickerTrainerGroupHeader
	dw CamperTrainerGroupHeader
	dw ExecutiveFTrainerGroupHeader
	dw SageTrainerGroupHeader
	dw MediumTrainerGroupHeader
	dw BoarderTrainerGroupHeader
	dw PokefanMTrainerGroupHeader
	dw KimonoGirlTrainerGroupHeader
	dw TwinsTrainerGroupHeader
	dw PokefanFTrainerGroupHeader
	dw RedTrainerGroupHeader
	dw BlueTrainerGroupHeader
	dw OfficerTrainerGroupHeader
	dw GruntFTrainerGroupHeader
	dw MysticalmanTrainerGroupHeader
; 0x39a1f

FalknerTrainerGroupHeader: ; 0x39a1f
	; FALKNER (1) at 0x39a1f
	db "FALKNER@"
	db $01 ; data type
	db 7, PIDGEY, TACKLE, MUD_SLAP, 0, 0
	db 9, PIDGEOTTO, TACKLE, MUD_SLAP, GUST, 0
	db $ff ; end trainer party mons
	; last_address=0x39a35 size=22
; 0x39a35

WhitneyTrainerGroupHeader: ; 0x39a35
	; WHITNEY (1) at 0x39a35
	db "WHITNEY@"
	db $01 ; data type
	db 18, CLEFAIRY, DOUBLESLAP, MIMIC, ENCORE, METRONOME
	db 20, MILTANK, ROLLOUT, ATTRACT, STOMP, MILK_DRINK
	db $ff ; end trainer party mons
	; last_address=0x39a4b size=22
; 0x39a4b

BugsyTrainerGroupHeader: ; 0x39a4b
	; BUGSY (1) at 0x39a4b
	db "BUGSY@"
	db $01 ; data type
	db 14, METAPOD, TACKLE, STRING_SHOT, HARDEN, 0
	db 14, KAKUNA, POISON_STING, STRING_SHOT, HARDEN, 0
	db 16, SCYTHER, QUICK_ATTACK, LEER, FURY_CUTTER, 0
	db $ff ; end trainer party mons
	; last_address=0x39a65 size=26
; 0x39a65

MortyTrainerGroupHeader: ; 0x39a65
	; MORTY (1) at 0x39a65
	db "MORTY@"
	db $01 ; data type
	db 21, GASTLY, LICK, SPITE, MEAN_LOOK, CURSE
	db 21, HAUNTER, HYPNOSIS, MIMIC, CURSE, NIGHT_SHADE
	db 25, GENGAR, HYPNOSIS, SHADOW_BALL, MEAN_LOOK, DREAM_EATER
	db 23, HAUNTER, SPITE, MEAN_LOOK, MIMIC, NIGHT_SHADE
	db $ff ; end trainer party mons
	; last_address=0x39a85 size=32
; 0x39a85

PryceTrainerGroupHeader: ; 0x39a85
	; PRYCE (1) at 0x39a85
	db "PRYCE@"
	db $01 ; data type
	db 27, SEEL, HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	db 29, DEWGONG, HEADBUTT, ICY_WIND, AURORA_BEAM, REST
	db 31, PILOSWINE, ICY_WIND, FURY_ATTACK, MIST, BLIZZARD
	db $ff ; end trainer party mons
	; last_address=0x39a9f size=26
; 0x39a9f

JasmineTrainerGroupHeader: ; 0x39a9f
	; JASMINE (1) at 0x39a9f
	db "JASMINE@"
	db $01 ; data type
	db 30, MAGNEMITE, THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	db 30, MAGNEMITE, THUNDERBOLT, SUPERSONIC, SONICBOOM, THUNDER_WAVE
	db 35, STEELIX, SCREECH, SUNNY_DAY, ROCK_THROW, IRON_TAIL
	db $ff ; end trainer party mons
	; last_address=0x39abb size=28
; 0x39abb

ChuckTrainerGroupHeader: ; 0x39abb
	; CHUCK (1) at 0x39abb
	db "CHUCK@"
	db $01 ; data type
	db 27, PRIMEAPE, LEER, RAGE, KARATE_CHOP, FURY_SWIPES
	db 30, POLIWRATH, HYPNOSIS, MIND_READER, SURF, DYNAMICPUNCH
	db $ff ; end trainer party mons
	; last_address=0x39acf size=20
; 0x39acf

ClairTrainerGroupHeader: ; 0x39acf
	; CLAIR (1) at 0x39acf
	db "CLAIR@"
	db $01 ; data type
	db 37, DRAGONAIR, THUNDER_WAVE, SURF, SLAM, DRAGONBREATH
	db 37, DRAGONAIR, THUNDER_WAVE, THUNDERBOLT, SLAM, DRAGONBREATH
	db 37, DRAGONAIR, THUNDER_WAVE, ICE_BEAM, SLAM, DRAGONBREATH
	db 40, KINGDRA, SMOKESCREEN, SURF, HYPER_BEAM, DRAGONBREATH
	db $ff ; end trainer party mons
	; last_address=0x39aef size=32
; 0x39aef

Rival1TrainerGroupHeader: ; 0x39aef
	; RIVAL1_1 (1) at 0x39aef
	db "?@"
	db $00 ; data type
	db 5, CHIKORITA
	db $ff ; end trainer party mons
	; last_address=0x39af5 size=6

	; RIVAL1_2 (2) at 0x39af5
	db "?@"
	db $00 ; data type
	db 5, CYNDAQUIL
	db $ff ; end trainer party mons
	; last_address=0x39afb size=6

	; RIVAL1_3 (3) at 0x39afb
	db "?@"
	db $00 ; data type
	db 5, TOTODILE
	db $ff ; end trainer party mons
	; last_address=0x39b01 size=6

	; RIVAL1_4 (4) at 0x39b01
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, BAYLEEF
	db $ff ; end trainer party mons
	; last_address=0x39b0b size=10

	; RIVAL1_5 (5) at 0x39b0b
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, QUILAVA
	db $ff ; end trainer party mons
	; last_address=0x39b15 size=10

	; RIVAL1_6 (6) at 0x39b15
	db "?@"
	db $00 ; data type
	db 12, GASTLY
	db 14, ZUBAT
	db 16, CROCONAW
	db $ff ; end trainer party mons
	; last_address=0x39b1f size=10

	; RIVAL1_7 (7) at 0x39b1f
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, BAYLEEF, GROWL, REFLECT, RAZOR_LEAF, POISONPOWDER
	db $ff ; end trainer party mons
	; last_address=0x39b3b size=28

	; RIVAL1_8 (8) at 0x39b3b
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, QUILAVA, LEER, SMOKESCREEN, EMBER, QUICK_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x39b57 size=28

	; RIVAL1_9 (9) at 0x39b57
	db "?@"
	db $01 ; data type
	db 20, HAUNTER, LICK, SPITE, MEAN_LOOK, CURSE
	db 18, MAGNEMITE, TACKLE, THUNDERSHOCK, SUPERSONIC, SONICBOOM
	db 20, ZUBAT, LEECH_LIFE, SUPERSONIC, BITE, CONFUSE_RAY
	db 22, CROCONAW, LEER, RAGE, WATER_GUN, BITE
	db $ff ; end trainer party mons
	; last_address=0x39b73 size=28

	; RIVAL1_10 (10) at 0x39b73
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, MEGANIUM, REFLECT, RAZOR_LEAF, POISONPOWDER, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x39b95 size=34

	; RIVAL1_11 (11) at 0x39b95
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, QUILAVA, SMOKESCREEN, EMBER, QUICK_ATTACK, FLAME_WHEEL
	db $ff ; end trainer party mons
	; last_address=0x39bb7 size=34

	; RIVAL1_12 (12) at 0x39bb7
	db "?@"
	db $01 ; data type
	db 30, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 28, MAGNEMITE, TACKLE, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE
	db 30, HAUNTER, LICK, MEAN_LOOK, CURSE, SHADOW_BALL
	db 32, SNEASEL, LEER, QUICK_ATTACK, SCREECH, FAINT_ATTACK
	db 32, FERALIGATR, RAGE, WATER_GUN, BITE, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x39bd9 size=34

	; RIVAL1_13 (13) at 0x39bd9
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 35, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, MEGANIUM, REFLECT, RAZOR_LEAF, POISONPOWDER, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x39c01 size=40

	; RIVAL1_14 (14) at 0x39c01
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 35, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, TYPHLOSION, SMOKESCREEN, EMBER, QUICK_ATTACK, FLAME_WHEEL
	db $ff ; end trainer party mons
	; last_address=0x39c29 size=40

	; RIVAL1_15 (15) at 0x39c29
	db "?@"
	db $01 ; data type
	db 34, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 34, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 35, HAUNTER, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 35, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db 38, FERALIGATR, RAGE, WATER_GUN, SCARY_FACE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x39c51 size=40
; 0x39c51

PokemonProfTrainerGroupHeader: ; 0x39c51
	
; 0x39c51

EliteFourWillTrainerGroupHeader: ; 0x39c51
	; WILL (1) at 0x39c51
	db "WILL@"
	db $01 ; data type
	db 40, XATU, QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db 41, JYNX, DOUBLESLAP, LOVELY_KISS, ICE_PUNCH, PSYCHIC_M
	db 41, EXEGGUTOR, REFLECT, LEECH_SEED, EGG_BOMB, PSYCHIC_M
	db 41, SLOWBRO, CURSE, AMNESIA, BODY_SLAM, PSYCHIC_M
	db 42, XATU, QUICK_ATTACK, FUTURE_SIGHT, CONFUSE_RAY, PSYCHIC_M
	db $ff ; end trainer party mons
	; last_address=0x39c76 size=37
; 0x39c76

SpecialPKMN1TrainerGroupHeader: ; 0x39c76
	; CAL1 (2) at 0x39c76
	db "CAL@"
	db $00 ; data type
	db 10, CHIKORITA
	db 10, CYNDAQUIL
	db 10, TOTODILE
	db $ff ; end trainer party mons
	; last_address=0x39c82 size=12

	; CAL2 (3) at 0x39c82
	db "CAL@"
	db $00 ; data type
	db 30, BAYLEEF
	db 30, QUILAVA
	db 30, CROCONAW
	db $ff ; end trainer party mons
	; last_address=0x39c8e size=12

	; CAL3 (4) at 0x39c8e
	db "CAL@"
	db $00 ; data type
	db 50, MEGANIUM
	db 50, TYPHLOSION
	db 50, FERALIGATR
	db $ff ; end trainer party mons
	; last_address=0x39c9a size=12
; 0x39c9a

EliteFourBrunoTrainerGroupHeader: ; 0x39c9a
	; BRUNO (1) at 0x39c9a
	db "BRUNO@"
	db $01 ; data type
	db 42, HITMONTOP, PURSUIT, QUICK_ATTACK, DIG, DETECT
	db 42, HITMONLEE, SWAGGER, DOUBLE_KICK, HI_JUMP_KICK, FORESIGHT
	db 42, HITMONCHAN, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MACH_PUNCH
	db 43, ONIX, BIND, EARTHQUAKE, SANDSTORM, ROCK_SLIDE
	db 46, MACHAMP, ROCK_SLIDE, FORESIGHT, VITAL_THROW, CROSS_CHOP
	db $ff ; end trainer party mons
	; last_address=0x39cc0 size=38
; 0x39cc0

EliteFourKarenTrainerGroupHeader: ; 0x39cc0
	; KAREN (1) at 0x39cc0
	db "KAREN@"
	db $01 ; data type
	db 42, UMBREON, SAND_ATTACK, CONFUSE_RAY, FAINT_ATTACK, MEAN_LOOK
	db 42, VILEPLUME, STUN_SPORE, ACID, MOONLIGHT, PETAL_DANCE
	db 45, GENGAR, LICK, SPITE, CURSE, DESTINY_BOND
	db 44, MURKROW, QUICK_ATTACK, WHIRLWIND, PURSUIT, FAINT_ATTACK
	db 47, HOUNDOOM, ROAR, PURSUIT, FLAMETHROWER, CRUNCH
	db $ff ; end trainer party mons
	; last_address=0x39ce6 size=38
; 0x39ce6

EliteFourKogaTrainerGroupHeader: ; 0x39ce6
	; KOGA (1) at 0x39ce6
	db "KOGA@"
	db $01 ; data type
	db 40, ARIADOS, DOUBLE_TEAM, SPIDER_WEB, BATON_PASS, GIGA_DRAIN
	db 41, VENOMOTH, SUPERSONIC, GUST, PSYCHIC_M, TOXIC
	db 43, FORRETRESS, PROTECT, SWIFT, EXPLOSION, SPIKES
	db 42, MUK, MINIMIZE, ACID_ARMOR, SLUDGE_BOMB, TOXIC
	db 44, CROBAT, DOUBLE_TEAM, QUICK_ATTACK, WING_ATTACK, TOXIC
	db $ff ; end trainer party mons
	; last_address=0x39d0b size=37
; 0x39d0b

ChampionTrainerGroupHeader: ; 0x39d0b
	; LANCE (1) at 0x39d0b
	db "LANCE@"
	db $01 ; data type
	db 44, GYARADOS, FLAIL, RAIN_DANCE, SURF, HYPER_BEAM
	db 47, DRAGONITE, THUNDER_WAVE, TWISTER, THUNDER, HYPER_BEAM
	db 47, DRAGONITE, THUNDER_WAVE, TWISTER, BLIZZARD, HYPER_BEAM
	db 46, AERODACTYL, WING_ATTACK, ANCIENTPOWER, ROCK_SLIDE, HYPER_BEAM
	db 46, CHARIZARD, FLAMETHROWER, WING_ATTACK, SLASH, HYPER_BEAM
	db 50, DRAGONITE, FIRE_BLAST, SAFEGUARD, OUTRAGE, HYPER_BEAM
	db $ff ; end trainer party mons
	; last_address=0x39d37 size=44
; 0x39d37

BrockTrainerGroupHeader: ; 0x39d37
	; BROCK (1) at 0x39d37
	db "BROCK@"
	db $01 ; data type
	db 41, GRAVELER, DEFENSE_CURL, ROCK_SLIDE, ROLLOUT, EARTHQUAKE
	db 41, RHYHORN, FURY_ATTACK, SCARY_FACE, EARTHQUAKE, HORN_DRILL
	db 42, OMASTAR, BITE, SURF, PROTECT, SPIKE_CANNON
	db 44, ONIX, BIND, ROCK_SLIDE, BIDE, SANDSTORM
	db 42, KABUTOPS, SLASH, SURF, ENDURE, GIGA_DRAIN
	db $ff ; end trainer party mons
	; last_address=0x39d5d size=38
; 0x39d5d

MistyTrainerGroupHeader: ; 0x39d5d
	; MISTY (1) at 0x39d5d
	db "MISTY@"
	db $01 ; data type
	db 42, GOLDUCK, SURF, DISABLE, PSYCH_UP, PSYCHIC_M
	db 42, QUAGSIRE, SURF, AMNESIA, EARTHQUAKE, RAIN_DANCE
	db 44, LAPRAS, SURF, PERISH_SONG, BLIZZARD, RAIN_DANCE
	db 47, STARMIE, SURF, CONFUSE_RAY, RECOVER, ICE_BEAM
	db $ff ; end trainer party mons
	; last_address=0x39d7d size=32
; 0x39d7d

LtSurgeTrainerGroupHeader: ; 0x39d7d
	; LT_SURGE (1) at 0x39d7d
	db "LT.SURGE@"
	db $01 ; data type
	db 44, RAICHU, THUNDER_WAVE, QUICK_ATTACK, THUNDERBOLT, THUNDER
	db 40, ELECTRODE, SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	db 40, MAGNETON, LOCK_ON, DOUBLE_TEAM, SWIFT, ZAP_CANNON
	db 40, ELECTRODE, SCREECH, DOUBLE_TEAM, SWIFT, EXPLOSION
	db 46, ELECTABUZZ, QUICK_ATTACK, THUNDERPUNCH, LIGHT_SCREEN, THUNDER
	db $ff ; end trainer party mons
	; last_address=0x39da6 size=41
; 0x39da6

ScientistTrainerGroupHeader: ; 0x39da6
	; ROSS (1) at 0x39da6
	db "ROSS@"
	db $00 ; data type
	db 22, KOFFING
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x39db1 size=11

	; MITCH (2) at 0x39db1
	db "MITCH@"
	db $00 ; data type
	db 24, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39dbb size=10

	; JED (3) at 0x39dbb
	db "JED@"
	db $00 ; data type
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39dc7 size=12

	; MARC (4) at 0x39dc7
	db "MARC@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39dd4 size=13

	; RICH (5) at 0x39dd4
	db "RICH@"
	db $01 ; data type
	db 30, PORYGON, CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x39de1 size=13
; 0x39de1

ErikaTrainerGroupHeader: ; 0x39de1
	; ERIKA (1) at 0x39de1
	db "ERIKA@"
	db $01 ; data type
	db 42, TANGELA, VINE_WHIP, BIND, GIGA_DRAIN, SLEEP_POWDER
	db 41, JUMPLUFF, MEGA_DRAIN, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	db 46, VICTREEBEL, SUNNY_DAY, SYNTHESIS, ACID, RAZOR_LEAF
	db 46, BELLOSSOM, SUNNY_DAY, SYNTHESIS, PETAL_DANCE, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x39e01 size=32
; 0x39e01

YoungsterTrainerGroupHeader: ; 0x39e01
	; JOEY1 (1) at 0x39e01
	db "JOEY@"
	db $00 ; data type
	db 4, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e0a size=9

	; MIKEY (2) at 0x39e0a
	db "MIKEY@"
	db $00 ; data type
	db 2, PIDGEY
	db 4, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e16 size=12

	; ALBERT (3) at 0x39e16
	db "ALBERT@"
	db $00 ; data type
	db 6, RATTATA
	db 8, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x39e23 size=13

	; GORDON (4) at 0x39e23
	db "GORDON@"
	db $00 ; data type
	db 10, WOOPER
	db $ff ; end trainer party mons
	; last_address=0x39e2e size=11

	; SAMUEL (5) at 0x39e2e
	db "SAMUEL@"
	db $00 ; data type
	db 7, RATTATA
	db 10, SANDSHREW
	db 8, SPEAROW
	db 8, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x39e3f size=17

	; IAN (6) at 0x39e3f
	db "IAN@"
	db $00 ; data type
	db 10, MANKEY
	db 12, DIGLETT
	db $ff ; end trainer party mons
	; last_address=0x39e49 size=10

	; JOEY2 (7) at 0x39e49
	db "JOEY@"
	db $00 ; data type
	db 15, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x39e52 size=9

	; JOEY3 (8) at 0x39e52
	db "JOEY@"
	db $01 ; data type
	db 21, RATICATE, TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x39e5f size=13

	; WARREN (9) at 0x39e5f
	db "WARREN@"
	db $00 ; data type
	db 35, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x39e6a size=11

	; JIMMY (10) at 0x39e6a
	db "JIMMY@"
	db $00 ; data type
	db 33, RATICATE
	db 33, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x39e76 size=12

	; OWEN (11) at 0x39e76
	db "OWEN@"
	db $00 ; data type
	db 35, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x39e7f size=9

	; JASON (12) at 0x39e7f
	db "JASON@"
	db $00 ; data type
	db 33, SANDSLASH
	db 33, CROBAT
	db $ff ; end trainer party mons
	; last_address=0x39e8b size=12

	; JOEY4 (13) at 0x39e8b
	db "JOEY@"
	db $01 ; data type
	db 30, RATICATE, TAIL_WHIP, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db $ff ; end trainer party mons
	; last_address=0x39e98 size=13

	; JOEY5 (14) at 0x39e98
	db "JOEY@"
	db $01 ; data type
	db 37, RATICATE, HYPER_BEAM, QUICK_ATTACK, HYPER_FANG, PURSUIT
	db $ff ; end trainer party mons
	; last_address=0x39ea5 size=13
; 0x39ea5

SchoolboyTrainerGroupHeader: ; 0x39ea5
	; JACK1 (1) at 0x39ea5
	db "JACK@"
	db $00 ; data type
	db 12, ODDISH
	db 15, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x39eb0 size=11

	; KIPP (2) at 0x39eb0
	db "KIPP@"
	db $00 ; data type
	db 27, VOLTORB
	db 27, MAGNEMITE
	db 31, VOLTORB
	db 31, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39ebf size=15

	; ALAN1 (3) at 0x39ebf
	db "ALAN@"
	db $00 ; data type
	db 16, TANGELA
	db $ff ; end trainer party mons
	; last_address=0x39ec8 size=9

	; JOHNNY (4) at 0x39ec8
	db "JOHNNY@"
	db $00 ; data type
	db 29, BELLSPROUT
	db 31, WEEPINBELL
	db 33, VICTREEBEL
	db $ff ; end trainer party mons
	; last_address=0x39ed7 size=15

	; DANNY (5) at 0x39ed7
	db "DANNY@"
	db $00 ; data type
	db 31, JYNX
	db 31, ELECTABUZZ
	db 31, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x39ee5 size=14

	; TOMMY (6) at 0x39ee5
	db "TOMMY@"
	db $00 ; data type
	db 32, XATU
	db 34, ALAKAZAM
	db $ff ; end trainer party mons
	; last_address=0x39ef1 size=12

	; DUDLEY (7) at 0x39ef1
	db "DUDLEY@"
	db $00 ; data type
	db 35, ODDISH
	db $ff ; end trainer party mons
	; last_address=0x39efc size=11

	; JOE (8) at 0x39efc
	db "JOE@"
	db $00 ; data type
	db 33, TANGELA
	db 33, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x39f06 size=10

	; BILLY (9) at 0x39f06
	db "BILLY@"
	db $00 ; data type
	db 27, PARAS
	db 27, PARAS
	db 27, POLIWHIRL
	db 35, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39f16 size=16

	; CHAD1 (10) at 0x39f16
	db "CHAD@"
	db $00 ; data type
	db 19, MR__MIME
	db $ff ; end trainer party mons
	; last_address=0x39f1f size=9

	; NATE (11) at 0x39f1f
	db "NATE@"
	db $00 ; data type
	db 32, LEDIAN
	db 32, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x39f2a size=11

	; RICKY (12) at 0x39f2a
	db "RICKY@"
	db $00 ; data type
	db 32, AIPOM
	db 32, DITTO
	db $ff ; end trainer party mons
	; last_address=0x39f36 size=12

	; JACK2 (13) at 0x39f36
	db "JACK@"
	db $00 ; data type
	db 14, ODDISH
	db 17, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x39f41 size=11

	; JACK3 (14) at 0x39f41
	db "JACK@"
	db $00 ; data type
	db 28, GLOOM
	db 31, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x39f4c size=11

	; ALAN2 (15) at 0x39f4c
	db "ALAN@"
	db $00 ; data type
	db 17, TANGELA
	db 17, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39f57 size=11

	; ALAN3 (16) at 0x39f57
	db "ALAN@"
	db $00 ; data type
	db 20, NATU
	db 22, TANGELA
	db 20, QUAGSIRE
	db 25, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39f66 size=15

	; CHAD2 (17) at 0x39f66
	db "CHAD@"
	db $00 ; data type
	db 19, MR__MIME
	db 19, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x39f71 size=11

	; CHAD3 (18) at 0x39f71
	db "CHAD@"
	db $00 ; data type
	db 27, MR__MIME
	db 31, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39f7c size=11

	; JACK4 (19) at 0x39f7c
	db "JACK@"
	db $00 ; data type
	db 30, GLOOM
	db 33, GROWLITHE
	db 33, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x39f89 size=13

	; JACK5 (20) at 0x39f89
	db "JACK@"
	db $01 ; data type
	db 35, ELECTRODE, SCREECH, SONICBOOM, ROLLOUT, LIGHT_SCREEN
	db 35, GROWLITHE, SUNNY_DAY, LEER, TAKE_DOWN, FLAME_WHEEL
	db 37, VILEPLUME, SOLARBEAM, SLEEP_POWDER, ACID, MOONLIGHT
	db $ff ; end trainer party mons
	; last_address=0x39fa2 size=25

	; ALAN4 (21) at 0x39fa2
	db "ALAN@"
	db $00 ; data type
	db 27, NATU
	db 27, TANGELA
	db 30, QUAGSIRE
	db 30, YANMA
	db $ff ; end trainer party mons
	; last_address=0x39fb1 size=15

	; ALAN5 (22) at 0x39fb1
	db "ALAN@"
	db $01 ; data type
	db 35, XATU, PECK, NIGHT_SHADE, SWIFT, FUTURE_SIGHT
	db 32, TANGELA, POISONPOWDER, VINE_WHIP, BIND, MEGA_DRAIN
	db 32, YANMA, QUICK_ATTACK, DOUBLE_TEAM, SONICBOOM, SUPERSONIC
	db 35, QUAGSIRE, TAIL_WHIP, SLAM, AMNESIA, EARTHQUAKE
	db $ff ; end trainer party mons
	; last_address=0x39fd0 size=31

	; CHAD4 (23) at 0x39fd0
	db "CHAD@"
	db $00 ; data type
	db 30, MR__MIME
	db 34, MAGNETON
	db $ff ; end trainer party mons
	; last_address=0x39fdb size=11

	; CHAD5 (24) at 0x39fdb
	db "CHAD@"
	db $01 ; data type
	db 34, MR__MIME, PSYCHIC_M, LIGHT_SCREEN, REFLECT, ENCORE
	db 38, MAGNETON, ZAP_CANNON, THUNDER_WAVE, LOCK_ON, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x39fee size=19
; 0x39fee

BirdKeeperTrainerGroupHeader: ; 0x39fee
	; ROD (1) at 0x39fee
	db "ROD@"
	db $00 ; data type
	db 7, PIDGEY
	db 7, PIDGEY
	db $ff ; end trainer party mons
	; last_address=0x39ff8 size=10

	; ABE (2) at 0x39ff8
	db "ABE@"
	db $00 ; data type
	db 9, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a000 size=8

	; BRYAN (3) at 0x3a000
	db "BRYAN@"
	db $00 ; data type
	db 12, PIDGEY
	db 14, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a00c size=12

	; THEO (4) at 0x3a00c
	db "THEO@"
	db $00 ; data type
	db 17, PIDGEY
	db 15, PIDGEY
	db 19, PIDGEY
	db 15, PIDGEY
	db 15, PIDGEY
	db $ff ; end trainer party mons
	; last_address=0x3a01d size=17

	; TOBY (5) at 0x3a01d
	db "TOBY@"
	db $00 ; data type
	db 15, DODUO
	db 16, DODUO
	db 17, DODUO
	db $ff ; end trainer party mons
	; last_address=0x3a02a size=13

	; DENIS (6) at 0x3a02a
	db "DENIS@"
	db $00 ; data type
	db 18, SPEAROW
	db 20, FEAROW
	db 18, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a038 size=14

	; VANCE1 (7) at 0x3a038
	db "VANCE@"
	db $00 ; data type
	db 25, PIDGEOTTO
	db 25, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a044 size=12

	; HANK (8) at 0x3a044
	db "HANK@"
	db $00 ; data type
	db 12, PIDGEY
	db 34, PIDGEOT
	db $ff ; end trainer party mons
	; last_address=0x3a04f size=11

	; ROY (9) at 0x3a04f
	db "ROY@"
	db $00 ; data type
	db 29, FEAROW
	db 35, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a059 size=10

	; BORIS (10) at 0x3a059
	db "BORIS@"
	db $00 ; data type
	db 30, DODUO
	db 28, DODUO
	db 32, DODRIO
	db $ff ; end trainer party mons
	; last_address=0x3a067 size=14

	; BOB (11) at 0x3a067
	db "BOB@"
	db $00 ; data type
	db 34, NOCTOWL
	db $ff ; end trainer party mons
	; last_address=0x3a06f size=8

	; JOSE1 (12) at 0x3a06f
	db "JOSE@"
	db $00 ; data type
	db 36, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a078 size=9

	; PETER (13) at 0x3a078
	db "PETER@"
	db $00 ; data type
	db 6, PIDGEY
	db 6, PIDGEY
	db 8, SPEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a086 size=14

	; JOSE2 (14) at 0x3a086
	db "JOSE@"
	db $00 ; data type
	db 34, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a08f size=9

	; PERRY (15) at 0x3a08f
	db "PERRY@"
	db $00 ; data type
	db 34, FARFETCH_D
	db $ff ; end trainer party mons
	; last_address=0x3a099 size=10

	; BRET (16) at 0x3a099
	db "BRET@"
	db $00 ; data type
	db 32, PIDGEOTTO
	db 32, FEAROW
	db $ff ; end trainer party mons
	; last_address=0x3a0a4 size=11

	; JOSE3 (17) at 0x3a0a4
	db "JOSE@"
	db $01 ; data type
	db 40, FARFETCH_D, FURY_ATTACK, DETECT, FLY, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3a0b1 size=13

	; VANCE2 (18) at 0x3a0b1
	db "VANCE@"
	db $00 ; data type
	db 32, PIDGEOTTO
	db 32, PIDGEOTTO
	db $ff ; end trainer party mons
	; last_address=0x3a0bd size=12

	; VANCE3 (19) at 0x3a0bd
	db "VANCE@"
	db $01 ; data type
	db 38, PIDGEOT, TOXIC, QUICK_ATTACK, WHIRLWIND, FLY
	db 38, PIDGEOT, SWIFT, DETECT, STEEL_WING, FLY
	db $ff ; end trainer party mons
	; last_address=0x3a0d1 size=20
; 0x3a0d1

LassTrainerGroupHeader: ; 0x3a0d1
	; CARRIE (1) at 0x3a0d1
	db "CARRIE@"
	db $01 ; data type
	db 18, SNUBBULL, SCARY_FACE, CHARM, BITE, LICK
	db $ff ; end trainer party mons
	; last_address=0x3a0e0 size=15

	; BRIDGET (2) at 0x3a0e0
	db "BRIDGET@"
	db $00 ; data type
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF
	db 15, JIGGLYPUFF
	db $ff ; end trainer party mons
	; last_address=0x3a0f0 size=16

	; ALICE (3) at 0x3a0f0
	db "ALICE@"
	db $00 ; data type
	db 30, GLOOM
	db 34, ARBOK
	db 30, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3a0fe size=14

	; KRISE (4) at 0x3a0fe
	db "KRISE@"
	db $00 ; data type
	db 12, ODDISH
	db 15, CUBONE
	db $ff ; end trainer party mons
	; last_address=0x3a10a size=12

	; CONNIE1 (5) at 0x3a10a
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a115 size=11

	; LINDA (6) at 0x3a115
	db "LINDA@"
	db $00 ; data type
	db 30, BULBASAUR
	db 32, IVYSAUR
	db 34, VENUSAUR
	db $ff ; end trainer party mons
	; last_address=0x3a123 size=14

	; LAURA (7) at 0x3a123
	db "LAURA@"
	db $00 ; data type
	db 28, GLOOM
	db 31, PIDGEOTTO
	db 31, BELLOSSOM
	db $ff ; end trainer party mons
	; last_address=0x3a131 size=14

	; SHANNON (8) at 0x3a131
	db "SHANNON@"
	db $00 ; data type
	db 29, PARAS
	db 29, PARAS
	db 32, PARASECT
	db $ff ; end trainer party mons
	; last_address=0x3a141 size=16

	; MICHELLE (9) at 0x3a141
	db "MICHELLE@"
	db $00 ; data type
	db 32, SKIPLOOM
	db 33, HOPPIP
	db 34, JUMPLUFF
	db $ff ; end trainer party mons
	; last_address=0x3a152 size=17

	; DANA1 (10) at 0x3a152
	db "DANA@"
	db $01 ; data type
	db 18, FLAAFFY, TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	db 18, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3a165 size=19

	; ELLEN (11) at 0x3a165
	db "ELLEN@"
	db $00 ; data type
	db 30, WIGGLYTUFF
	db 34, GRANBULL
	db $ff ; end trainer party mons
	; last_address=0x3a171 size=12

	; CONNIE2 (12) at 0x3a171
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a17c size=11

	; CONNIE3 (13) at 0x3a17c
	db "CONNIE@"
	db $00 ; data type
	db 21, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a187 size=11

	; DANA2 (14) at 0x3a187
	db "DANA@"
	db $01 ; data type
	db 21, FLAAFFY, TACKLE, GROWL, THUNDERSHOCK, THUNDER_WAVE
	db 21, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3a19a size=19

	; DANA3 (15) at 0x3a19a
	db "DANA@"
	db $01 ; data type
	db 29, PSYDUCK, SCRATCH, DISABLE, CONFUSION, SCREECH
	db 29, AMPHAROS, TACKLE, THUNDERSHOCK, THUNDER_WAVE, COTTON_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a1ad size=19

	; DANA4 (16) at 0x3a1ad
	db "DANA@"
	db $01 ; data type
	db 32, PSYDUCK, SCRATCH, DISABLE, CONFUSION, SCREECH
	db 32, AMPHAROS, TACKLE, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a1c0 size=19

	; DANA5 (17) at 0x3a1c0
	db "DANA@"
	db $01 ; data type
	db 36, AMPHAROS, SWIFT, THUNDERPUNCH, THUNDER_WAVE, COTTON_SPORE
	db 36, GOLDUCK, DISABLE, SURF, PSYCHIC_M, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3a1d3 size=19
; 0x3a1d3

JanineTrainerGroupHeader: ; 0x3a1d3
	; JANINE (1) at 0x3a1d3
	db "JANINE@"
	db $01 ; data type
	db 36, CROBAT, SCREECH, SUPERSONIC, CONFUSE_RAY, WING_ATTACK
	db 36, WEEZING, SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	db 36, WEEZING, SMOG, SLUDGE_BOMB, TOXIC, EXPLOSION
	db 33, ARIADOS, SCARY_FACE, GIGA_DRAIN, STRING_SHOT, NIGHT_SHADE
	db 39, VENOMOTH, FORESIGHT, DOUBLE_TEAM, GUST, PSYCHIC_M
	db $ff ; end trainer party mons
	; last_address=0x3a1fa size=39
; 0x3a1fa

CooltrainerMTrainerGroupHeader: ; 0x3a1fa
	; NICK (1) at 0x3a1fa
	db "NICK@"
	db $01 ; data type
	db 26, CHARMANDER, EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db 26, SQUIRTLE, WITHDRAW, WATER_GUN, BITE, CURSE
	db 26, BULBASAUR, LEECH_SEED, POISONPOWDER, SLEEP_POWDER, RAZOR_LEAF
	db $ff ; end trainer party mons
	; last_address=0x3a213 size=25

	; AARON (2) at 0x3a213
	db "AARON@"
	db $00 ; data type
	db 24, IVYSAUR
	db 24, CHARMELEON
	db 24, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a221 size=14

	; PAUL (3) at 0x3a221
	db "PAUL@"
	db $00 ; data type
	db 34, DRATINI
	db 34, DRATINI
	db 34, DRATINI
	db $ff ; end trainer party mons
	; last_address=0x3a22e size=13

	; CODY (4) at 0x3a22e
	db "CODY@"
	db $00 ; data type
	db 34, HORSEA
	db 36, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3a239 size=11

	; MIKE (5) at 0x3a239
	db "MIKE@"
	db $00 ; data type
	db 37, DRAGONAIR
	db $ff ; end trainer party mons
	; last_address=0x3a242 size=9

	; GAVEN1 (6) at 0x3a242
	db "GAVEN@"
	db $01 ; data type
	db 35, VICTREEBEL, WRAP, TOXIC, ACID, RAZOR_LEAF
	db 35, KINGLER, BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	db 35, FLAREON, SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a25c size=26

	; GAVEN2 (7) at 0x3a25c
	db "GAVEN@"
	db $03 ; data type
	db 39, VICTREEBEL, $0, GIGA_DRAIN, TOXIC, SLUDGE_BOMB, RAZOR_LEAF
	db 39, KINGLER, KINGS_ROCK, SURF, STOMP, GUILLOTINE, BLIZZARD
	db 39, FLAREON, $0, FLAMETHROWER, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a279 size=29

	; RYAN (8) at 0x3a279
	db "RYAN@"
	db $01 ; data type
	db 25, PIDGEOT, SAND_ATTACK, QUICK_ATTACK, WHIRLWIND, WING_ATTACK
	db 27, ELECTABUZZ, THUNDERPUNCH, LIGHT_SCREEN, SWIFT, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3a28c size=19

	; JAKE (9) at 0x3a28c
	db "JAKE@"
	db $01 ; data type
	db 33, PARASECT, LEECH_LIFE, SPORE, SLASH, SWORDS_DANCE
	db 35, GOLDUCK, CONFUSION, SCREECH, PSYCH_UP, FURY_SWIPES
	db $ff ; end trainer party mons
	; last_address=0x3a29f size=19

	; GAVEN3 (10) at 0x3a29f
	db "GAVEN@"
	db $01 ; data type
	db 32, VICTREEBEL, WRAP, TOXIC, ACID, RAZOR_LEAF
	db 32, KINGLER, BUBBLEBEAM, STOMP, GUILLOTINE, PROTECT
	db 32, FLAREON, SAND_ATTACK, QUICK_ATTACK, BITE, FIRE_SPIN
	db $ff ; end trainer party mons
	; last_address=0x3a2b9 size=26

	; BLAKE (11) at 0x3a2b9
	db "BLAKE@"
	db $01 ; data type
	db 33, MAGNETON, THUNDERBOLT, SUPERSONIC, SWIFT, SCREECH
	db 31, QUAGSIRE, WATER_GUN, SLAM, AMNESIA, EARTHQUAKE
	db 31, EXEGGCUTE, LEECH_SEED, CONFUSION, SLEEP_POWDER, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a2d3 size=26

	; BRIAN (12) at 0x3a2d3
	db "BRIAN@"
	db $01 ; data type
	db 35, SANDSLASH, SAND_ATTACK, POISON_STING, SLASH, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3a2e1 size=14

	; ERICK (13) at 0x3a2e1
	db "ERICK@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a2ef size=14

	; ANDY (14) at 0x3a2ef
	db "ANDY@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a2fc size=13

	; TYLER (15) at 0x3a2fc
	db "TYLER@"
	db $00 ; data type
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a30a size=14

	; SEAN (16) at 0x3a30a
	db "SEAN@"
	db $00 ; data type
	db 35, FLAREON
	db 35, TANGELA
	db 35, TAUROS
	db $ff ; end trainer party mons
	; last_address=0x3a317 size=13

	; KEVIN (17) at 0x3a317
	db "KEVIN@"
	db $00 ; data type
	db 38, RHYHORN
	db 35, CHARMELEON
	db 35, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a325 size=14

	; STEVE (18) at 0x3a325
	db "STEVE@"
	db $00 ; data type
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE
	db $ff ; end trainer party mons
	; last_address=0x3a333 size=14

	; ALLEN (19) at 0x3a333
	db "ALLEN@"
	db $01 ; data type
	db 27, CHARMELEON, EMBER, SMOKESCREEN, RAGE, SCARY_FACE
	db $ff ; end trainer party mons
	; last_address=0x3a341 size=14

	; DARIN (20) at 0x3a341
	db "DARIN@"
	db $01 ; data type
	db 37, DRAGONAIR, WRAP, SURF, DRAGON_RAGE, SLAM
	db $ff ; end trainer party mons
	; last_address=0x3a34f size=14
; 0x3a34f

CooltrainerFTrainerGroupHeader: ; 0x3a34f
	; GWEN (1) at 0x3a34f
	db "GWEN@"
	db $00 ; data type
	db 26, EEVEE
	db 22, FLAREON
	db 22, VAPOREON
	db 22, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3a35e size=15

	; LOIS (2) at 0x3a35e
	db "LOIS@"
	db $01 ; data type
	db 25, SKIPLOOM, SYNTHESIS, POISONPOWDER, MEGA_DRAIN, LEECH_SEED
	db 25, NINETALES, EMBER, QUICK_ATTACK, CONFUSE_RAY, SAFEGUARD
	db $ff ; end trainer party mons
	; last_address=0x3a371 size=19

	; FRAN (3) at 0x3a371
	db "FRAN@"
	db $00 ; data type
	db 37, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3a37a size=9

	; LOLA (4) at 0x3a37a
	db "LOLA@"
	db $00 ; data type
	db 34, DRATINI
	db 36, DRAGONAIR
	db $ff ; end trainer party mons
	; last_address=0x3a385 size=11

	; KATE (5) at 0x3a385
	db "KATE@"
	db $00 ; data type
	db 26, SHELLDER
	db 28, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3a390 size=11

	; IRENE (6) at 0x3a390
	db "IRENE@"
	db $00 ; data type
	db 22, GOLDEEN
	db 24, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a39c size=12

	; KELLY (7) at 0x3a39c
	db "KELLY@"
	db $00 ; data type
	db 27, MARILL
	db 24, WARTORTLE
	db 24, WARTORTLE
	db $ff ; end trainer party mons
	; last_address=0x3a3aa size=14

	; JOYCE (8) at 0x3a3aa
	db "JOYCE@"
	db $01 ; data type
	db 36, PIKACHU, QUICK_ATTACK, DOUBLE_TEAM, THUNDERBOLT, THUNDER
	db 32, BLASTOISE, BITE, CURSE, SURF, RAIN_DANCE
	db $ff ; end trainer party mons
	; last_address=0x3a3be size=20

	; BETH1 (9) at 0x3a3be
	db "BETH@"
	db $01 ; data type
	db 36, RAPIDASH, STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db $ff ; end trainer party mons
	; last_address=0x3a3cb size=13

	; REENA1 (10) at 0x3a3cb
	db "REENA@"
	db $00 ; data type
	db 31, STARMIE
	db 33, NIDOQUEEN
	db 31, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a3d9 size=14

	; MEGAN (11) at 0x3a3d9
	db "MEGAN@"
	db $01 ; data type
	db 32, BULBASAUR, GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	db 32, IVYSAUR, GROWL, LEECH_SEED, POISONPOWDER, RAZOR_LEAF
	db 32, VENUSAUR, BODY_SLAM, SLEEP_POWDER, RAZOR_LEAF, SWEET_SCENT
	db $ff ; end trainer party mons
	; last_address=0x3a3f3 size=26

	; BETH2 (12) at 0x3a3f3
	db "BETH@"
	db $01 ; data type
	db 39, RAPIDASH, STOMP, FIRE_SPIN, FURY_ATTACK, AGILITY
	db $ff ; end trainer party mons
	; last_address=0x3a400 size=13

	; CAROL (13) at 0x3a400
	db "CAROL@"
	db $00 ; data type
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES
	db $ff ; end trainer party mons
	; last_address=0x3a40e size=14

	; QUINN (14) at 0x3a40e
	db "QUINN@"
	db $00 ; data type
	db 38, IVYSAUR
	db 38, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a41a size=12

	; EMMA (15) at 0x3a41a
	db "EMMA@"
	db $00 ; data type
	db 28, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3a423 size=9

	; CYBIL (16) at 0x3a423
	db "CYBIL@"
	db $01 ; data type
	db 25, BUTTERFREE, CONFUSION, SLEEP_POWDER, WHIRLWIND, GUST
	db 25, BELLOSSOM, ABSORB, STUN_SPORE, ACID, SOLARBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a437 size=20

	; JENN (17) at 0x3a437
	db "JENN@"
	db $00 ; data type
	db 24, STARYU
	db 26, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a442 size=11

	; BETH3 (18) at 0x3a442
	db "BETH@"
	db $03 ; data type
	db 43, RAPIDASH, FOCUS_BAND, STOMP, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db $ff ; end trainer party mons
	; last_address=0x3a450 size=14

	; REENA2 (19) at 0x3a450
	db "REENA@"
	db $00 ; data type
	db 34, STARMIE
	db 36, NIDOQUEEN
	db 34, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3a45e size=14

	; REENA3 (20) at 0x3a45e
	db "REENA@"
	db $03 ; data type
	db 38, STARMIE, $0, DOUBLE_TEAM, PSYCHIC_M, WATERFALL, CONFUSE_RAY
	db 40, NIDOQUEEN, PINK_BOW, EARTHQUAKE, DOUBLE_KICK, TOXIC, BODY_SLAM
	db 38, STARMIE, $0, BLIZZARD, PSYCHIC_M, WATERFALL, RECOVER
	db $ff ; end trainer party mons
	; last_address=0x3a47b size=29

	; CARA (21) at 0x3a47b
	db "CARA@"
	db $01 ; data type
	db 33, HORSEA, SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	db 33, HORSEA, SMOKESCREEN, LEER, WHIRLPOOL, TWISTER
	db 35, SEADRA, SWIFT, LEER, WATERFALL, TWISTER
	db $ff ; end trainer party mons
	; last_address=0x3a494 size=25
; 0x3a494

BeautyTrainerGroupHeader: ; 0x3a494
	; VICTORIA (1) at 0x3a494
	db "VICTORIA@"
	db $00 ; data type
	db 9, SENTRET
	db 13, SENTRET
	db 17, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4a5 size=17

	; SAMANTHA (2) at 0x3a4a5
	db "SAMANTHA@"
	db $01 ; data type
	db 16, MEOWTH, SCRATCH, GROWL, BITE, PAY_DAY
	db 16, MEOWTH, SCRATCH, GROWL, BITE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3a4bc size=23

	; JULIE (3) at 0x3a4bc
	db "JULIE@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4c6 size=10

	; JACLYN (4) at 0x3a4c6
	db "JACLYN@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a4d1 size=11

	; BRENDA (5) at 0x3a4d1
	db "BRENDA@"
	db $00 ; data type
	db 16, FURRET
	db $ff ; end trainer party mons
	; last_address=0x3a4dc size=11

	; CASSIE (6) at 0x3a4dc
	db "CASSIE@"
	db $00 ; data type
	db 28, VILEPLUME
	db 34, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a4e9 size=13

	; CAROLINE (7) at 0x3a4e9
	db "CAROLINE@"
	db $00 ; data type
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3a4fa size=17

	; CARLENE (8) at 0x3a4fa
	db "CARLENE@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a506 size=12

	; JESSICA (9) at 0x3a506
	db "JESSICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a512 size=12

	; RACHAEL (10) at 0x3a512
	db "RACHAEL@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a51e size=12

	; ANGELICA (11) at 0x3a51e
	db "ANGELICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a52b size=13

	; KENDRA (12) at 0x3a52b
	db "KENDRA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a536 size=11

	; VERONICA (13) at 0x3a536
	db "VERONICA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a543 size=13

	; JULIA (14) at 0x3a543
	db "JULIA@"
	db $00 ; data type
	db 32, PARAS
	db 32, EXEGGCUTE
	db 35, PARASECT
	db $ff ; end trainer party mons
	; last_address=0x3a551 size=14

	; THERESA (15) at 0x3a551
	db "THERESA@"
	db $00 ; data type
	db 15, SENTRET
	db $ff ; end trainer party mons
	; last_address=0x3a55d size=12

	; VALERIE (16) at 0x3a55d
	db "VALERIE@"
	db $01 ; data type
	db 17, HOPPIP, SYNTHESIS, TAIL_WHIP, TACKLE, POISONPOWDER
	db 17, SKIPLOOM, SYNTHESIS, TAIL_WHIP, TACKLE, STUN_SPORE
	db $ff ; end trainer party mons
	; last_address=0x3a573 size=22

	; OLIVIA (17) at 0x3a573
	db "OLIVIA@"
	db $00 ; data type
	db 19, CORSOLA
	db $ff ; end trainer party mons
	; last_address=0x3a57e size=11
; 0x3a57e

PokemaniacTrainerGroupHeader: ; 0x3a57e
	; LARRY (1) at 0x3a57e
	db "LARRY@"
	db $00 ; data type
	db 10, SLOWPOKE
	db $ff ; end trainer party mons
	; last_address=0x3a588 size=10

	; ANDREW (2) at 0x3a588
	db "ANDREW@"
	db $00 ; data type
	db 24, MAROWAK
	db 24, MAROWAK
	db $ff ; end trainer party mons
	; last_address=0x3a595 size=13

	; CALVIN (3) at 0x3a595
	db "CALVIN@"
	db $00 ; data type
	db 26, KANGASKHAN
	db $ff ; end trainer party mons
	; last_address=0x3a5a0 size=11

	; SHANE (4) at 0x3a5a0
	db "SHANE@"
	db $00 ; data type
	db 16, NIDORINA
	db 16, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3a5ac size=12

	; BEN (5) at 0x3a5ac
	db "BEN@"
	db $00 ; data type
	db 19, SLOWBRO
	db $ff ; end trainer party mons
	; last_address=0x3a5b4 size=8

	; BRENT1 (6) at 0x3a5b4
	db "BRENT@"
	db $00 ; data type
	db 19, LICKITUNG
	db $ff ; end trainer party mons
	; last_address=0x3a5be size=10

	; RON (7) at 0x3a5be
	db "RON@"
	db $00 ; data type
	db 19, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3a5c6 size=8

	; ETHAN (8) at 0x3a5c6
	db "ETHAN@"
	db $00 ; data type
	db 31, RHYHORN
	db 31, RHYDON
	db $ff ; end trainer party mons
	; last_address=0x3a5d2 size=12

	; BRENT2 (9) at 0x3a5d2
	db "BRENT@"
	db $00 ; data type
	db 25, KANGASKHAN
	db $ff ; end trainer party mons
	; last_address=0x3a5dc size=10

	; BRENT3 (10) at 0x3a5dc
	db "BRENT@"
	db $01 ; data type
	db 36, PORYGON, RECOVER, PSYCHIC_M, CONVERSION2, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3a5ea size=14

	; ISSAC (11) at 0x3a5ea
	db "ISSAC@"
	db $01 ; data type
	db 12, LICKITUNG, LICK, SUPERSONIC, CUT, 0
	db $ff ; end trainer party mons
	; last_address=0x3a5f8 size=14

	; DONALD (12) at 0x3a5f8
	db "DONALD@"
	db $00 ; data type
	db 10, SLOWPOKE
	db 10, SLOWPOKE
	db $ff ; end trainer party mons
	; last_address=0x3a605 size=13

	; ZACH (13) at 0x3a605
	db "ZACH@"
	db $00 ; data type
	db 27, RHYHORN
	db $ff ; end trainer party mons
	; last_address=0x3a60e size=9

	; BRENT4 (14) at 0x3a60e
	db "BRENT@"
	db $01 ; data type
	db 41, CHANSEY, ROLLOUT, ATTRACT, EGG_BOMB, SOFTBOILED
	db $ff ; end trainer party mons
	; last_address=0x3a61c size=14

	; MILLER (15) at 0x3a61c
	db "MILLER@"
	db $00 ; data type
	db 17, NIDOKING
	db 17, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3a629 size=13
; 0x3a629

GruntMTrainerGroupHeader: ; 0x3a629
	; GRUNT1 (1) at 0x3a629
	db "GRUNT@"
	db $00 ; data type
	db 14, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a633 size=10

	; GRUNT2 (2) at 0x3a633
	db "GRUNT@"
	db $00 ; data type
	db 7, RATTATA
	db 9, ZUBAT
	db 9, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a641 size=14

	; GRUNT3 (3) at 0x3a641
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 24, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3a64d size=12

	; GRUNT4 (4) at 0x3a64d
	db "GRUNT@"
	db $00 ; data type
	db 23, GRIMER
	db 23, GRIMER
	db 25, MUK
	db $ff ; end trainer party mons
	; last_address=0x3a65b size=14

	; GRUNT5 (5) at 0x3a65b
	db "GRUNT@"
	db $00 ; data type
	db 21, RATTATA
	db 21, RATTATA
	db 23, RATTATA
	db 23, RATTATA
	db 23, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a66d size=18

	; GRUNT6 (6) at 0x3a66d
	db "GRUNT@"
	db $00 ; data type
	db 26, ZUBAT
	db 26, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a679 size=12

	; GRUNT7 (7) at 0x3a679
	db "GRUNT@"
	db $00 ; data type
	db 23, KOFFING
	db 23, GRIMER
	db 23, ZUBAT
	db 23, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a689 size=16

	; GRUNT8 (8) at 0x3a689
	db "GRUNT@"
	db $00 ; data type
	db 26, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3a693 size=10

	; GRUNT9 (9) at 0x3a693
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 26, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a69f size=12

	; GRUNT10 (10) at 0x3a69f
	db "GRUNT@"
	db $00 ; data type
	db 22, ZUBAT
	db 24, GOLBAT
	db 22, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3a6ad size=14

	; GRUNT11 (11) at 0x3a6ad
	db "GRUNT@"
	db $00 ; data type
	db 23, MUK
	db 23, KOFFING
	db 25, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6bb size=14

	; GRUNT_EXECUTIVE1 (12) at 0x3a6bb
	db "EXECUTIVE@"
	db $00 ; data type
	db 33, HOUNDOUR
	db $ff ; end trainer party mons
	; last_address=0x3a6c9 size=14

	; GRUNT12 (13) at 0x3a6c9
	db "GRUNT@"
	db $00 ; data type
	db 27, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6d3 size=10

	; GRUNT13 (14) at 0x3a6d3
	db "GRUNT@"
	db $00 ; data type
	db 24, RATICATE
	db 24, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a6df size=12

	; GRUNT14 (15) at 0x3a6df
	db "GRUNT@"
	db $00 ; data type
	db 26, GRIMER
	db 23, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3a6eb size=12

	; GRUNT15 (16) at 0x3a6eb
	db "GRUNT@"
	db $00 ; data type
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA
	db 16, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a6fb size=16

	; GRUNT16 (17) at 0x3a6fb
	db "GRUNT@"
	db $00 ; data type
	db 18, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a705 size=10

	; GRUNT17 (18) at 0x3a705
	db "GRUNT@"
	db $00 ; data type
	db 17, RATTATA
	db 17, ZUBAT
	db 17, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a713 size=14

	; GRUNT18 (19) at 0x3a713
	db "GRUNT@"
	db $00 ; data type
	db 18, VENONAT
	db 18, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a71f size=12

	; GRUNT19 (20) at 0x3a71f
	db "GRUNT@"
	db $00 ; data type
	db 17, DROWZEE
	db 19, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a72b size=12

	; GRUNT20 (21) at 0x3a72b
	db "GRUNT@"
	db $00 ; data type
	db 16, ZUBAT
	db 17, GRIMER
	db 18, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a739 size=14

	; GRUNT_EXECUTIVE2 (22) at 0x3a739
	db "EXECUTIVE@"
	db $00 ; data type
	db 36, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a747 size=14

	; GRUNT_EXECUTIVE3 (23) at 0x3a747
	db "EXECUTIVE@"
	db $00 ; data type
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a755 size=14

	; GRUNT21 (24) at 0x3a755
	db "GRUNT@"
	db $00 ; data type
	db 25, KOFFING
	db 25, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3a761 size=12

	; GRUNT22 (25) at 0x3a761
	db "GRUNT@"
	db $00 ; data type
	db 24, KOFFING
	db 24, MUK
	db $ff ; end trainer party mons
	; last_address=0x3a76d size=12

	; GRUNT23 (26) at 0x3a76d
	db "GRUNT@"
	db $00 ; data type
	db 15, RATTATA
	db 15, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a779 size=12

	; GRUNT_EXECUTIVE4 (27) at 0x3a779
	db "EXECUTIVE@"
	db $00 ; data type
	db 22, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3a787 size=14

	; GRUNT24 (28) at 0x3a787
	db "GRUNT@"
	db $00 ; data type
	db 19, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3a791 size=10

	; GRUNT25 (29) at 0x3a791
	db "GRUNT@"
	db $00 ; data type
	db 9, RATTATA
	db 9, RATTATA
	db $ff ; end trainer party mons
	; last_address=0x3a79d size=12

	; GRUNT26 (30) at 0x3a79d
	db "GRUNT@"
	db $00 ; data type
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x3a7ab size=14

	; GRUNT27 (31) at 0x3a7ab
	db "GRUNT@"
	db $00 ; data type
	db 30, GOLBAT
	db $ff ; end trainer party mons
	; last_address=0x3a7b5 size=10
; 0x3a7b5

GentlemanTrainerGroupHeader: ; 0x3a7b5
	; PRESTON (1) at 0x3a7b5
	db "PRESTON@"
	db $00 ; data type
	db 18, GROWLITHE
	db 18, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3a7c3 size=14

	; EDWARD (2) at 0x3a7c3
	db "EDWARD@"
	db $00 ; data type
	db 33, PERSIAN
	db $ff ; end trainer party mons
	; last_address=0x3a7ce size=11

	; GREGORY (3) at 0x3a7ce
	db "GREGORY@"
	db $00 ; data type
	db 37, PIKACHU
	db 33, FLAAFFY
	db $ff ; end trainer party mons
	; last_address=0x3a7dc size=14

	; VIRGIL (4) at 0x3a7dc
	db "VIRGIL@"
	db $00 ; data type
	db 20, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3a7e7 size=11

	; ALFRED (5) at 0x3a7e7
	db "ALFRED@"
	db $00 ; data type
	db 20, NOCTOWL
	db $ff ; end trainer party mons
	; last_address=0x3a7f2 size=11
; 0x3a7f2

SkierTrainerGroupHeader: ; 0x3a7f2
	; ROXANNE (1) at 0x3a7f2
	db "ROXANNE@"
	db $00 ; data type
	db 28, JYNX
	db $ff ; end trainer party mons
	; last_address=0x3a7fe size=12

	; CLARISSA (2) at 0x3a7fe
	db "CLARISSA@"
	db $00 ; data type
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3a80b size=13
; 0x3a80b

TeacherTrainerGroupHeader: ; 0x3a80b
	; COLETTE (1) at 0x3a80b
	db "COLETTE@"
	db $00 ; data type
	db 36, CLEFAIRY
	db $ff ; end trainer party mons
	; last_address=0x3a817 size=12

	; HILLARY (2) at 0x3a817
	db "HILLARY@"
	db $00 ; data type
	db 32, AIPOM
	db 36, CUBONE
	db $ff ; end trainer party mons
	; last_address=0x3a825 size=14

	; SHIRLEY (3) at 0x3a825
	db "SHIRLEY@"
	db $00 ; data type
	db 35, JIGGLYPUFF
	db $ff ; end trainer party mons
	; last_address=0x3a831 size=12
; 0x3a831

SabrinaTrainerGroupHeader: ; 0x3a831
	; SABRINA (1) at 0x3a831
	db "SABRINA@"
	db $01 ; data type
	db 46, ESPEON, SAND_ATTACK, QUICK_ATTACK, SWIFT, PSYCHIC_M
	db 46, MR__MIME, BARRIER, REFLECT, BATON_PASS, PSYCHIC_M
	db 48, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db $ff ; end trainer party mons
	; last_address=0x3a84d size=28
; 0x3a84d

BugCatcherTrainerGroupHeader: ; 0x3a84d
	; DON (1) at 0x3a84d
	db "DON@"
	db $00 ; data type
	db 3, CATERPIE
	db 3, CATERPIE
	db $ff ; end trainer party mons
	; last_address=0x3a857 size=10

	; ROB (2) at 0x3a857
	db "ROB@"
	db $00 ; data type
	db 32, BEEDRILL
	db 32, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a861 size=10

	; ED (3) at 0x3a861
	db "ED@"
	db $00 ; data type
	db 30, BEEDRILL
	db 30, BEEDRILL
	db 30, BEEDRILL
	db $ff ; end trainer party mons
	; last_address=0x3a86c size=11

	; WADE1 (4) at 0x3a86c
	db "WADE@"
	db $00 ; data type
	db 2, CATERPIE
	db 2, CATERPIE
	db 3, WEEDLE
	db 2, CATERPIE
	db $ff ; end trainer party mons
	; last_address=0x3a87b size=15

	; BUG_CATCHER_BENNY (5) at 0x3a87b
	db "BENNY@"
	db $00 ; data type
	db 7, WEEDLE
	db 9, KAKUNA
	db 12, BEEDRILL
	db $ff ; end trainer party mons
	; last_address=0x3a889 size=14

	; AL (6) at 0x3a889
	db "AL@"
	db $00 ; data type
	db 12, CATERPIE
	db 12, WEEDLE
	db $ff ; end trainer party mons
	; last_address=0x3a892 size=9

	; JOSH (7) at 0x3a892
	db "JOSH@"
	db $00 ; data type
	db 13, PARAS
	db $ff ; end trainer party mons
	; last_address=0x3a89b size=9

	; ARNIE1 (8) at 0x3a89b
	db "ARNIE@"
	db $00 ; data type
	db 15, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a8a5 size=10

	; KEN (9) at 0x3a8a5
	db "KEN@"
	db $00 ; data type
	db 30, ARIADOS
	db 32, PINSIR
	db $ff ; end trainer party mons
	; last_address=0x3a8af size=10

	; WADE2 (10) at 0x3a8af
	db "WADE@"
	db $00 ; data type
	db 9, METAPOD
	db 9, METAPOD
	db 10, KAKUNA
	db 9, METAPOD
	db $ff ; end trainer party mons
	; last_address=0x3a8be size=15

	; WADE3 (11) at 0x3a8be
	db "WADE@"
	db $00 ; data type
	db 14, BUTTERFREE
	db 14, BUTTERFREE
	db 15, BEEDRILL
	db 14, BUTTERFREE
	db $ff ; end trainer party mons
	; last_address=0x3a8cd size=15

	; DOUG (12) at 0x3a8cd
	db "DOUG@"
	db $00 ; data type
	db 34, ARIADOS
	db $ff ; end trainer party mons
	; last_address=0x3a8d6 size=9

	; ARNIE2 (13) at 0x3a8d6
	db "ARNIE@"
	db $00 ; data type
	db 19, VENONAT
	db $ff ; end trainer party mons
	; last_address=0x3a8e0 size=10

	; ARNIE3 (14) at 0x3a8e0
	db "ARNIE@"
	db $01 ; data type
	db 28, VENOMOTH, DISABLE, SUPERSONIC, CONFUSION, LEECH_LIFE
	db $ff ; end trainer party mons
	; last_address=0x3a8ee size=14

	; WADE4 (15) at 0x3a8ee
	db "WADE@"
	db $01 ; data type
	db 24, BUTTERFREE, CONFUSION, POISONPOWDER, SUPERSONIC, WHIRLWIND
	db 24, BUTTERFREE, CONFUSION, STUN_SPORE, SUPERSONIC, WHIRLWIND
	db 25, BEEDRILL, FURY_ATTACK, FOCUS_ENERGY, TWINEEDLE, RAGE
	db 24, BUTTERFREE, CONFUSION, SLEEP_POWDER, SUPERSONIC, WHIRLWIND
	db $ff ; end trainer party mons
	; last_address=0x3a90d size=31

	; WADE5 (16) at 0x3a90d
	db "WADE@"
	db $01 ; data type
	db 30, BUTTERFREE, CONFUSION, POISONPOWDER, SUPERSONIC, GUST
	db 30, BUTTERFREE, CONFUSION, STUN_SPORE, SUPERSONIC, GUST
	db 32, BEEDRILL, FURY_ATTACK, PURSUIT, TWINEEDLE, DOUBLE_TEAM
	db 34, BUTTERFREE, PSYBEAM, SLEEP_POWDER, GUST, WHIRLWIND
	db $ff ; end trainer party mons
	; last_address=0x3a92c size=31

	; ARNIE4 (17) at 0x3a92c
	db "ARNIE@"
	db $01 ; data type
	db 36, VENOMOTH, GUST, SUPERSONIC, PSYBEAM, LEECH_LIFE
	db $ff ; end trainer party mons
	; last_address=0x3a93a size=14

	; ARNIE5 (18) at 0x3a93a
	db "ARNIE@"
	db $01 ; data type
	db 40, VENOMOTH, GUST, SUPERSONIC, PSYCHIC_M, TOXIC
	db $ff ; end trainer party mons
	; last_address=0x3a948 size=14

	; WAYNE (19) at 0x3a948
	db "WAYNE@"
	db $00 ; data type
	db 8, LEDYBA
	db 10, PARAS
	db $ff ; end trainer party mons
	; last_address=0x3a954 size=12
; 0x3a954

FisherTrainerGroupHeader: ; 0x3a954
	; JUSTIN (1) at 0x3a954
	db "JUSTIN@"
	db $00 ; data type
	db 5, MAGIKARP
	db 5, MAGIKARP
	db 15, MAGIKARP
	db 5, MAGIKARP
	db $ff ; end trainer party mons
	; last_address=0x3a965 size=17

	; RALPH1 (2) at 0x3a965
	db "RALPH@"
	db $00 ; data type
	db 10, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3a96f size=10

	; ARNOLD (3) at 0x3a96f
	db "ARNOLD@"
	db $00 ; data type
	db 34, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3a97a size=11

	; KYLE (4) at 0x3a97a
	db "KYLE@"
	db $00 ; data type
	db 28, SEAKING
	db 31, POLIWHIRL
	db 31, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a987 size=13

	; HENRY (5) at 0x3a987
	db "HENRY@"
	db $00 ; data type
	db 8, POLIWAG
	db 8, POLIWAG
	db $ff ; end trainer party mons
	; last_address=0x3a993 size=12

	; MARVIN (6) at 0x3a993
	db "MARVIN@"
	db $00 ; data type
	db 10, MAGIKARP
	db 10, GYARADOS
	db 15, MAGIKARP
	db 15, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3a9a4 size=17

	; TULLY1 (7) at 0x3a9a4
	db "TULLY@"
	db $00 ; data type
	db 18, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3a9ae size=10

	; ANDRE (8) at 0x3a9ae
	db "ANDRE@"
	db $00 ; data type
	db 27, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3a9b8 size=10

	; RAYMOND (9) at 0x3a9b8
	db "RAYMOND@"
	db $00 ; data type
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db 22, MAGIKARP
	db $ff ; end trainer party mons
	; last_address=0x3a9ca size=18

	; WILTON1 (10) at 0x3a9ca
	db "WILTON@"
	db $00 ; data type
	db 23, GOLDEEN
	db 23, GOLDEEN
	db 25, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3a9d9 size=15

	; EDGAR (11) at 0x3a9d9
	db "EDGAR@"
	db $01 ; data type
	db 25, REMORAID, LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	db 25, REMORAID, LOCK_ON, PSYBEAM, AURORA_BEAM, BUBBLEBEAM
	db $ff ; end trainer party mons
	; last_address=0x3a9ed size=20

	; JONAH (12) at 0x3a9ed
	db "JONAH@"
	db $00 ; data type
	db 25, SHELLDER
	db 29, OCTILLERY
	db 25, REMORAID
	db 29, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3a9fd size=16

	; MARTIN (13) at 0x3a9fd
	db "MARTIN@"
	db $00 ; data type
	db 32, REMORAID
	db 32, REMORAID
	db $ff ; end trainer party mons
	; last_address=0x3aa0a size=13

	; STEPHEN (14) at 0x3aa0a
	db "STEPHEN@"
	db $00 ; data type
	db 25, MAGIKARP
	db 25, MAGIKARP
	db 31, QWILFISH
	db 31, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3aa1c size=18

	; BARNEY (15) at 0x3aa1c
	db "BARNEY@"
	db $00 ; data type
	db 30, GYARADOS
	db 30, GYARADOS
	db 30, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3aa2b size=15

	; RALPH2 (16) at 0x3aa2b
	db "RALPH@"
	db $00 ; data type
	db 17, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa35 size=10

	; RALPH3 (17) at 0x3aa35
	db "RALPH@"
	db $00 ; data type
	db 17, QWILFISH
	db 19, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa41 size=12

	; TULLY2 (18) at 0x3aa41
	db "TULLY@"
	db $00 ; data type
	db 23, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3aa4b size=10

	; TULLY3 (19) at 0x3aa4b
	db "TULLY@"
	db $00 ; data type
	db 32, GOLDEEN
	db 32, GOLDEEN
	db 32, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3aa59 size=14

	; WILTON2 (20) at 0x3aa59
	db "WILTON@"
	db $00 ; data type
	db 29, GOLDEEN
	db 29, GOLDEEN
	db 32, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aa68 size=15

	; SCOTT (21) at 0x3aa68
	db "SCOTT@"
	db $00 ; data type
	db 30, QWILFISH
	db 30, QWILFISH
	db 34, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aa76 size=14

	; WILTON3 (22) at 0x3aa76
	db "WILTON@"
	db $01 ; data type
	db 34, SEAKING, SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 34, SEAKING, SUPERSONIC, WATERFALL, FLAIL, FURY_ATTACK
	db 38, REMORAID, PSYBEAM, AURORA_BEAM, BUBBLEBEAM, HYPER_BEAM
	db $ff ; end trainer party mons
	; last_address=0x3aa91 size=27

	; RALPH4 (23) at 0x3aa91
	db "RALPH@"
	db $00 ; data type
	db 30, QWILFISH
	db 32, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3aa9d size=12

	; RALPH5 (24) at 0x3aa9d
	db "RALPH@"
	db $01 ; data type
	db 35, QWILFISH, TOXIC, MINIMIZE, SURF, PIN_MISSILE
	db 39, SEAKING, ENDURE, FLAIL, FURY_ATTACK, WATERFALL
	db $ff ; end trainer party mons
	; last_address=0x3aab1 size=20

	; TULLY4 (25) at 0x3aab1
	db "TULLY@"
	db $01 ; data type
	db 34, SEAKING, SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 34, SEAKING, SUPERSONIC, RAIN_DANCE, WATERFALL, FURY_ATTACK
	db 37, QWILFISH, ROLLOUT, SURF, PIN_MISSILE, TAKE_DOWN
	db $ff ; end trainer party mons
	; last_address=0x3aacb size=26
; 0x3aacb

SwimmerMTrainerGroupHeader: ; 0x3aacb
	; HAROLD (1) at 0x3aacb
	db "HAROLD@"
	db $00 ; data type
	db 32, REMORAID
	db 30, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3aad8 size=13

	; SIMON (2) at 0x3aad8
	db "SIMON@"
	db $00 ; data type
	db 20, TENTACOOL
	db 20, TENTACOOL
	db $ff ; end trainer party mons
	; last_address=0x3aae4 size=12

	; RANDALL (3) at 0x3aae4
	db "RANDALL@"
	db $00 ; data type
	db 18, SHELLDER
	db 20, WARTORTLE
	db 18, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3aaf4 size=16

	; CHARLIE (4) at 0x3aaf4
	db "CHARLIE@"
	db $00 ; data type
	db 21, SHELLDER
	db 19, TENTACOOL
	db 19, TENTACRUEL
	db $ff ; end trainer party mons
	; last_address=0x3ab04 size=16

	; GEORGE (5) at 0x3ab04
	db "GEORGE@"
	db $00 ; data type
	db 16, TENTACOOL
	db 17, TENTACOOL
	db 16, TENTACOOL
	db 19, STARYU
	db 17, TENTACOOL
	db 19, REMORAID
	db $ff ; end trainer party mons
	; last_address=0x3ab19 size=21

	; BERKE (6) at 0x3ab19
	db "BERKE@"
	db $00 ; data type
	db 23, QWILFISH
	db $ff ; end trainer party mons
	; last_address=0x3ab23 size=10

	; KIRK (7) at 0x3ab23
	db "KIRK@"
	db $00 ; data type
	db 20, GYARADOS
	db 20, GYARADOS
	db $ff ; end trainer party mons
	; last_address=0x3ab2e size=11

	; MATHEW (8) at 0x3ab2e
	db "MATHEW@"
	db $00 ; data type
	db 23, KRABBY
	db $ff ; end trainer party mons
	; last_address=0x3ab39 size=11

	; HAL (9) at 0x3ab39
	db "HAL@"
	db $00 ; data type
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3ab45 size=12

	; PATON (10) at 0x3ab45
	db "PATON@"
	db $00 ; data type
	db 26, PILOSWINE
	db 26, PILOSWINE
	db $ff ; end trainer party mons
	; last_address=0x3ab51 size=12

	; DARYL (11) at 0x3ab51
	db "DARYL@"
	db $00 ; data type
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3ab5f size=14

	; WALTER (12) at 0x3ab5f
	db "WALTER@"
	db $00 ; data type
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3ab6e size=15

	; TONY (13) at 0x3ab6e
	db "TONY@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3ab7b size=13

	; JEROME (14) at 0x3ab7b
	db "JEROME@"
	db $00 ; data type
	db 26, SEADRA
	db 28, TENTACOOL
	db 30, TENTACRUEL
	db 28, GOLDEEN
	db $ff ; end trainer party mons
	; last_address=0x3ab8c size=17

	; TUCKER (15) at 0x3ab8c
	db "TUCKER@"
	db $00 ; data type
	db 30, SHELLDER
	db 34, CLOYSTER
	db $ff ; end trainer party mons
	; last_address=0x3ab99 size=13

	; RICK (16) at 0x3ab99
	db "RICK@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3aba6 size=13

	; CAMERON (17) at 0x3aba6
	db "CAMERON@"
	db $00 ; data type
	db 34, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3abb2 size=12

	; SETH (18) at 0x3abb2
	db "SETH@"
	db $00 ; data type
	db 29, QUAGSIRE
	db 29, OCTILLERY
	db 32, QUAGSIRE
	db $ff ; end trainer party mons
	; last_address=0x3abbf size=13

	; JAMES (19) at 0x3abbf
	db "JAMES@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3abcd size=14

	; LEWIS (20) at 0x3abcd
	db "LEWIS@"
	db $00 ; data type
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA
	db $ff ; end trainer party mons
	; last_address=0x3abdb size=14

	; PARKER (21) at 0x3abdb
	db "PARKER@"
	db $00 ; data type
	db 32, HORSEA
	db 32, HORSEA
	db 35, SEADRA
	db $ff ; end trainer party mons
	; last_address=0x3abea size=15
; 0x3abea

SwimmerFTrainerGroupHeader: ; 0x3abea
	; ELAINE (1) at 0x3abea
	db "ELAINE@"
	db $00 ; data type
	db 21, STARYU
	db $ff ; end trainer party mons
	; last_address=0x3abf5 size=11

	; PAULA (2) at 0x3abf5
	db "PAULA@"
	db $00 ; data type
	db 19, STARYU
	db 19, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3ac01 size=12

	; KAYLEE (3) at 0x3ac01
	db "KAYLEE@"
	db $00 ; data type
	db 18, GOLDEEN
	db 20, GOLDEEN
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac10 size=15

	; SUSIE (4) at 0x3ac10
	db "SUSIE@"
	db $01 ; data type
	db 20, PSYDUCK, SCRATCH, TAIL_WHIP, DISABLE, CONFUSION
	db 22, GOLDEEN, PECK, TAIL_WHIP, SUPERSONIC, HORN_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3ac24 size=20

	; DENISE (5) at 0x3ac24
	db "DENISE@"
	db $00 ; data type
	db 22, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3ac2f size=11

	; KARA (6) at 0x3ac2f
	db "KARA@"
	db $00 ; data type
	db 20, STARYU
	db 20, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3ac3a size=11

	; WENDY (7) at 0x3ac3a
	db "WENDY@"
	db $01 ; data type
	db 21, HORSEA, BUBBLE, SMOKESCREEN, LEER, WATER_GUN
	db 21, HORSEA, DRAGON_RAGE, SMOKESCREEN, LEER, WATER_GUN
	db $ff ; end trainer party mons
	; last_address=0x3ac4e size=20

	; LISA (8) at 0x3ac4e
	db "LISA@"
	db $00 ; data type
	db 28, JYNX
	db $ff ; end trainer party mons
	; last_address=0x3ac57 size=9

	; JILL (9) at 0x3ac57
	db "JILL@"
	db $00 ; data type
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3ac60 size=9

	; MARY (10) at 0x3ac60
	db "MARY@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac69 size=9

	; KATIE (11) at 0x3ac69
	db "KATIE@"
	db $00 ; data type
	db 33, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3ac73 size=10

	; DAWN (12) at 0x3ac73
	db "DAWN@"
	db $00 ; data type
	db 34, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac7c size=9

	; TARA (13) at 0x3ac7c
	db "TARA@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3ac85 size=9

	; NICOLE (14) at 0x3ac85
	db "NICOLE@"
	db $00 ; data type
	db 29, MARILL
	db 29, MARILL
	db 32, LAPRAS
	db $ff ; end trainer party mons
	; last_address=0x3ac94 size=15

	; LORI (15) at 0x3ac94
	db "LORI@"
	db $00 ; data type
	db 32, STARMIE
	db 32, STARMIE
	db $ff ; end trainer party mons
	; last_address=0x3ac9f size=11

	; JODY (16) at 0x3ac9f
	db "JODY@"
	db $00 ; data type
	db 20, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3aca8 size=9

	; NIKKI (17) at 0x3aca8
	db "NIKKI@"
	db $00 ; data type
	db 28, SEEL
	db 28, SEEL
	db 28, SEEL
	db 28, DEWGONG
	db $ff ; end trainer party mons
	; last_address=0x3acb8 size=16

	; DIANA (18) at 0x3acb8
	db "DIANA@"
	db $00 ; data type
	db 37, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3acc2 size=10

	; BRIANA (19) at 0x3acc2
	db "BRIANA@"
	db $00 ; data type
	db 35, SEAKING
	db 35, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3accf size=13
; 0x3accf

SailorTrainerGroupHeader: ; 0x3accf
	; EUGENE (1) at 0x3accf
	db "EUGENE@"
	db $00 ; data type
	db 17, POLIWHIRL
	db 17, RATICATE
	db 19, KRABBY
	db $ff ; end trainer party mons
	; last_address=0x3acde size=15

	; HUEY1 (2) at 0x3acde
	db "HUEY@"
	db $00 ; data type
	db 18, POLIWAG
	db 18, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ace9 size=11

	; TERRELL (3) at 0x3ace9
	db "TERRELL@"
	db $00 ; data type
	db 20, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3acf5 size=12

	; KENT (4) at 0x3acf5
	db "KENT@"
	db $01 ; data type
	db 18, KRABBY, BUBBLE, LEER, VICEGRIP, HARDEN
	db 20, KRABBY, BUBBLEBEAM, LEER, VICEGRIP, HARDEN
	db $ff ; end trainer party mons
	; last_address=0x3ad08 size=19

	; ERNEST (5) at 0x3ad08
	db "ERNEST@"
	db $00 ; data type
	db 18, MACHOP
	db 18, MACHOP
	db 18, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ad17 size=15

	; JEFF (6) at 0x3ad17
	db "JEFF@"
	db $00 ; data type
	db 32, RATICATE
	db 32, RATICATE
	db $ff ; end trainer party mons
	; last_address=0x3ad22 size=11

	; GARRETT (7) at 0x3ad22
	db "GARRETT@"
	db $00 ; data type
	db 34, KINGLER
	db $ff ; end trainer party mons
	; last_address=0x3ad2e size=12

	; KENNETH (8) at 0x3ad2e
	db "KENNETH@"
	db $00 ; data type
	db 28, MACHOP
	db 28, MACHOP
	db 28, POLIWRATH
	db 28, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3ad40 size=18

	; STANLY (9) at 0x3ad40
	db "STANLY@"
	db $00 ; data type
	db 31, MACHOP
	db 33, MACHOKE
	db 26, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3ad4f size=15

	; HARRY (10) at 0x3ad4f
	db "HARRY@"
	db $00 ; data type
	db 19, WOOPER
	db $ff ; end trainer party mons
	; last_address=0x3ad59 size=10

	; HUEY2 (11) at 0x3ad59
	db "HUEY@"
	db $00 ; data type
	db 28, POLIWHIRL
	db 28, POLIWHIRL
	db $ff ; end trainer party mons
	; last_address=0x3ad64 size=11

	; HUEY3 (12) at 0x3ad64
	db "HUEY@"
	db $00 ; data type
	db 34, POLIWHIRL
	db 34, POLIWRATH
	db $ff ; end trainer party mons
	; last_address=0x3ad6f size=11

	; HUEY4 (13) at 0x3ad6f
	db "HUEY@"
	db $01 ; data type
	db 38, POLITOED, WHIRLPOOL, RAIN_DANCE, BODY_SLAM, PERISH_SONG
	db 38, POLIWRATH, SURF, STRENGTH, ICE_PUNCH, SUBMISSION
	db $ff ; end trainer party mons
	; last_address=0x3ad82 size=19
; 0x3ad82

SuperNerdTrainerGroupHeader: ; 0x3ad82
	; STAN (2) at 0x3ad82
	db "STAN@"
	db $00 ; data type
	db 20, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3ad8b size=9

	; ERIC (3) at 0x3ad8b
	db "ERIC@"
	db $00 ; data type
	db 11, GRIMER
	db 11, GRIMER
	db $ff ; end trainer party mons
	; last_address=0x3ad96 size=11

	; GREGG (4) at 0x3ad96
	db "GREGG@"
	db $00 ; data type
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3ada4 size=14

	; JAY (5) at 0x3ada4
	db "JAY@"
	db $00 ; data type
	db 22, KOFFING
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3adae size=10

	; DAVE (6) at 0x3adae
	db "DAVE@"
	db $00 ; data type
	db 24, DITTO
	db $ff ; end trainer party mons
	; last_address=0x3adb7 size=9

	; SAM (7) at 0x3adb7
	db "SAM@"
	db $00 ; data type
	db 34, GRIMER
	db 34, MUK
	db $ff ; end trainer party mons
	; last_address=0x3adc1 size=10

	; TOM (8) at 0x3adc1
	db "TOM@"
	db $00 ; data type
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adcd size=12

	; PAT (9) at 0x3adcd
	db "PAT@"
	db $00 ; data type
	db 36, PORYGON
	db $ff ; end trainer party mons
	; last_address=0x3add5 size=8

	; SHAWN (10) at 0x3add5
	db "SHAWN@"
	db $00 ; data type
	db 31, MAGNEMITE
	db 33, MUK
	db 31, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3ade3 size=14

	; TERU (11) at 0x3ade3
	db "TERU@"
	db $00 ; data type
	db 7, MAGNEMITE
	db 11, VOLTORB
	db 7, MAGNEMITE
	db 9, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adf2 size=15

	; RUSS (12) at 0x3adf2
	db "RUSS@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3adff size=13

	; NORTON (13) at 0x3adff
	db "NORTON@"
	db $01 ; data type
	db 30, PORYGON, CONVERSION, CONVERSION2, RECOVER, TRI_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3ae0e size=15

	; HUGH (14) at 0x3ae0e
	db "HUGH@"
	db $01 ; data type
	db 39, SEADRA, SMOKESCREEN, TWISTER, SURF, WATERFALL
	db $ff ; end trainer party mons
	; last_address=0x3ae1b size=13

	; MARKUS (15) at 0x3ae1b
	db "MARKUS@"
	db $01 ; data type
	db 19, SLOWPOKE, CURSE, WATER_GUN, GROWL, STRENGTH
	db $ff ; end trainer party mons
	; last_address=0x3ae2a size=15
; 0x3ae2a

Rival2TrainerGroupHeader: ; 0x3ae2a
	; RIVAL2_1 (1) at 0x3ae2a
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, MEGANIUM, RAZOR_LEAF, POISONPOWDER, BODY_SLAM, LIGHT_SCREEN
	db $ff ; end trainer party mons
	; last_address=0x3ae52 size=40

	; RIVAL2_2 (2) at 0x3ae52
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, TYPHLOSION, SMOKESCREEN, QUICK_ATTACK, FLAME_WHEEL, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3ae7a size=40

	; RIVAL2_3 (3) at 0x3ae7a
	db "?@"
	db $01 ; data type
	db 41, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 42, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db 41, MAGNETON, THUNDERSHOCK, SONICBOOM, THUNDER_WAVE, SWIFT
	db 43, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 43, ALAKAZAM, DISABLE, RECOVER, FUTURE_SIGHT, PSYCHIC_M
	db 45, FERALIGATR, RAGE, WATER_GUN, SCARY_FACE, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3aea2 size=40

	; RIVAL2_4 (4) at 0x3aea2
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, MEGANIUM, GIGA_DRAIN, BODY_SLAM, LIGHT_SCREEN, SAFEGUARD
	db $ff ; end trainer party mons
	; last_address=0x3aeca size=40

	; RIVAL2_5 (5) at 0x3aeca
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, TYPHLOSION, SMOKESCREEN, QUICK_ATTACK, FIRE_BLAST, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3aef2 size=40

	; RIVAL2_6 (6) at 0x3aef2
	db "?@"
	db $01 ; data type
	db 45, SNEASEL, QUICK_ATTACK, SCREECH, FAINT_ATTACK, FURY_CUTTER
	db 48, CROBAT, TOXIC, BITE, CONFUSE_RAY, WING_ATTACK
	db 45, MAGNETON, THUNDER, SONICBOOM, THUNDER_WAVE, SWIFT
	db 46, GENGAR, MEAN_LOOK, CURSE, SHADOW_BALL, CONFUSE_RAY
	db 46, ALAKAZAM, RECOVER, FUTURE_SIGHT, PSYCHIC_M, REFLECT
	db 50, FERALIGATR, SURF, RAIN_DANCE, SLASH, SCREECH
	db $ff ; end trainer party mons
	; last_address=0x3af1a size=40
; 0x3af1a

GuitaristTrainerGroupHeader: ; 0x3af1a
	; CLYDE (1) at 0x3af1a
	db "CLYDE@"
	db $00 ; data type
	db 34, ELECTABUZZ
	db $ff ; end trainer party mons
	; last_address=0x3af24 size=10

	; VINCENT (2) at 0x3af24
	db "VINCENT@"
	db $00 ; data type
	db 27, MAGNEMITE
	db 33, VOLTORB
	db 32, MAGNEMITE
	db 32, MAGNEMITE
	db $ff ; end trainer party mons
	; last_address=0x3af36 size=18
; 0x3af36

HikerTrainerGroupHeader: ; 0x3af36
	; ANTHONY1 (1) at 0x3af36
	db "ANTHONY@"
	db $00 ; data type
	db 16, GEODUDE
	db 18, MACHAMP
	db $ff ; end trainer party mons
	; last_address=0x3af44 size=14

	; RUSSELL (2) at 0x3af44
	db "RUSSELL@"
	db $00 ; data type
	db 4, GEODUDE
	db 6, GEODUDE
	db 8, GEODUDE
	db $ff ; end trainer party mons
	; last_address=0x3af54 size=16

	; PHILLIP (3) at 0x3af54
	db "PHILLIP@"
	db $00 ; data type
	db 23, GEODUDE
	db 23, GEODUDE
	db 23, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3af64 size=16

	; LEONARD (4) at 0x3af64
	db "LEONARD@"
	db $00 ; data type
	db 23, GEODUDE
	db 25, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af72 size=14

	; ANTHONY2 (5) at 0x3af72
	db "ANTHONY@"
	db $00 ; data type
	db 11, GEODUDE
	db 11, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af80 size=14

	; BENJAMIN (6) at 0x3af80
	db "BENJAMIN@"
	db $00 ; data type
	db 14, DIGLETT
	db 14, GEODUDE
	db 16, DUGTRIO
	db $ff ; end trainer party mons
	; last_address=0x3af91 size=17

	; ERIK (7) at 0x3af91
	db "ERIK@"
	db $00 ; data type
	db 24, MACHOP
	db 27, GRAVELER
	db 27, MACHOP
	db $ff ; end trainer party mons
	; last_address=0x3af9e size=13

	; MICHAEL (8) at 0x3af9e
	db "MICHAEL@"
	db $00 ; data type
	db 25, GEODUDE
	db 25, GRAVELER
	db 25, GOLEM
	db $ff ; end trainer party mons
	; last_address=0x3afae size=16

	; PARRY1 (9) at 0x3afae
	db "PARRY@"
	db $00 ; data type
	db 35, ONIX
	db 33, SWINUB
	db $ff ; end trainer party mons
	; last_address=0x3afba size=12

	; TIMOTHY (10) at 0x3afba
	db "TIMOTHY@"
	db $01 ; data type
	db 27, DIGLETT, MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db 27, DUGTRIO, MAGNITUDE, DIG, SAND_ATTACK, SLASH
	db $ff ; end trainer party mons
	; last_address=0x3afd0 size=22

	; BAILEY (11) at 0x3afd0
	db "BAILEY@"
	db $00 ; data type
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db 13, GEODUDE
	db $ff ; end trainer party mons
	; last_address=0x3afe3 size=19

	; ANTHONY3 (12) at 0x3afe3
	db "ANTHONY@"
	db $00 ; data type
	db 25, GRAVELER
	db 27, GRAVELER
	db 29, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3aff3 size=16

	; TIM (13) at 0x3aff3
	db "TIM@"
	db $00 ; data type
	db 31, GRAVELER
	db 31, GRAVELER
	db 31, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3afff size=12

	; NOLAND (14) at 0x3afff
	db "NOLAND@"
	db $00 ; data type
	db 31, SANDSLASH
	db 33, GOLEM
	db $ff ; end trainer party mons
	; last_address=0x3b00c size=13

	; SIDNEY (15) at 0x3b00c
	db "SIDNEY@"
	db $00 ; data type
	db 34, DUGTRIO
	db 32, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b019 size=13

	; KENNY (16) at 0x3b019
	db "KENNY@"
	db $00 ; data type
	db 27, SANDSLASH
	db 29, GRAVELER
	db 31, GOLEM
	db 29, GRAVELER
	db $ff ; end trainer party mons
	; last_address=0x3b029 size=16

	; JIM (17) at 0x3b029
	db "JIM@"
	db $00 ; data type
	db 35, MACHAMP
	db $ff ; end trainer party mons
	; last_address=0x3b031 size=8

	; DANIEL (18) at 0x3b031
	db "DANIEL@"
	db $00 ; data type
	db 11, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b03c size=11

	; PARRY2 (19) at 0x3b03c
	db "PARRY@"
	db $01 ; data type
	db 35, PILOSWINE, EARTHQUAKE, BLIZZARD, REST, TAKE_DOWN
	db 35, DUGTRIO, MAGNITUDE, DIG, MUD_SLAP, SLASH
	db 38, STEELIX, DIG, IRON_TAIL, SANDSTORM, SLAM
	db $ff ; end trainer party mons
	; last_address=0x3b056 size=26

	; PARRY3 (20) at 0x3b056
	db "PARRY@"
	db $00 ; data type
	db 29, ONIX
	db $ff ; end trainer party mons
	; last_address=0x3b060 size=10

	; ANTHONY4 (21) at 0x3b060
	db "ANTHONY@"
	db $00 ; data type
	db 30, GRAVELER
	db 30, GRAVELER
	db 32, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b070 size=16

	; ANTHONY5 (22) at 0x3b070
	db "ANTHONY@"
	db $01 ; data type
	db 34, GRAVELER, MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 36, GOLEM, MAGNITUDE, SELFDESTRUCT, DEFENSE_CURL, ROLLOUT
	db 34, MACHOKE, KARATE_CHOP, VITAL_THROW, HEADBUTT, DIG
	db $ff ; end trainer party mons
	; last_address=0x3b08c size=28
; 0x3b08c

BikerTrainerGroupHeader: ; 0x3b08c
	; BIKER_BENNY (3) at 0x3b08c
	db "BENNY@"
	db $00 ; data type
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b09a size=14

	; KAZU (4) at 0x3b09a
	db "KAZU@"
	db $00 ; data type
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0a7 size=13

	; DWAYNE (5) at 0x3b0a7
	db "DWAYNE@"
	db $00 ; data type
	db 27, KOFFING
	db 28, KOFFING
	db 29, KOFFING
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0b8 size=17

	; HARRIS (6) at 0x3b0b8
	db "HARRIS@"
	db $00 ; data type
	db 34, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b0c3 size=11

	; ZEKE (7) at 0x3b0c3
	db "ZEKE@"
	db $00 ; data type
	db 32, KOFFING
	db 32, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b0ce size=11

	; CHARLES (8) at 0x3b0ce
	db "CHARLES@"
	db $00 ; data type
	db 30, KOFFING
	db 30, CHARMELEON
	db 30, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b0de size=16

	; RILEY (9) at 0x3b0de
	db "RILEY@"
	db $00 ; data type
	db 34, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b0e8 size=10

	; JOEL (10) at 0x3b0e8
	db "JOEL@"
	db $00 ; data type
	db 32, MAGMAR
	db 32, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b0f3 size=11

	; GLENN (11) at 0x3b0f3
	db "GLENN@"
	db $00 ; data type
	db 28, KOFFING
	db 30, MAGMAR
	db 32, WEEZING
	db $ff ; end trainer party mons
	; last_address=0x3b101 size=14
; 0x3b101

BlaineTrainerGroupHeader: ; 0x3b101
	; BLAINE (1) at 0x3b101
	db "BLAINE@"
	db $01 ; data type
	db 45, MAGCARGO, CURSE, SMOG, FLAMETHROWER, ROCK_SLIDE
	db 45, MAGMAR, THUNDERPUNCH, FIRE_PUNCH, SUNNY_DAY, CONFUSE_RAY
	db 50, RAPIDASH, QUICK_ATTACK, FIRE_SPIN, FURY_ATTACK, FIRE_BLAST
	db $ff ; end trainer party mons
	; last_address=0x3b11c size=27
; 0x3b11c

BurglarTrainerGroupHeader: ; 0x3b11c
	; DUNCAN (1) at 0x3b11c
	db "DUNCAN@"
	db $00 ; data type
	db 23, KOFFING
	db 25, MAGMAR
	db 23, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b12b size=15

	; EDDIE (2) at 0x3b12b
	db "EDDIE@"
	db $01 ; data type
	db 26, GROWLITHE, ROAR, EMBER, LEER, TAKE_DOWN
	db 24, KOFFING, TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db $ff ; end trainer party mons
	; last_address=0x3b13f size=20

	; COREY (3) at 0x3b13f
	db "COREY@"
	db $00 ; data type
	db 25, KOFFING
	db 28, MAGMAR
	db 25, KOFFING
	db 30, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b14f size=16
; 0x3b14f

FirebreatherTrainerGroupHeader: ; 0x3b14f
	; OTIS (1) at 0x3b14f
	db "OTIS@"
	db $00 ; data type
	db 29, MAGMAR
	db 32, WEEZING
	db 29, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b15c size=13

	; DICK (2) at 0x3b15c
	db "DICK@"
	db $00 ; data type
	db 17, CHARMELEON
	db $ff ; end trainer party mons
	; last_address=0x3b165 size=9

	; NED (3) at 0x3b165
	db "NED@"
	db $00 ; data type
	db 15, KOFFING
	db 16, GROWLITHE
	db 15, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b171 size=12

	; BURT (4) at 0x3b171
	db "BURT@"
	db $00 ; data type
	db 32, KOFFING
	db 32, SLUGMA
	db $ff ; end trainer party mons
	; last_address=0x3b17c size=11

	; BILL (5) at 0x3b17c
	db "BILL@"
	db $00 ; data type
	db 6, KOFFING
	db 6, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b187 size=11

	; WALT (6) at 0x3b187
	db "WALT@"
	db $00 ; data type
	db 11, MAGMAR
	db 13, MAGMAR
	db $ff ; end trainer party mons
	; last_address=0x3b192 size=11

	; RAY (7) at 0x3b192
	db "RAY@"
	db $00 ; data type
	db 9, VULPIX
	db $ff ; end trainer party mons
	; last_address=0x3b19a size=8

	; LYLE (8) at 0x3b19a
	db "LYLE@"
	db $00 ; data type
	db 28, KOFFING
	db 31, FLAREON
	db 28, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b1a7 size=13
; 0x3b1a7

JugglerTrainerGroupHeader: ; 0x3b1a7
	; IRWIN1 (1) at 0x3b1a7
	db "IRWIN@"
	db $00 ; data type
	db 2, VOLTORB
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x3b1b7 size=16

	; FRITZ (2) at 0x3b1b7
	db "FRITZ@"
	db $00 ; data type
	db 29, MR__MIME
	db 29, MAGMAR
	db 29, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b1c5 size=14

	; HORTON (3) at 0x3b1c5
	db "HORTON@"
	db $00 ; data type
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE
	db 33, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b1d6 size=17

	; IRWIN2 (4) at 0x3b1d6
	db "IRWIN@"
	db $00 ; data type
	db 6, VOLTORB
	db 10, VOLTORB
	db 14, VOLTORB
	db 18, VOLTORB
	db $ff ; end trainer party mons
	; last_address=0x3b1e6 size=16

	; IRWIN3 (5) at 0x3b1e6
	db "IRWIN@"
	db $00 ; data type
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b1f6 size=16

	; IRWIN4 (6) at 0x3b1f6
	db "IRWIN@"
	db $00 ; data type
	db 18, VOLTORB
	db 22, VOLTORB
	db 26, VOLTORB
	db 30, ELECTRODE
	db $ff ; end trainer party mons
	; last_address=0x3b206 size=16
; 0x3b206

BlackbeltTrainerGroupHeader: ; 0x3b206
	; KENJI1 (2) at 0x3b206
	db "KENJI@"
	db $00 ; data type
	db 27, ONIX
	db 30, HITMONLEE
	db 27, ONIX
	db 32, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b216 size=16

	; YOSHI (3) at 0x3b216
	db "YOSHI@"
	db $01 ; data type
	db 27, HITMONLEE, DOUBLE_KICK, MEDITATE, JUMP_KICK, FOCUS_ENERGY
	db $ff ; end trainer party mons
	; last_address=0x3b224 size=14

	; KENJI2 (4) at 0x3b224
	db "KENJI@"
	db $01 ; data type
	db 33, ONIX, BIND, ROCK_THROW, TOXIC, DIG
	db 38, MACHAMP, HEADBUTT, SWAGGER, THUNDERPUNCH, VITAL_THROW
	db 33, STEELIX, EARTHQUAKE, ROCK_THROW, IRON_TAIL, SANDSTORM
	db 36, HITMONLEE, DOUBLE_TEAM, HI_JUMP_KICK, MUD_SLAP, SWIFT
	db $ff ; end trainer party mons
	; last_address=0x3b244 size=32

	; LAO (5) at 0x3b244
	db "LAO@"
	db $01 ; data type
	db 27, HITMONCHAN, COMET_PUNCH, THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH
	db $ff ; end trainer party mons
	; last_address=0x3b250 size=12

	; NOB (6) at 0x3b250
	db "NOB@"
	db $01 ; data type
	db 25, MACHOP, LEER, FOCUS_ENERGY, KARATE_CHOP, SEISMIC_TOSS
	db 25, MACHOKE, LEER, KARATE_CHOP, SEISMIC_TOSS, ROCK_SLIDE
	db $ff ; end trainer party mons
	; last_address=0x3b262 size=18

	; KIYO (7) at 0x3b262
	db "KIYO@"
	db $00 ; data type
	db 34, HITMONLEE
	db 34, HITMONCHAN
	db $ff ; end trainer party mons
	; last_address=0x3b26d size=11

	; LUNG (8) at 0x3b26d
	db "LUNG@"
	db $00 ; data type
	db 23, MANKEY
	db 23, MANKEY
	db 25, PRIMEAPE
	db $ff ; end trainer party mons
	; last_address=0x3b27a size=13

	; KENJI3 (9) at 0x3b27a
	db "KENJI@"
	db $00 ; data type
	db 28, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b284 size=10

	; WAI (10) at 0x3b284
	db "WAI@"
	db $00 ; data type
	db 30, MACHOKE
	db 32, MACHOKE
	db 34, MACHOKE
	db $ff ; end trainer party mons
	; last_address=0x3b290 size=12
; 0x3b290

ExecutiveMTrainerGroupHeader: ; 0x3b290
	; EXECUTIVE1 (1) at 0x3b290
	db "EXECUTIVE@"
	db $01 ; data type
	db 33, HOUNDOUR, EMBER, ROAR, BITE, FAINT_ATTACK
	db 33, KOFFING, TACKLE, SLUDGE, SMOKESCREEN, HAZE
	db 35, HOUNDOOM, EMBER, SMOG, BITE, FAINT_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3b2ae size=30

	; EXECUTIVE2 (2) at 0x3b2ae
	db "EXECUTIVE@"
	db $01 ; data type
	db 36, GOLBAT, LEECH_LIFE, BITE, CONFUSE_RAY, WING_ATTACK
	db $ff ; end trainer party mons
	; last_address=0x3b2c0 size=18

	; EXECUTIVE3 (3) at 0x3b2c0
	db "EXECUTIVE@"
	db $01 ; data type
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 32, WEEZING, TACKLE, EXPLOSION, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SELFDESTRUCT, SLUDGE, SMOKESCREEN
	db 30, KOFFING, TACKLE, SMOG, SLUDGE, SMOKESCREEN
	db $ff ; end trainer party mons
	; last_address=0x3b2f0 size=48

	; EXECUTIVE4 (4) at 0x3b2f0
	db "EXECUTIVE@"
	db $00 ; data type
	db 22, ZUBAT
	db 24, RATICATE
	db 22, KOFFING
	db $ff ; end trainer party mons
	; last_address=0x3b302 size=18
; 0x3b302

PsychicTrainerGroupHeader: ; 0x3b302
	; NATHAN (1) at 0x3b302
	db "NATHAN@"
	db $00 ; data type
	db 26, GIRAFARIG
	db $ff ; end trainer party mons
	; last_address=0x3b30d size=11

	; FRANKLIN (2) at 0x3b30d
	db "FRANKLIN@"
	db $00 ; data type
	db 37, KADABRA
	db $ff ; end trainer party mons
	; last_address=0x3b31a size=13

	; HERMAN (3) at 0x3b31a
	db "HERMAN@"
	db $00 ; data type
	db 30, EXEGGCUTE
	db 30, EXEGGCUTE
	db 30, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x3b329 size=15

	; FIDEL (4) at 0x3b329
	db "FIDEL@"
	db $00 ; data type
	db 34, XATU
	db $ff ; end trainer party mons
	; last_address=0x3b333 size=10

	; GREG (5) at 0x3b333
	db "GREG@"
	db $01 ; data type
	db 17, DROWZEE, HYPNOSIS, DISABLE, DREAM_EATER, 0
	db $ff ; end trainer party mons
	; last_address=0x3b340 size=13

	; NORMAN (6) at 0x3b340
	db "NORMAN@"
	db $01 ; data type
	db 17, SLOWPOKE, TACKLE, GROWL, WATER_GUN, 0
	db 20, SLOWPOKE, CURSE, BODY_SLAM, WATER_GUN, CONFUSION
	db $ff ; end trainer party mons
	; last_address=0x3b355 size=21

	; MARK (7) at 0x3b355
	db "MARK@"
	db $01 ; data type
	db 13, ABRA, TELEPORT, FLASH, 0, 0
	db 13, ABRA, TELEPORT, FLASH, 0, 0
	db 15, KADABRA, TELEPORT, KINESIS, CONFUSION, 0
	db $ff ; end trainer party mons
	; last_address=0x3b36e size=25

	; PHIL (8) at 0x3b36e
	db "PHIL@"
	db $01 ; data type
	db 24, NATU, LEER, NIGHT_SHADE, FUTURE_SIGHT, CONFUSE_RAY
	db 26, KADABRA, DISABLE, PSYBEAM, RECOVER, FUTURE_SIGHT
	db $ff ; end trainer party mons
	; last_address=0x3b381 size=19

	; RICHARD (9) at 0x3b381
	db "RICHARD@"
	db $00 ; data type
	db 36, ESPEON
	db $ff ; end trainer party mons
	; last_address=0x3b38d size=12

	; GILBERT (10) at 0x3b38d
	db "GILBERT@"
	db $00 ; data type
	db 30, STARMIE
	db 30, EXEGGCUTE
	db 34, GIRAFARIG
	db $ff ; end trainer party mons
	; last_address=0x3b39d size=16

	; JARED (11) at 0x3b39d
	db "JARED@"
	db $00 ; data type
	db 32, MR__MIME
	db 32, EXEGGCUTE
	db 35, EXEGGCUTE
	db $ff ; end trainer party mons
	; last_address=0x3b3ab size=14

	; RODNEY (12) at 0x3b3ab
	db "RODNEY@"
	db $00 ; data type
	db 29, DROWZEE
	db 33, HYPNO
	db $ff ; end trainer party mons
	; last_address=0x3b3b8 size=13
; 0x3b3b8

PicnickerTrainerGroupHeader: ; 0x3b3b8
	; LIZ1 (1) at 0x3b3b8
	db "LIZ@"
	db $00 ; data type
	db 9, NIDORAN_F
	db $ff ; end trainer party mons
	; last_address=0x3b3c0 size=8

	; GINA1 (2) at 0x3b3c0
	db "GINA@"
	db $00 ; data type
	db 9, HOPPIP
	db 9, HOPPIP
	db 12, BULBASAUR
	db $ff ; end trainer party mons
	; last_address=0x3b3cd size=13

	; BROOKE (3) at 0x3b3cd
	db "BROOKE@"
	db $01 ; data type
	db 16, PIKACHU, THUNDERSHOCK, GROWL, QUICK_ATTACK, DOUBLE_TEAM
	db $ff ; end trainer party mons
	; last_address=0x3b3dc size=15

	; KIM (4) at 0x3b3dc
	db "KIM@"
	db $00 ; data type
	db 15, VULPIX
	db $ff ; end trainer party mons
	; last_address=0x3b3e4 size=8

	; CINDY (5) at 0x3b3e4
	db "CINDY@"
	db $00 ; data type
	db 36, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b3ee size=10

	; HOPE (6) at 0x3b3ee
	db "HOPE@"
	db $00 ; data type
	db 34, FLAAFFY
	db $ff ; end trainer party mons
	; last_address=0x3b3f7 size=9

	; SHARON (7) at 0x3b3f7
	db "SHARON@"
	db $00 ; data type
	db 31, FURRET
	db 33, RAPIDASH
	db $ff ; end trainer party mons
	; last_address=0x3b404 size=13

	; DEBRA (8) at 0x3b404
	db "DEBRA@"
	db $00 ; data type
	db 33, SEAKING
	db $ff ; end trainer party mons
	; last_address=0x3b40e size=10

	; GINA2 (9) at 0x3b40e
	db "GINA@"
	db $00 ; data type
	db 14, HOPPIP
	db 14, HOPPIP
	db 17, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b41b size=13

	; ERIN1 (10) at 0x3b41b
	db "ERIN@"
	db $00 ; data type
	db 16, PONYTA
	db 16, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3b426 size=11

	; LIZ2 (11) at 0x3b426
	db "LIZ@"
	db $00 ; data type
	db 15, WEEPINBELL
	db 15, NIDORINA
	db $ff ; end trainer party mons
	; last_address=0x3b430 size=10

	; LIZ3 (12) at 0x3b430
	db "LIZ@"
	db $00 ; data type
	db 19, WEEPINBELL
	db 19, NIDORINO
	db 21, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b43c size=12

	; HEIDI (13) at 0x3b43c
	db "HEIDI@"
	db $00 ; data type
	db 32, SKIPLOOM
	db 32, SKIPLOOM
	db $ff ; end trainer party mons
	; last_address=0x3b448 size=12

	; EDNA (14) at 0x3b448
	db "EDNA@"
	db $00 ; data type
	db 30, NIDORINA
	db 34, RAICHU
	db $ff ; end trainer party mons
	; last_address=0x3b453 size=11

	; GINA3 (15) at 0x3b453
	db "GINA@"
	db $00 ; data type
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 29, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b460 size=13

	; TIFFANY1 (16) at 0x3b460
	db "TIFFANY@"
	db $01 ; data type
	db 31, CLEFAIRY, ENCORE, SING, DOUBLESLAP, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b470 size=16

	; TIFFANY2 (17) at 0x3b470
	db "TIFFANY@"
	db $01 ; data type
	db 37, CLEFAIRY, ENCORE, DOUBLESLAP, MINIMIZE, METRONOME
	db $ff ; end trainer party mons
	; last_address=0x3b480 size=16

	; ERIN2 (18) at 0x3b480
	db "ERIN@"
	db $00 ; data type
	db 32, PONYTA
	db 32, PONYTA
	db $ff ; end trainer party mons
	; last_address=0x3b48b size=11

	; TANYA (19) at 0x3b48b
	db "TANYA@"
	db $00 ; data type
	db 37, EXEGGUTOR
	db $ff ; end trainer party mons
	; last_address=0x3b495 size=10

	; TIFFANY3 (20) at 0x3b495
	db "TIFFANY@"
	db $01 ; data type
	db 20, CLEFAIRY, ENCORE, SING, DOUBLESLAP, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b4a5 size=16

	; ERIN3 (21) at 0x3b4a5
	db "ERIN@"
	db $01 ; data type
	db 36, PONYTA, DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db 34, RAICHU, SWIFT, MUD_SLAP, QUICK_ATTACK, THUNDERBOLT
	db 36, PONYTA, DOUBLE_TEAM, STOMP, FIRE_SPIN, SUNNY_DAY
	db $ff ; end trainer party mons
	; last_address=0x3b4be size=25

	; LIZ4 (22) at 0x3b4be
	db "LIZ@"
	db $00 ; data type
	db 24, WEEPINBELL
	db 26, NIDORINO
	db 26, NIDOQUEEN
	db $ff ; end trainer party mons
	; last_address=0x3b4ca size=12

	; LIZ5 (23) at 0x3b4ca
	db "LIZ@"
	db $01 ; data type
	db 30, WEEPINBELL, SLEEP_POWDER, POISONPOWDER, STUN_SPORE, SLUDGE_BOMB
	db 32, NIDOKING, EARTHQUAKE, DOUBLE_KICK, POISON_STING, IRON_TAIL
	db 32, NIDOQUEEN, EARTHQUAKE, DOUBLE_KICK, TAIL_WHIP, BODY_SLAM
	db $ff ; end trainer party mons
	; last_address=0x3b4e2 size=24

	; GINA4 (24) at 0x3b4e2
	db "GINA@"
	db $00 ; data type
	db 30, SKIPLOOM
	db 30, SKIPLOOM
	db 32, IVYSAUR
	db $ff ; end trainer party mons
	; last_address=0x3b4ef size=13

	; GINA5 (25) at 0x3b4ef
	db "GINA@"
	db $01 ; data type
	db 33, JUMPLUFF, STUN_SPORE, SUNNY_DAY, LEECH_SEED, COTTON_SPORE
	db 33, JUMPLUFF, SUNNY_DAY, SLEEP_POWDER, LEECH_SEED, COTTON_SPORE
	db 38, VENUSAUR, SOLARBEAM, RAZOR_LEAF, HEADBUTT, MUD_SLAP
	db $ff ; end trainer party mons
	; last_address=0x3b508 size=25

	; TIFFANY4 (26) at 0x3b508
	db "TIFFANY@"
	db $01 ; data type
	db 43, CLEFAIRY, METRONOME, ENCORE, MOONLIGHT, MINIMIZE
	db $ff ; end trainer party mons
	; last_address=0x3b518 size=16
; 0x3b518

CamperTrainerGroupHeader: ; 0x3b518
	; ROLAND (1) at 0x3b518
	db "ROLAND@"
	db $00 ; data type
	db 9, NIDORAN_M
	db $ff ; end trainer party mons
	; last_address=0x3b523 size=11

	; TODD1 (2) at 0x3b523
	db "TODD@"
	db $00 ; data type
	db 14, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b52c size=9

	; IVAN (3) at 0x3b52c
	db "IVAN@"
	db $00 ; data type
	db 10, DIGLETT
	db 10, ZUBAT
	db 14, DIGLETT
	db $ff ; end trainer party mons
	; last_address=0x3b539 size=13

	; ELLIOT (4) at 0x3b539
	db "ELLIOT@"
	db $00 ; data type
	db 13, SANDSHREW
	db 15, MARILL
	db $ff ; end trainer party mons
	; last_address=0x3b546 size=13

	; BARRY (5) at 0x3b546
	db "BARRY@"
	db $00 ; data type
	db 36, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3b550 size=10

	; LLOYD (6) at 0x3b550
	db "LLOYD@"
	db $00 ; data type
	db 34, NIDOKING
	db $ff ; end trainer party mons
	; last_address=0x3b55a size=10

	; DEAN (7) at 0x3b55a
	db "DEAN@"
	db $00 ; data type
	db 33, GOLDUCK
	db 31, SANDSLASH
	db $ff ; end trainer party mons
	; last_address=0x3b565 size=11

	; SID (8) at 0x3b565
	db "SID@"
	db $00 ; data type
	db 32, DUGTRIO
	db 29, PRIMEAPE
	db 29, POLIWRATH
	db $ff ; end trainer party mons
	; last_address=0x3b571 size=12

	; HARVEY (9) at 0x3b571
	db "HARVEY@"
	db $00 ; data type
	db 15, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3b57c size=11

	; DALE (10) at 0x3b57c
	db "DALE@"
	db $00 ; data type
	db 15, NIDORINO
	db $ff ; end trainer party mons
	; last_address=0x3b585 size=9

	; TED (11) at 0x3b585
	db "TED@"
	db $00 ; data type
	db 17, MANKEY
	db $ff ; end trainer party mons
	; last_address=0x3b58d size=8

	; TODD2 (12) at 0x3b58d
	db "TODD@"
	db $00 ; data type
	db 17, GEODUDE
	db 17, GEODUDE
	db 23, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b59a size=13

	; TODD3 (13) at 0x3b59a
	db "TODD@"
	db $00 ; data type
	db 23, GEODUDE
	db 23, GEODUDE
	db 26, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5a7 size=13

	; THOMAS (14) at 0x3b5a7
	db "THOMAS@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5b8 size=17

	; LEROY (15) at 0x3b5b8
	db "LEROY@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5c8 size=16

	; DAVID (16) at 0x3b5c8
	db "DAVID@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5d8 size=16

	; JOHN (17) at 0x3b5d8
	db "JOHN@"
	db $00 ; data type
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b5e7 size=15

	; JERRY (18) at 0x3b5e7
	db "JERRY@"
	db $00 ; data type
	db 37, SANDSLASH
	db $ff ; end trainer party mons
	; last_address=0x3b5f1 size=10

	; SPENCER (19) at 0x3b5f1
	db "SPENCER@"
	db $00 ; data type
	db 17, SANDSHREW
	db 17, SANDSLASH
	db 19, ZUBAT
	db $ff ; end trainer party mons
	; last_address=0x3b601 size=16

	; TODD4 (20) at 0x3b601
	db "TODD@"
	db $00 ; data type
	db 30, GRAVELER
	db 30, GRAVELER
	db 30, SLUGMA
	db 32, PSYDUCK
	db $ff ; end trainer party mons
	; last_address=0x3b610 size=15

	; TODD5 (21) at 0x3b610
	db "TODD@"
	db $01 ; data type
	db 33, GRAVELER, SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 33, GRAVELER, SELFDESTRUCT, ROCK_THROW, HARDEN, MAGNITUDE
	db 36, MAGCARGO, ROCK_THROW, HARDEN, AMNESIA, FLAMETHROWER
	db 34, GOLDUCK, DISABLE, PSYCHIC_M, SURF, PSYCH_UP
	db $ff ; end trainer party mons
	; last_address=0x3b62f size=31

	; QUENTIN (22) at 0x3b62f
	db "QUENTIN@"
	db $00 ; data type
	db 30, FEAROW
	db 30, PRIMEAPE
	db 30, TAUROS
	db $ff ; end trainer party mons
	; last_address=0x3b63f size=16
; 0x3b63f

ExecutiveFTrainerGroupHeader: ; 0x3b63f
	; EXECUTIVE1 (1) at 0x3b63f
	db "EXECUTIVE@"
	db $01 ; data type
	db 32, ARBOK, WRAP, POISON_STING, BITE, GLARE
	db 32, VILEPLUME, ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 32, MURKROW, PECK, PURSUIT, HAZE, NIGHT_SHADE
	db $ff ; end trainer party mons
	; last_address=0x3b65d size=30

	; EXECUTIVE2 (2) at 0x3b65d
	db "EXECUTIVE@"
	db $01 ; data type
	db 23, ARBOK, WRAP, LEER, POISON_STING, BITE
	db 23, GLOOM, ABSORB, SWEET_SCENT, SLEEP_POWDER, ACID
	db 25, MURKROW, PECK, PURSUIT, HAZE, 0
	db $ff ; end trainer party mons
	; last_address=0x3b67b size=30
; 0x3b67b

SageTrainerGroupHeader: ; 0x3b67b
	; CHOW (1) at 0x3b67b
	db "CHOW@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b688 size=13

	; NICO (2) at 0x3b688
	db "NICO@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b695 size=13

	; JIN (3) at 0x3b695
	db "JIN@"
	db $00 ; data type
	db 6, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b69d size=8

	; TROY (4) at 0x3b69d
	db "TROY@"
	db $00 ; data type
	db 7, BELLSPROUT
	db 7, HOOTHOOT
	db $ff ; end trainer party mons
	; last_address=0x3b6a8 size=11

	; JEFFREY (5) at 0x3b6a8
	db "JEFFREY@"
	db $00 ; data type
	db 22, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b6b4 size=12

	; PING (6) at 0x3b6b4
	db "PING@"
	db $00 ; data type
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db 16, GASTLY
	db $ff ; end trainer party mons
	; last_address=0x3b6c5 size=17

	; EDMOND (7) at 0x3b6c5
	db "EDMOND@"
	db $00 ; data type
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db 3, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b6d4 size=15

	; NEAL (8) at 0x3b6d4
	db "NEAL@"
	db $00 ; data type
	db 6, BELLSPROUT
	db $ff ; end trainer party mons
	; last_address=0x3b6dd size=9

	; LI (9) at 0x3b6dd
	db "LI@"
	db $00 ; data type
	db 7, BELLSPROUT
	db 7, BELLSPROUT
	db 10, HOOTHOOT
	db $ff ; end trainer party mons
	; last_address=0x3b6e8 size=11

	; GAKU (10) at 0x3b6e8
	db "GAKU@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b6f3 size=11

	; MASA (11) at 0x3b6f3
	db "MASA@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3b6fe size=11

	; KOJI (12) at 0x3b6fe
	db "KOJI@"
	db $00 ; data type
	db 32, NOCTOWL
	db 32, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x3b709 size=11
; 0x3b709

MediumTrainerGroupHeader: ; 0x3b709
	; MARTHA (1) at 0x3b709
	db "MARTHA@"
	db $00 ; data type
	db 18, GASTLY
	db 20, HAUNTER
	db 20, GASTLY
	db $ff ; end trainer party mons
	; last_address=0x3b718 size=15

	; GRACE (2) at 0x3b718
	db "GRACE@"
	db $00 ; data type
	db 20, HAUNTER
	db 20, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b724 size=12

	; BETHANY (3) at 0x3b724
	db "BETHANY@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b730 size=12

	; MARGRET (4) at 0x3b730
	db "MARGRET@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b73c size=12

	; ETHEL (5) at 0x3b73c
	db "ETHEL@"
	db $00 ; data type
	db 25, HAUNTER
	db $ff ; end trainer party mons
	; last_address=0x3b746 size=10

	; REBECCA (6) at 0x3b746
	db "REBECCA@"
	db $00 ; data type
	db 35, DROWZEE
	db 35, HYPNO
	db $ff ; end trainer party mons
	; last_address=0x3b754 size=14

	; DORIS (7) at 0x3b754
	db "DORIS@"
	db $00 ; data type
	db 34, SLOWPOKE
	db 36, SLOWBRO
	db $ff ; end trainer party mons
	; last_address=0x3b760 size=12
; 0x3b760

BoarderTrainerGroupHeader: ; 0x3b760
	; RONALD (1) at 0x3b760
	db "RONALD@"
	db $00 ; data type
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL
	db $ff ; end trainer party mons
	; last_address=0x3b76f size=15

	; BRAD (2) at 0x3b76f
	db "BRAD@"
	db $00 ; data type
	db 26, SWINUB
	db 26, SWINUB
	db $ff ; end trainer party mons
	; last_address=0x3b77a size=11

	; DOUGLAS (3) at 0x3b77a
	db "DOUGLAS@"
	db $00 ; data type
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER
	db $ff ; end trainer party mons
	; last_address=0x3b78a size=16
; 0x3b78a

PokefanMTrainerGroupHeader: ; 0x3b78a
	; WILLIAM (1) at 0x3b78a
	db "WILLIAM@"
	db $02 ; data type
	db 14, RAICHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b797 size=13

	; DEREK1 (2) at 0x3b797
	db "DEREK@"
	db $02 ; data type
	db 17, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7a2 size=11

	; ROBERT (3) at 0x3b7a2
	db "ROBERT@"
	db $02 ; data type
	db 33, QUAGSIRE, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7ae size=12

	; JOSHUA (4) at 0x3b7ae
	db "JOSHUA@"
	db $02 ; data type
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db 23, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7c9 size=27

	; CARTER (5) at 0x3b7c9
	db "CARTER@"
	db $02 ; data type
	db 29, BULBASAUR, BERRY
	db 29, CHARMANDER, BERRY
	db 29, SQUIRTLE, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7db size=18

	; TREVOR (6) at 0x3b7db
	db "TREVOR@"
	db $02 ; data type
	db 33, PSYDUCK, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7e7 size=12

	; BRANDON (7) at 0x3b7e7
	db "BRANDON@"
	db $02 ; data type
	db 13, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b7f4 size=13

	; JEREMY (8) at 0x3b7f4
	db "JEREMY@"
	db $02 ; data type
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b806 size=18

	; COLIN (9) at 0x3b806
	db "COLIN@"
	db $02 ; data type
	db 32, DELIBIRD, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b811 size=11

	; DEREK2 (10) at 0x3b811
	db "DEREK@"
	db $02 ; data type
	db 19, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b81c size=11

	; DEREK3 (11) at 0x3b81c
	db "DEREK@"
	db $02 ; data type
	db 36, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b827 size=11

	; ALEX (12) at 0x3b827
	db "ALEX@"
	db $02 ; data type
	db 29, NIDOKING, BERRY
	db 29, SLOWKING, BERRY
	db 29, SEAKING, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b837 size=16

	; REX (13) at 0x3b837
	db "REX@"
	db $02 ; data type
	db 35, PHANPY, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b840 size=9

	; ALLAN (14) at 0x3b840
	db "ALLAN@"
	db $02 ; data type
	db 35, TEDDIURSA, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b84b size=11
; 0x3b84b

KimonoGirlTrainerGroupHeader: ; 0x3b84b
	; NAOKO1 (2) at 0x3b84b
	db "NAOKO@"
	db $00 ; data type
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM
	db $ff ; end trainer party mons
	; last_address=0x3b859 size=14

	; NAOKO2 (3) at 0x3b859
	db "NAOKO@"
	db $00 ; data type
	db 17, FLAREON
	db $ff ; end trainer party mons
	; last_address=0x3b863 size=10

	; SAYO (4) at 0x3b863
	db "SAYO@"
	db $00 ; data type
	db 17, ESPEON
	db $ff ; end trainer party mons
	; last_address=0x3b86c size=9

	; ZUKI (5) at 0x3b86c
	db "ZUKI@"
	db $00 ; data type
	db 17, UMBREON
	db $ff ; end trainer party mons
	; last_address=0x3b875 size=9

	; KUNI (6) at 0x3b875
	db "KUNI@"
	db $00 ; data type
	db 17, VAPOREON
	db $ff ; end trainer party mons
	; last_address=0x3b87e size=9

	; MIKI (7) at 0x3b87e
	db "MIKI@"
	db $00 ; data type
	db 17, JOLTEON
	db $ff ; end trainer party mons
	; last_address=0x3b887 size=9
; 0x3b887

TwinsTrainerGroupHeader: ; 0x3b887
	; AMYANDMAY1 (1) at 0x3b887
	db "AMY & MAY@"
	db $00 ; data type
	db 10, SPINARAK
	db 10, LEDYBA
	db $ff ; end trainer party mons
	; last_address=0x3b897 size=16

	; ANNANDANNE1 (2) at 0x3b897
	db "ANN & ANNE@"
	db $01 ; data type
	db 16, CLEFAIRY, GROWL, ENCORE, DOUBLESLAP, METRONOME
	db 16, JIGGLYPUFF, SING, DEFENSE_CURL, POUND, DISABLE
	db $ff ; end trainer party mons
	; last_address=0x3b8b0 size=25

	; ANNANDANNE2 (3) at 0x3b8b0
	db "ANN & ANNE@"
	db $01 ; data type
	db 16, JIGGLYPUFF, SING, DEFENSE_CURL, POUND, DISABLE
	db 16, CLEFAIRY, GROWL, ENCORE, DOUBLESLAP, METRONOME
	db $ff ; end trainer party mons
	; last_address=0x3b8c9 size=25

	; AMYANDMAY2 (4) at 0x3b8c9
	db "AMY & MAY@"
	db $00 ; data type
	db 10, LEDYBA
	db 10, SPINARAK
	db $ff ; end trainer party mons
	; last_address=0x3b8d9 size=16

	; JOANDZOE1 (5) at 0x3b8d9
	db "JO & ZOE@"
	db $00 ; data type
	db 35, VICTREEBEL
	db 35, VILEPLUME
	db $ff ; end trainer party mons
	; last_address=0x3b8e8 size=15

	; JOANDZOE2 (6) at 0x3b8e8
	db "JO & ZOE@"
	db $00 ; data type
	db 35, VILEPLUME
	db 35, VICTREEBEL
	db $ff ; end trainer party mons
	; last_address=0x3b8f7 size=15

	; MEGANDPEG1 (7) at 0x3b8f7
	db "MEG & PEG@"
	db $00 ; data type
	db 31, TEDDIURSA
	db 31, PHANPY
	db $ff ; end trainer party mons
	; last_address=0x3b907 size=16

	; MEGANDPEG2 (8) at 0x3b907
	db "MEG & PEG@"
	db $00 ; data type
	db 31, PHANPY
	db 31, TEDDIURSA
	db $ff ; end trainer party mons
	; last_address=0x3b917 size=16

	; LEAANDPIA1 (9) at 0x3b917
	db "LEA & PIA@"
	db $01 ; data type
	db 35, DRATINI, THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db 35, DRATINI, THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db $ff ; end trainer party mons
	; last_address=0x3b92f size=24

	; LEAANDPIA2 (10) at 0x3b92f
	db "LEA & PIA@"
	db $01 ; data type
	db 38, DRATINI, THUNDER_WAVE, TWISTER, ICE_BEAM, HEADBUTT
	db 38, DRATINI, THUNDER_WAVE, TWISTER, FLAMETHROWER, HEADBUTT
	db $ff ; end trainer party mons
	; last_address=0x3b947 size=24
; 0x3b947

PokefanFTrainerGroupHeader: ; 0x3b947
	; BEVERLY1 (1) at 0x3b947
	db "BEVERLY@"
	db $02 ; data type
	db 14, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b954 size=13

	; RUTH (2) at 0x3b954
	db "RUTH@"
	db $02 ; data type
	db 17, PIKACHU, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b95e size=10

	; BEVERLY2 (3) at 0x3b95e
	db "BEVERLY@"
	db $02 ; data type
	db 18, SNUBBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b96b size=13

	; BEVERLY3 (4) at 0x3b96b
	db "BEVERLY@"
	db $02 ; data type
	db 30, GRANBULL, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b978 size=13

	; GEORGIA (5) at 0x3b978
	db "GEORGIA@"
	db $02 ; data type
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 28, FURRET, BERRY
	db 23, SENTRET, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b991 size=25

	; JAIME (6) at 0x3b991
	db "JAIME@"
	db $02 ; data type
	db 16, MEOWTH, BERRY
	db $ff ; end trainer party mons
	; last_address=0x3b99c size=11
; 0x3b99c

RedTrainerGroupHeader: ; 0x3b99c
	; RED (1) at 0x3b99c
	db "RED@"
	db $01 ; data type
	db 81, PIKACHU, CHARM, QUICK_ATTACK, THUNDERBOLT, THUNDER
	db 73, ESPEON, MUD_SLAP, REFLECT, SWIFT, PSYCHIC_M
	db 75, SNORLAX, AMNESIA, SNORE, REST, BODY_SLAM
	db 77, VENUSAUR, SUNNY_DAY, GIGA_DRAIN, SYNTHESIS, SOLARBEAM
	db 77, CHARIZARD, FLAMETHROWER, WING_ATTACK, SLASH, FIRE_SPIN
	db 77, BLASTOISE, RAIN_DANCE, SURF, BLIZZARD, WHIRLPOOL
	db $ff ; end trainer party mons
	; last_address=0x3b9c6 size=42
; 0x3b9c6

BlueTrainerGroupHeader: ; 0x3b9c6
	; BLUE (1) at 0x3b9c6
	db "BLUE@"
	db $01 ; data type
	db 56, PIDGEOT, QUICK_ATTACK, WHIRLWIND, WING_ATTACK, MIRROR_MOVE
	db 54, ALAKAZAM, DISABLE, RECOVER, PSYCHIC_M, REFLECT
	db 56, RHYDON, FURY_ATTACK, SANDSTORM, ROCK_SLIDE, EARTHQUAKE
	db 58, GYARADOS, TWISTER, HYDRO_PUMP, RAIN_DANCE, HYPER_BEAM
	db 58, EXEGGUTOR, SUNNY_DAY, LEECH_SEED, EGG_BOMB, SOLARBEAM
	db 58, ARCANINE, ROAR, SWIFT, FLAMETHROWER, EXTREMESPEED
	db $ff ; end trainer party mons
	; last_address=0x3b9f1 size=43
; 0x3b9f1

OfficerTrainerGroupHeader: ; 0x3b9f1
	; KEITH (1) at 0x3b9f1
	db "KEITH@"
	db $00 ; data type
	db 17, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3b9fb size=10

	; DIRK (2) at 0x3b9fb
	db "DIRK@"
	db $00 ; data type
	db 14, GROWLITHE
	db 14, GROWLITHE
	db $ff ; end trainer party mons
	; last_address=0x3ba06 size=11
; 0x3ba06

GruntFTrainerGroupHeader: ; 0x3ba06
	; GRUNT1 (1) at 0x3ba06
	db "GRUNT@"
	db $00 ; data type
	db 9, ZUBAT
	db 11, EKANS
	db $ff ; end trainer party mons
	; last_address=0x3ba12 size=12

	; GRUNT2 (2) at 0x3ba12
	db "GRUNT@"
	db $00 ; data type
	db 26, ARBOK
	db $ff ; end trainer party mons
	; last_address=0x3ba1c size=10

	; GRUNT3 (3) at 0x3ba1c
	db "GRUNT@"
	db $00 ; data type
	db 25, GLOOM
	db 25, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3ba28 size=12

	; GRUNT4 (4) at 0x3ba28
	db "GRUNT@"
	db $00 ; data type
	db 21, EKANS
	db 23, ODDISH
	db 21, EKANS
	db 24, GLOOM
	db $ff ; end trainer party mons
	; last_address=0x3ba38 size=16

	; GRUNT5 (5) at 0x3ba38
	db "GRUNT@"
	db $01 ; data type
	db 18, EKANS, WRAP, LEER, POISON_STING, BITE
	db 18, GLOOM, ABSORB, SWEET_SCENT, STUN_SPORE, SLEEP_POWDER
	db $ff ; end trainer party mons
	; last_address=0x3ba4c size=20
; 0x3ba4c

MysticalmanTrainerGroupHeader: ; 0x3ba4c
	; EUSINE (1) at 0x3ba4c
	db "EUSINE@"
	db $01 ; data type
	db 23, DROWZEE, DREAM_EATER, HYPNOSIS, DISABLE, CONFUSION
	db 23, HAUNTER, LICK, HYPNOSIS, MEAN_LOOK, CURSE
	db 25, ELECTRODE, SCREECH, SONICBOOM, THUNDER, ROLLOUT
	db $ff ; end trainer party mons
	; last_address=0x3ba67 size=27
; 0x3ba67

INCBIN "baserom.gbc",$3ba67,$599

SECTION "bankF",DATA,BANK[$F]

INCBIN "baserom.gbc",$3C000,$40000 - $3C000

SECTION "bank10",DATA,BANK[$10]

INCBIN "baserom.gbc",$40000,$1afb

Moves: ; 0x41afb
; characteristics of each move
; animation, effect, power, type, accuracy, PP, effect chance
	db POUND,$00,40,NORMAL,$ff,35,$00
Move1:
	db KARATE_CHOP,$00,50,FIGHTING,$ff,25,$00
	db DOUBLESLAP,$1d,15,NORMAL,$d8,10,$00
	db COMET_PUNCH,$1d,18,NORMAL,$d8,15,$00
	db MEGA_PUNCH,$00,80,NORMAL,$d8,20,$00
	db PAY_DAY,$22,40,NORMAL,$ff,20,$00
	db FIRE_PUNCH,$04,75,FIRE,$ff,15,$19
	db ICE_PUNCH,$05,75,ICE,$ff,15,$19
	db THUNDERPUNCH,$06,75,ELECTRIC,$ff,15,$19
	db SCRATCH,$00,40,NORMAL,$ff,35,$00
	db VICEGRIP,$00,55,NORMAL,$ff,30,$00
	db GUILLOTINE,$26,0,NORMAL,$4c,5,$00
	db RAZOR_WIND,$27,80,NORMAL,$bf,10,$00
	db SWORDS_DANCE,$32,0,NORMAL,$ff,30,$00
	db CUT,$00,50,NORMAL,$f2,30,$00
	db GUST,$95,40,FLYING,$ff,35,$00
	db WING_ATTACK,$00,60,FLYING,$ff,35,$00
	db WHIRLWIND,$1c,0,NORMAL,$ff,20,$00
	db FLY,$9b,70,FLYING,$f2,15,$00
	db BIND,$2a,15,NORMAL,$bf,20,$00
	db SLAM,$00,80,NORMAL,$bf,20,$00
	db VINE_WHIP,$00,35,GRASS,$ff,10,$00
	db STOMP,$96,65,NORMAL,$ff,20,$4c
	db DOUBLE_KICK,$2c,30,FIGHTING,$ff,30,$00
	db MEGA_KICK,$00,120,NORMAL,$bf,5,$00
	db JUMP_KICK,$2d,70,FIGHTING,$f2,25,$00
	db ROLLING_KICK,$1f,60,FIGHTING,$d8,15,$4c
	db SAND_ATTACK,$17,0,GROUND,$ff,15,$00
	db HEADBUTT,$1f,70,NORMAL,$ff,15,$4c
	db HORN_ATTACK,$00,65,NORMAL,$ff,25,$00
	db FURY_ATTACK,$1d,15,NORMAL,$d8,20,$00
	db HORN_DRILL,$26,1,NORMAL,$4c,5,$00
	db TACKLE,$00,35,NORMAL,$f2,35,$00
	db BODY_SLAM,$06,85,NORMAL,$ff,15,$4c
	db WRAP,$2a,15,NORMAL,$d8,20,$00
	db TAKE_DOWN,$30,90,NORMAL,$d8,20,$00
	db THRASH,$1b,90,NORMAL,$ff,20,$00
	db DOUBLE_EDGE,$30,120,NORMAL,$ff,15,$00
	db TAIL_WHIP,$13,0,NORMAL,$ff,30,$00
	db POISON_STING,$02,15,POISON,$ff,35,$4c
	db TWINEEDLE,$4d,25,BUG,$ff,20,$33
	db PIN_MISSILE,$1d,14,BUG,$d8,20,$00
	db LEER,$13,0,NORMAL,$ff,30,$00
	db BITE,$1f,60,DARK,$ff,25,$4c
	db GROWL,$12,0,NORMAL,$ff,40,$00
	db ROAR,$1c,0,NORMAL,$ff,20,$00
	db SING,$01,0,NORMAL,$8c,15,$00
	db SUPERSONIC,$31,0,NORMAL,$8c,20,$00
	db SONICBOOM,$29,20,NORMAL,$e5,20,$00
	db DISABLE,$56,0,NORMAL,$8c,20,$00
	db ACID,$45,40,POISON,$ff,30,$19
	db EMBER,$04,40,FIRE,$ff,25,$19
	db FLAMETHROWER,$04,95,FIRE,$ff,15,$19
	db MIST,$2e,0,ICE,$ff,30,$00
	db WATER_GUN,$00,40,WATER,$ff,25,$00
	db HYDRO_PUMP,$00,120,WATER,$cc,5,$00
	db SURF,$00,95,WATER,$ff,15,$00
	db ICE_BEAM,$05,95,ICE,$ff,10,$19
	db BLIZZARD,$05,120,ICE,$b2,5,$19
	db PSYBEAM,$4c,65,PSYCHIC,$ff,20,$19
	db BUBBLEBEAM,$46,65,WATER,$ff,20,$19
	db AURORA_BEAM,$44,65,ICE,$ff,20,$19
	db HYPER_BEAM,$50,150,NORMAL,$e5,5,$00
	db PECK,$00,35,FLYING,$ff,35,$00
	db DRILL_PECK,$00,80,FLYING,$ff,20,$00
	db SUBMISSION,$30,80,FIGHTING,$cc,25,$00
	db LOW_KICK,$1f,50,FIGHTING,$e5,20,$4c
	db COUNTER,$59,1,FIGHTING,$ff,20,$00
	db SEISMIC_TOSS,$57,1,FIGHTING,$ff,20,$00
	db STRENGTH,$00,80,NORMAL,$ff,15,$00
	db ABSORB,$03,20,GRASS,$ff,20,$00
	db MEGA_DRAIN,$03,40,GRASS,$ff,10,$00
	db LEECH_SEED,$54,0,GRASS,$e5,10,$00
	db GROWTH,$0d,0,NORMAL,$ff,40,$00
	db RAZOR_LEAF,$00,55,GRASS,$f2,25,$00
	db SOLARBEAM,$97,120,GRASS,$ff,10,$00
	db POISONPOWDER,$42,0,POISON,$bf,35,$00
	db STUN_SPORE,$43,0,GRASS,$bf,30,$00
	db SLEEP_POWDER,$01,0,GRASS,$bf,15,$00
	db PETAL_DANCE,$1b,70,GRASS,$ff,20,$00
	db STRING_SHOT,$14,0,BUG,$f2,40,$00
	db DRAGON_RAGE,$29,40,DRAGON,$ff,10,$00
	db FIRE_SPIN,$2a,15,FIRE,$b2,15,$00
	db THUNDERSHOCK,$06,40,ELECTRIC,$ff,30,$19
	db THUNDERBOLT,$06,95,ELECTRIC,$ff,15,$19
	db THUNDER_WAVE,$43,0,ELECTRIC,$ff,20,$00
	db THUNDER,$98,120,ELECTRIC,$b2,10,$4c
	db ROCK_THROW,$00,50,ROCK,$e5,15,$00
	db EARTHQUAKE,$93,100,GROUND,$ff,10,$00
	db FISSURE,$26,1,GROUND,$4c,5,$00
	db DIG,$9b,60,GROUND,$ff,10,$00
	db TOXIC,$21,0,POISON,$d8,10,$00
	db CONFUSION,$4c,50,PSYCHIC,$ff,25,$19
	db PSYCHIC_M,$48,90,PSYCHIC,$ff,10,$19
	db HYPNOSIS,$01,0,PSYCHIC,$99,20,$00
	db MEDITATE,$0a,0,PSYCHIC,$ff,40,$00
	db AGILITY,$34,0,PSYCHIC,$ff,30,$00
	db QUICK_ATTACK,$67,40,NORMAL,$ff,30,$00
	db RAGE,$51,20,NORMAL,$ff,20,$00
	db TELEPORT,$99,0,PSYCHIC,$ff,20,$00
	db NIGHT_SHADE,$57,1,GHOST,$ff,15,$00
	db MIMIC,$52,0,NORMAL,$ff,10,$00
	db SCREECH,$3b,0,NORMAL,$d8,40,$00
	db DOUBLE_TEAM,$10,0,NORMAL,$ff,15,$00
	db RECOVER,$20,0,NORMAL,$ff,20,$00
	db HARDEN,$0b,0,NORMAL,$ff,30,$00
	db MINIMIZE,$10,0,NORMAL,$ff,20,$00
	db SMOKESCREEN,$17,0,NORMAL,$ff,20,$00
	db CONFUSE_RAY,$31,0,GHOST,$ff,10,$00
	db WITHDRAW,$0b,0,WATER,$ff,40,$00
	db DEFENSE_CURL,$9c,0,NORMAL,$ff,40,$00
	db BARRIER,$33,0,PSYCHIC,$ff,30,$00
	db LIGHT_SCREEN,$23,0,PSYCHIC,$ff,30,$00
	db HAZE,$19,0,ICE,$ff,30,$00
	db REFLECT,$41,0,PSYCHIC,$ff,20,$00
	db FOCUS_ENERGY,$2f,0,NORMAL,$ff,30,$00
	db BIDE,$1a,0,NORMAL,$ff,10,$00
	db METRONOME,$53,0,NORMAL,$ff,10,$00
	db MIRROR_MOVE,$09,0,FLYING,$ff,20,$00
	db SELFDESTRUCT,$07,200,NORMAL,$ff,5,$00
	db EGG_BOMB,$00,100,NORMAL,$bf,10,$00
	db LICK,$06,20,GHOST,$ff,30,$4c
	db SMOG,$02,20,POISON,$b2,20,$66
	db SLUDGE,$02,65,POISON,$ff,20,$4c
	db BONE_CLUB,$1f,65,GROUND,$d8,20,$19
	db FIRE_BLAST,$04,120,FIRE,$d8,5,$19
	db WATERFALL,$00,80,WATER,$ff,15,$00
	db CLAMP,$2a,35,WATER,$bf,10,$00
	db SWIFT,$11,60,NORMAL,$ff,20,$00
	db SKULL_BASH,$91,100,NORMAL,$ff,15,$00
	db SPIKE_CANNON,$1d,20,NORMAL,$ff,15,$00
	db CONSTRICT,$46,10,NORMAL,$ff,35,$19
	db AMNESIA,$36,0,PSYCHIC,$ff,20,$00
	db KINESIS,$17,0,PSYCHIC,$cc,15,$00
	db SOFTBOILED,$20,0,NORMAL,$ff,10,$00
	db HI_JUMP_KICK,$2d,85,FIGHTING,$e5,20,$00
	db GLARE,$43,0,NORMAL,$bf,30,$00
	db DREAM_EATER,$08,100,PSYCHIC,$ff,15,$00
	db POISON_GAS,$42,0,POISON,$8c,40,$00
	db BARRAGE,$1d,15,NORMAL,$d8,20,$00
	db LEECH_LIFE,$03,20,BUG,$ff,15,$00
	db LOVELY_KISS,$01,0,NORMAL,$bf,10,$00
	db SKY_ATTACK,$4b,140,FLYING,$e5,5,$00
	db TRANSFORM,$39,0,NORMAL,$ff,10,$00
	db BUBBLE,$46,20,WATER,$ff,30,$19
	db DIZZY_PUNCH,$4c,70,NORMAL,$ff,10,$33
	db SPORE,$01,0,GRASS,$ff,15,$00
	db FLASH,$17,0,NORMAL,$b2,20,$00
	db PSYWAVE,$58,1,PSYCHIC,$cc,15,$00
	db SPLASH,$55,0,NORMAL,$ff,40,$00
	db ACID_ARMOR,$33,0,POISON,$ff,40,$00
	db CRABHAMMER,$00,90,WATER,$d8,10,$00
	db EXPLOSION,$07,250,NORMAL,$ff,5,$00
	db FURY_SWIPES,$1d,18,NORMAL,$cc,15,$00
	db BONEMERANG,$2c,50,GROUND,$e5,10,$00
	db REST,$20,0,PSYCHIC,$ff,10,$00
	db ROCK_SLIDE,$1f,75,ROCK,$e5,10,$4c
	db HYPER_FANG,$1f,80,NORMAL,$e5,15,$19
	db SHARPEN,$0a,0,NORMAL,$ff,30,$00
	db CONVERSION,$1e,0,NORMAL,$ff,30,$00
	db TRI_ATTACK,$24,80,NORMAL,$ff,10,$33
	db SUPER_FANG,$28,1,NORMAL,$e5,10,$00
	db SLASH,$00,70,NORMAL,$ff,20,$00
	db SUBSTITUTE,$4f,0,NORMAL,$ff,10,$00
	db STRUGGLE,$30,50,NORMAL,$ff,1,$00
	db SKETCH,$5f,0,NORMAL,$ff,1,$00
	db TRIPLE_KICK,$68,10,FIGHTING,$e5,10,$00
	db THIEF,$69,40,DARK,$ff,10,$ff
	db SPIDER_WEB,$6a,0,BUG,$ff,10,$00
	db MIND_READER,$5e,0,NORMAL,$ff,5,$00
	db NIGHTMARE,$6b,0,GHOST,$ff,15,$00
	db FLAME_WHEEL,$6c,60,FIRE,$ff,25,$19
	db SNORE,$5c,40,NORMAL,$ff,15,$4c
	db CURSE,$6d,0,CURSE_T,$ff,10,$00
	db FLAIL,$63,1,NORMAL,$ff,15,$00
	db CONVERSION2,$5d,0,NORMAL,$ff,30,$00
	db AEROBLAST,$00,100,FLYING,$f2,5,$00
	db COTTON_SPORE,$3c,0,GRASS,$d8,40,$00
	db REVERSAL,$63,1,FIGHTING,$ff,15,$00
	db SPITE,$64,0,GHOST,$ff,10,$00
	db POWDER_SNOW,$05,40,ICE,$ff,25,$19
	db PROTECT,$6f,0,NORMAL,$ff,10,$00
	db MACH_PUNCH,$67,40,FIGHTING,$ff,30,$00
	db SCARY_FACE,$3c,0,NORMAL,$e5,10,$00
	db FAINT_ATTACK,$11,60,DARK,$ff,20,$00
	db SWEET_KISS,$31,0,NORMAL,$bf,10,$00
	db BELLY_DRUM,$8e,0,NORMAL,$ff,10,$00
	db SLUDGE_BOMB,$02,90,POISON,$ff,10,$4c
	db MUD_SLAP,$49,20,GROUND,$ff,10,$ff
	db OCTAZOOKA,$49,65,WATER,$d8,10,$7f
	db SPIKES,$70,0,GROUND,$ff,20,$00
	db ZAP_CANNON,$06,100,ELECTRIC,$7f,5,$ff
	db FORESIGHT,$71,0,NORMAL,$ff,40,$00
	db DESTINY_BOND,$62,0,GHOST,$ff,5,$00
	db PERISH_SONG,$72,0,NORMAL,$ff,5,$00
	db ICY_WIND,$46,55,ICE,$f2,15,$ff
	db DETECT,$6f,0,FIGHTING,$ff,5,$00
	db BONE_RUSH,$1d,25,GROUND,$cc,10,$00
	db LOCK_ON,$5e,0,NORMAL,$ff,5,$00
	db OUTRAGE,$1b,90,DRAGON,$ff,15,$00
	db SANDSTORM,$73,0,ROCK,$ff,10,$00
	db GIGA_DRAIN,$03,60,GRASS,$ff,5,$00
	db ENDURE,$74,0,NORMAL,$ff,10,$00
	db CHARM,$3a,0,NORMAL,$ff,20,$00
	db ROLLOUT,$75,30,ROCK,$e5,20,$00
	db FALSE_SWIPE,$65,40,NORMAL,$ff,40,$00
	db SWAGGER,$76,0,NORMAL,$e5,15,$ff
	db MILK_DRINK,$20,0,NORMAL,$ff,10,$00
	db SPARK,$06,65,ELECTRIC,$ff,20,$4c
	db FURY_CUTTER,$77,10,BUG,$f2,20,$00
	db STEEL_WING,$8a,70,STEEL,$e5,25,$19
	db MEAN_LOOK,$6a,0,NORMAL,$ff,5,$00
	db ATTRACT,$78,0,NORMAL,$ff,15,$00
	db SLEEP_TALK,$61,0,NORMAL,$ff,10,$00
	db HEAL_BELL,$66,0,NORMAL,$ff,5,$00
	db RETURN,$79,1,NORMAL,$ff,20,$00
	db PRESENT,$7a,1,NORMAL,$e5,15,$00
	db FRUSTRATION,$7b,1,NORMAL,$ff,20,$00
	db SAFEGUARD,$7c,0,NORMAL,$ff,25,$00
	db PAIN_SPLIT,$5b,0,NORMAL,$ff,20,$00
	db SACRED_FIRE,$7d,100,FIRE,$f2,5,$7f
	db MAGNITUDE,$7e,1,GROUND,$ff,30,$00
	db DYNAMICPUNCH,$4c,100,FIGHTING,$7f,5,$ff
	db MEGAHORN,$00,120,BUG,$d8,10,$00
	db DRAGONBREATH,$06,60,DRAGON,$ff,20,$4c
	db BATON_PASS,$7f,0,NORMAL,$ff,40,$00
	db ENCORE,$5a,0,NORMAL,$ff,5,$00
	db PURSUIT,$80,40,DARK,$ff,20,$00
	db RAPID_SPIN,$81,20,NORMAL,$ff,40,$00
	db SWEET_SCENT,$18,0,NORMAL,$ff,20,$00
	db IRON_TAIL,$45,100,STEEL,$bf,15,$4c
	db METAL_CLAW,$8b,50,STEEL,$f2,35,$19
	db VITAL_THROW,$11,70,FIGHTING,$ff,10,$00
	db MORNING_SUN,$84,0,NORMAL,$ff,5,$00
	db SYNTHESIS,$85,0,GRASS,$ff,5,$00
	db MOONLIGHT,$86,0,NORMAL,$ff,5,$00
	db HIDDEN_POWER,$87,1,NORMAL,$ff,15,$00
	db CROSS_CHOP,$00,100,FIGHTING,$cc,5,$00
	db TWISTER,$92,40,DRAGON,$ff,20,$33
	db RAIN_DANCE,$88,0,WATER,$e5,5,$00
	db SUNNY_DAY,$89,0,FIRE,$e5,5,$00
	db CRUNCH,$48,80,DARK,$ff,15,$33
	db MIRROR_COAT,$90,1,PSYCHIC,$ff,20,$00
	db PSYCH_UP,$8f,0,NORMAL,$ff,10,$00
	db EXTREMESPEED,$67,80,NORMAL,$ff,5,$00
	db ANCIENTPOWER,$8c,60,ROCK,$ff,5,$19
	db SHADOW_BALL,$48,80,GHOST,$ff,15,$33
	db FUTURE_SIGHT,$94,80,PSYCHIC,$e5,15,$00
	db ROCK_SMASH,$45,20,FIGHTING,$ff,15,$7f
	db WHIRLPOOL,$2a,15,WATER,$b2,15,$00
	db BEAT_UP,$9a,10,DARK,$ff,10,$00

INCBIN "baserom.gbc",$421d8,$44000-$421d8

SECTION "bank11",DATA,BANK[$11]

INCBIN "baserom.gbc",$44000,$48000 - $44000

SECTION "bank12",DATA,BANK[$12]

INCBIN "baserom.gbc",$48000,$4C000 - $48000

SECTION "bank13",DATA,BANK[$13]

INCBIN "baserom.gbc",$4C000,$50000 - $4C000

SECTION "bank14",DATA,BANK[$14]

INCBIN "baserom.gbc",$50000,$3384

	db "BULBASAUR@"
	db "IVYSAUR@@@"
	db "VENUSAUR@@"
	db "CHARMANDER"
	db "CHARMELEON"
	db "CHARIZARD@"
	db "SQUIRTLE@@"
	db "WARTORTLE@"
	db "BLASTOISE@"
	db "CATERPIE@@"
	db "METAPOD@@@"
	db "BUTTERFREE"
	db "WEEDLE@@@@"
	db "KAKUNA@@@@"
	db "BEEDRILL@@"
	db "PIDGEY@@@@"
	db "PIDGEOTTO@"
	db "PIDGEOT@@@"
	db "RATTATA@@@"
	db "RATICATE@@"
	db "SPEAROW@@@"
	db "FEAROW@@@@"
	db "EKANS@@@@@"
	db "ARBOK@@@@@"
	db "PIKACHU@@@"
	db "RAICHU@@@@"
	db "SANDSHREW@"
	db "SANDSLASH@"
	db "NIDORAN♀@@"
	db "NIDORINA@@"
	db "NIDOQUEEN@"
	db "NIDORAN♂@@"
	db "NIDORINO@@"
	db "NIDOKING@@"
	db "CLEFAIRY@@"
	db "CLEFABLE@@"
	db "VULPIX@@@@"
	db "NINETALES@"
	db "JIGGLYPUFF"
	db "WIGGLYTUFF"
	db "ZUBAT@@@@@"
	db "GOLBAT@@@@"
	db "ODDISH@@@@"
	db "GLOOM@@@@@"
	db "VILEPLUME@"
	db "PARAS@@@@@"
	db "PARASECT@@"
	db "VENONAT@@@"
	db "VENOMOTH@@"
	db "DIGLETT@@@"
	db "DUGTRIO@@@"
	db "MEOWTH@@@@"
	db "PERSIAN@@@"
	db "PSYDUCK@@@"
	db "GOLDUCK@@@"
	db "MANKEY@@@@"
	db "PRIMEAPE@@"
	db "GROWLITHE@"
	db "ARCANINE@@"
	db "POLIWAG@@@"
	db "POLIWHIRL@"
	db "POLIWRATH@"
	db "ABRA@@@@@@"
	db "KADABRA@@@"
	db "ALAKAZAM@@"
	db "MACHOP@@@@"
	db "MACHOKE@@@"
	db "MACHAMP@@@"
	db "BELLSPROUT"
	db "WEEPINBELL"
	db "VICTREEBEL"
	db "TENTACOOL@"
	db "TENTACRUEL"
	db "GEODUDE@@@"
	db "GRAVELER@@"
	db "GOLEM@@@@@"
	db "PONYTA@@@@"
	db "RAPIDASH@@"
	db "SLOWPOKE@@"
	db "SLOWBRO@@@"
	db "MAGNEMITE@"
	db "MAGNETON@@"
	db "FARFETCH'D"
	db "DODUO@@@@@"
	db "DODRIO@@@@"
	db "SEEL@@@@@@"
	db "DEWGONG@@@"
	db "GRIMER@@@@"
	db "MUK@@@@@@@"
	db "SHELLDER@@"
	db "CLOYSTER@@"
	db "GASTLY@@@@"
	db "HAUNTER@@@"
	db "GENGAR@@@@"
	db "ONIX@@@@@@"
	db "DROWZEE@@@"
	db "HYPNO@@@@@"
	db "KRABBY@@@@"
	db "KINGLER@@@"
	db "VOLTORB@@@"
	db "ELECTRODE@"
	db "EXEGGCUTE@"
	db "EXEGGUTOR@"
	db "CUBONE@@@@"
	db "MAROWAK@@@"
	db "HITMONLEE@"
	db "HITMONCHAN"
	db "LICKITUNG@"
	db "KOFFING@@@"
	db "WEEZING@@@"
	db "RHYHORN@@@"
	db "RHYDON@@@@"
	db "CHANSEY@@@"
	db "TANGELA@@@"
	db "KANGASKHAN"
	db "HORSEA@@@@"
	db "SEADRA@@@@"
	db "GOLDEEN@@@"
	db "SEAKING@@@"
	db "STARYU@@@@"
	db "STARMIE@@@"
	db "MR.MIME@@@"
	db "SCYTHER@@@"
	db "JYNX@@@@@@"
	db "ELECTABUZZ"
	db "MAGMAR@@@@"
	db "PINSIR@@@@"
	db "TAUROS@@@@"
	db "MAGIKARP@@"
	db "GYARADOS@@"
	db "LAPRAS@@@@"
	db "DITTO@@@@@"
	db "EEVEE@@@@@"
	db "VAPOREON@@"
	db "JOLTEON@@@"
	db "FLAREON@@@"
	db "PORYGON@@@"
	db "OMANYTE@@@"
	db "OMASTAR@@@"
	db "KABUTO@@@@"
	db "KABUTOPS@@"
	db "AERODACTYL"
	db "SNORLAX@@@"
	db "ARTICUNO@@"
	db "ZAPDOS@@@@"
	db "MOLTRES@@@"
	db "DRATINI@@@"
	db "DRAGONAIR@"
	db "DRAGONITE@"
	db "MEWTWO@@@@"
	db "MEW@@@@@@@"
	db "CHIKORITA@"
	db "BAYLEEF@@@"
	db "MEGANIUM@@"
	db "CYNDAQUIL@"
	db "QUILAVA@@@"
	db "TYPHLOSION"
	db "TOTODILE@@"
	db "CROCONAW@@"
	db "FERALIGATR"
	db "SENTRET@@@"
	db "FURRET@@@@"
	db "HOOTHOOT@@"
	db "NOCTOWL@@@"
	db "LEDYBA@@@@"
	db "LEDIAN@@@@"
	db "SPINARAK@@"
	db "ARIADOS@@@"
	db "CROBAT@@@@"
	db "CHINCHOU@@"
	db "LANTURN@@@"
	db "PICHU@@@@@"
	db "CLEFFA@@@@"
	db "IGGLYBUFF@"
	db "TOGEPI@@@@"
	db "TOGETIC@@@"
	db "NATU@@@@@@"
	db "XATU@@@@@@"
	db "MAREEP@@@@"
	db "FLAAFFY@@@"
	db "AMPHAROS@@"
	db "BELLOSSOM@"
	db "MARILL@@@@"
	db "AZUMARILL@"
	db "SUDOWOODO@"
	db "POLITOED@@"
	db "HOPPIP@@@@"
	db "SKIPLOOM@@"
	db "JUMPLUFF@@"
	db "AIPOM@@@@@"
	db "SUNKERN@@@"
	db "SUNFLORA@@"
	db "YANMA@@@@@"
	db "WOOPER@@@@"
	db "QUAGSIRE@@"
	db "ESPEON@@@@"
	db "UMBREON@@@"
	db "MURKROW@@@"
	db "SLOWKING@@"
	db "MISDREAVUS"
	db "UNOWN@@@@@"
	db "WOBBUFFET@"
	db "GIRAFARIG@"
	db "PINECO@@@@"
	db "FORRETRESS"
	db "DUNSPARCE@"
	db "GLIGAR@@@@"
	db "STEELIX@@@"
	db "SNUBBULL@@"
	db "GRANBULL@@"
	db "QWILFISH@@"
	db "SCIZOR@@@@"
	db "SHUCKLE@@@"
	db "HERACROSS@"
	db "SNEASEL@@@"
	db "TEDDIURSA@"
	db "URSARING@@"
	db "SLUGMA@@@@"
	db "MAGCARGO@@"
	db "SWINUB@@@@"
	db "PILOSWINE@"
	db "CORSOLA@@@"
	db "REMORAID@@"
	db "OCTILLERY@"
	db "DELIBIRD@@"
	db "MANTINE@@@"
	db "SKARMORY@@"
	db "HOUNDOUR@@"
	db "HOUNDOOM@@"
	db "KINGDRA@@@"
	db "PHANPY@@@@"
	db "DONPHAN@@@"
	db "PORYGON2@@"
	db "STANTLER@@"
	db "SMEARGLE@@"
	db "TYROGUE@@@"
	db "HITMONTOP@"
	db "SMOOCHUM@@"
	db "ELEKID@@@@"
	db "MAGBY@@@@@"
	db "MILTANK@@@"
	db "BLISSEY@@@"
	db "RAIKOU@@@@"
	db "ENTEI@@@@@"
	db "SUICUNE@@@"
	db "LARVITAR@@"
	db "PUPITAR@@@"
	db "TYRANITAR@"
	db "LUGIA@@@@@"
	db "HO-OH@@@@@"
	db "CELEBI@@@@"
	db "?????@@@@@"
	db "EGG@@@@@@@"
	db "?????@@@@@"
	db "?????@@@@@"
	db "?????@@@@@"

INCBIN "baserom.gbc",$53D84,$54000 - $53D84

SECTION "bank15",DATA,BANK[$15]

INCBIN "baserom.gbc",$54000,$58000 - $54000

SECTION "bank16",DATA,BANK[$16]

INCBIN "baserom.gbc",$58000,$5C000 - $58000

SECTION "bank17",DATA,BANK[$17]

INCBIN "baserom.gbc",$5C000,$4000

SECTION "bank18",DATA,BANK[$18]

INCBIN "baserom.gbc",$60000,$4000

SECTION "bank19",DATA,BANK[$19]

INCBIN "baserom.gbc",$64000,$4000

SECTION "bank1A",DATA,BANK[$1A]

INCBIN "baserom.gbc",$68000,$4000

SECTION "bank1B",DATA,BANK[$1B]

INCBIN "baserom.gbc",$6C000,$4000

SECTION "bank1C",DATA,BANK[$1C]

INCBIN "baserom.gbc",$70000,$4000

SECTION "bank1D",DATA,BANK[$1D]

INCBIN "baserom.gbc",$74000,$4000

SECTION "bank1E",DATA,BANK[$1E]

INCBIN "baserom.gbc",$78000,$4000

SECTION "bank1F",DATA,BANK[$1F]

INCBIN "baserom.gbc",$7C000,$4000

SECTION "bank20",DATA,BANK[$20]

INCBIN "baserom.gbc",$80000,$4000

SECTION "bank21",DATA,BANK[$21]

INCBIN "baserom.gbc",$84000,$4000

SECTION "bank22",DATA,BANK[$22]

INCBIN "baserom.gbc",$88000,$3170

SpecialDratini: ; 0x8b170
; if $c2dd is 0 or 1, change the moveset of the last Dratini in the party.
;  0: give it a special moveset with Extremespeed.
;  1: give it the normal moveset of a level 15 Dratini.

	ld a, [$c2dd]
	cp $2
	ret nc
	ld bc, PartyCount
	ld a, [bc]
	ld hl, 0
	call GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PartyMon2 - PartyMon1
.CheckForDratini
; start at the end of the party and search backwards for a Dratini
	ld a, [hl]
	cp DRATINI
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForDratini
	ret

.GiveMoveset
	push hl
	ld a, [$c2dd]
	ld hl, .Movesets
	ld bc, .Moveset1 - .Moveset0
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	push hl
	push de
	ld [de], a ; give the Pokémon the new move

	; get the PP of the new move
	dec a
	ld hl, Moves + 5
	ld bc, Move1 - Moves
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte

	; get the address of the move's PP and update the PP
	ld hl, PartyMon1PP - PartyMon1Moves
	add hl, de
	ld [hl], a

	pop de
	pop hl
	inc de
	inc hl
	jr .GiveMoves

.Movesets
.Moveset0
; Dratini does not normally learn Extremespeed. This is a special gift.
	db WRAP
	db THUNDER_WAVE
	db TWISTER
	db EXTREMESPEED
	db 0
.Moveset1
; This is the normal moveset of a level 15 Dratini
	db WRAP
	db LEER
	db THUNDER_WAVE
	db TWISTER
	db 0

GetNthPartyMon: ; 0x8b1ce
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, PartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PartyMon2 - PartyMon1
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret
.EmptyParty
	scf
	ret

INCBIN "baserom.gbc",$8b1e1,$8c000-$8b1e1

SECTION "bank23",DATA,BANK[$23]

INCBIN "baserom.gbc",$8C000,$4000

SECTION "bank24",DATA,BANK[$24]

INCBIN "baserom.gbc",$90000,$4000

SECTION "bank25",DATA,BANK[$25]

INCBIN "baserom.gbc",$94000,$94034 - $94000

MapHeader_0x94034: ; 0x94034
	; bank, tileset, permission
	db $25, $7, 3

	; second map header
	dw $5ba0

	; location on world map, music, time of day, fishing group
	db $1b, $9, 1, 1
; had to increase the final size by 1
; had to convert 0x->$ (duh..)
; 0x9403d

INCBIN "baserom.gbc",$9403d,$98000 - $9403d

SECTION "bank26",DATA,BANK[$26]

INCBIN "baserom.gbc",$98000,$4000

SECTION "bank27",DATA,BANK[$27]

INCBIN "baserom.gbc",$9C000,$4000

SECTION "bank28",DATA,BANK[$28]

INCBIN "baserom.gbc",$A0000,$4000

SECTION "bank29",DATA,BANK[$29]

INCBIN "baserom.gbc",$A4000,$4000

SECTION "bank2A",DATA,BANK[$2A]

INCBIN "baserom.gbc",$A8000,$4000

SECTION "bank2B",DATA,BANK[$2B]

INCBIN "baserom.gbc",$AC000,$4000

SECTION "bank2C",DATA,BANK[$2C]

INCBIN "baserom.gbc",$B0000,$4000

SECTION "bank2D",DATA,BANK[$2D]

INCBIN "baserom.gbc",$B4000,$4000

SECTION "bank2E",DATA,BANK[$2E]

INCBIN "baserom.gbc",$B8000,$4000

SECTION "bank2F",DATA,BANK[$2F]

INCBIN "baserom.gbc",$BC000,$4000

SECTION "bank30",DATA,BANK[$30]

INCBIN "baserom.gbc",$C0000,$4000

SECTION "bank31",DATA,BANK[$31]

INCBIN "baserom.gbc",$C4000,$4000

SECTION "bank32",DATA,BANK[$32]

INCBIN "baserom.gbc",$C8000,$4000

SECTION "bank33",DATA,BANK[$33]

INCBIN "baserom.gbc",$CC000,$4000

SECTION "bank34",DATA,BANK[$34]

INCBIN "baserom.gbc",$D0000,$4000

SECTION "bank35",DATA,BANK[$35]

INCBIN "baserom.gbc",$D4000,$4000

SECTION "bank36",DATA,BANK[$36]

INCBIN "baserom.gbc",$D8000,$4000

SECTION "bank37",DATA,BANK[$37]

INCBIN "baserom.gbc",$DC000,$4000

SECTION "bank38",DATA,BANK[$38]

INCBIN "baserom.gbc",$E0000,$4000

SECTION "bank39",DATA,BANK[$39]

INCBIN "baserom.gbc",$E4000,$4000

SECTION "bank3A",DATA,BANK[$3A]

INCBIN "baserom.gbc",$E8000,$4000

SECTION "bank3B",DATA,BANK[$3B]

INCBIN "baserom.gbc",$EC000,$4000

SECTION "bank3C",DATA,BANK[$3C]

INCBIN "baserom.gbc",$F0000,$4000

SECTION "bank3D",DATA,BANK[$3D]

INCBIN "baserom.gbc",$F4000,$4000

SECTION "bank3E",DATA,BANK[$3E]

INCBIN "baserom.gbc",$F8000,$4000

SECTION "bank3F",DATA,BANK[$3F]

INCBIN "baserom.gbc",$FC000,$4000

SECTION "bank40",DATA,BANK[$40]

INCBIN "baserom.gbc",$100000,$4000

SECTION "bank41",DATA,BANK[$41]

INCBIN "baserom.gbc",$104000,$4000

SECTION "bank42",DATA,BANK[$42]

INCBIN "baserom.gbc",$108000,$4000

SECTION "bank43",DATA,BANK[$43]

INCBIN "baserom.gbc",$10C000,$4000

SECTION "bank44",DATA,BANK[$44]

INCBIN "baserom.gbc",$110000,$4000

SECTION "bank45",DATA,BANK[$45]

INCBIN "baserom.gbc",$114000,$4000

SECTION "bank46",DATA,BANK[$46]

INCBIN "baserom.gbc",$118000,$4000

SECTION "bank47",DATA,BANK[$47]

INCBIN "baserom.gbc",$11C000,$4000

SECTION "bank48",DATA,BANK[$48]

INCBIN "baserom.gbc",$120000,$4000

SECTION "bank49",DATA,BANK[$49]

INCBIN "baserom.gbc",$124000,$4000

SECTION "bank4A",DATA,BANK[$4A]

INCBIN "baserom.gbc",$128000,$4000

SECTION "bank4B",DATA,BANK[$4B]

INCBIN "baserom.gbc",$12C000,$4000

SECTION "bank4C",DATA,BANK[$4C]

INCBIN "baserom.gbc",$130000,$4000

SECTION "bank4D",DATA,BANK[$4D]

INCBIN "baserom.gbc",$134000,$4000

SECTION "bank4E",DATA,BANK[$4E]

INCBIN "baserom.gbc",$138000,$4000

SECTION "bank4F",DATA,BANK[$4F]

INCBIN "baserom.gbc",$13C000,$4000

SECTION "bank50",DATA,BANK[$50]

INCBIN "baserom.gbc",$140000,$4000

SECTION "bank51",DATA,BANK[$51]

INCBIN "baserom.gbc",$144000,$4000

SECTION "bank52",DATA,BANK[$52]

INCBIN "baserom.gbc",$148000,$4000

SECTION "bank53",DATA,BANK[$53]

INCBIN "baserom.gbc",$14C000,$4000

SECTION "bank54",DATA,BANK[$54]

INCBIN "baserom.gbc",$150000,$4000

SECTION "bank55",DATA,BANK[$55]

INCBIN "baserom.gbc",$154000,$4000

SECTION "bank56",DATA,BANK[$56]

INCBIN "baserom.gbc",$158000,$4000

SECTION "bank57",DATA,BANK[$57]

INCBIN "baserom.gbc",$15C000,$4000

SECTION "bank58",DATA,BANK[$58]

INCBIN "baserom.gbc",$160000,$4000

SECTION "bank59",DATA,BANK[$59]

INCBIN "baserom.gbc",$164000,$4000

SECTION "bank5A",DATA,BANK[$5A]

INCBIN "baserom.gbc",$168000,$4000

SECTION "bank5B",DATA,BANK[$5B]

INCBIN "baserom.gbc",$16C000,$4000

SECTION "bank5C",DATA,BANK[$5C]

INCBIN "baserom.gbc",$170000,$4000

SECTION "bank5D",DATA,BANK[$5D]

INCBIN "baserom.gbc",$174000,$4000

SECTION "bank5E",DATA,BANK[$5E]

INCBIN "baserom.gbc",$178000,$4000

SECTION "bank5F",DATA,BANK[$5F]

INCBIN "baserom.gbc",$17C000,$4000

SECTION "bank60",DATA,BANK[$60]

INCBIN "baserom.gbc",$180000,$4000

SECTION "bank61",DATA,BANK[$61]

INCBIN "baserom.gbc",$184000,$4000

SECTION "bank62",DATA,BANK[$62]

INCBIN "baserom.gbc",$188000,$4000

SECTION "bank63",DATA,BANK[$63]

INCBIN "baserom.gbc",$18C000,$4000

SECTION "bank64",DATA,BANK[$64]

INCBIN "baserom.gbc",$190000,$4000

SECTION "bank65",DATA,BANK[$65]

INCBIN "baserom.gbc",$194000,$4000

SECTION "bank66",DATA,BANK[$66]

INCBIN "baserom.gbc",$198000,$4000

SECTION "bank67",DATA,BANK[$67]

INCBIN "baserom.gbc",$19C000,$4000

SECTION "bank68",DATA,BANK[$68]

INCBIN "baserom.gbc",$1A0000,$4000

SECTION "bank69",DATA,BANK[$69]

INCBIN "baserom.gbc",$1A4000,$4000

SECTION "bank6A",DATA,BANK[$6A]

INCBIN "baserom.gbc",$1A8000,$4000

SECTION "bank6B",DATA,BANK[$6B]

INCBIN "baserom.gbc",$1AC000,$4000

SECTION "bank6C",DATA,BANK[$6C]

INCBIN "baserom.gbc",$1B0000,$4000

SECTION "bank6D",DATA,BANK[$6D]

INCBIN "baserom.gbc",$1B4000,$4000

SECTION "bank6E",DATA,BANK[$6E]

INCBIN "baserom.gbc",$1B8000,$4000

SECTION "bank6F",DATA,BANK[$6F]

INCBIN "baserom.gbc",$1BC000,$4000

SECTION "bank70",DATA,BANK[$70]

INCBIN "baserom.gbc",$1C0000,$4000

SECTION "bank71",DATA,BANK[$71]

INCBIN "baserom.gbc",$1C4000,$4000

SECTION "bank72",DATA,BANK[$72]

	db "MASTER BALL@"
	db "ULTRA BALL@"
	db "BRIGHTPOWDER@"
	db "GREAT BALL@"
	db "# BALL@"
	db "TERU-SAMA@"
	db "BICYCLE@"
	db "MOON STONE@"
	db "ANTIDOTE@"
	db "BURN HEAL@"
	db "ICE HEAL@"
	db "AWAKENING@"
	db "PARLYZ HEAL@"
	db "FULL RESTORE@"
	db "MAX POTION@"
	db "HYPER POTION@"
	db "SUPER POTION@"
	db "POTION@"
	db "ESCAPE ROPE@"
	db "REPEL@"
	db "MAX ELIXER@"
	db "FIRE STONE@"
	db "THUNDERSTONE@"
	db "WATER STONE@"
	db "TERU-SAMA@"
	db "HP UP@"
	db "PROTEIN@"
	db "IRON@"
	db "CARBOS@"
	db "LUCKY PUNCH@"
	db "CALCIUM@"
	db "RARE CANDY@"
	db "X ACCURACY@"
	db "LEAF STONE@"
	db "METAL POWDER@"
	db "NUGGET@"
	db "# DOLL@"
	db "FULL HEAL@"
	db "REVIVE@"
	db "MAX REVIVE@"
	db "GUARD SPEC.@"
	db "SUPER REPEL@"
	db "MAX REPEL@"
	db "DIRE HIT@"
	db "TERU-SAMA@"
	db "FRESH WATER@"
	db "SODA POP@"
	db "LEMONADE@"
	db "X ATTACK@"
	db "TERU-SAMA@"
	db "X DEFEND@"
	db "X SPEED@"
	db "X SPECIAL@"
	db "COIN CASE@"
	db "ITEMFINDER@"
	db "TERU-SAMA@"
	db "EXP.SHARE@"
	db "OLD ROD@"
	db "GOOD ROD@"
	db "SILVER LEAF@"
	db "SUPER ROD@"
	db "PP UP@"
	db "ETHER@"
	db "MAX ETHER@"
	db "ELIXER@"
	db "RED SCALE@"
	db "SECRETPOTION@"
	db "S.S.TICKET@"
	db "MYSTERY EGG@"
	db "CLEAR BELL@"
	db "SILVER WING@"
	db "MOOMOO MILK@"
	db "QUICK CLAW@"
	db "PSNCUREBERRY@"
	db "GOLD LEAF@"
	db "SOFT SAND@"
	db "SHARP BEAK@"
	db "PRZCUREBERRY@"
	db "BURNT BERRY@"
	db "ICE BERRY@"
	db "POISON BARB@"
	db "KING'S ROCK@"
	db "BITTER BERRY@"
	db "MINT BERRY@"
	db "RED APRICORN@"
	db "TINYMUSHROOM@"
	db "BIG MUSHROOM@"
	db "SILVERPOWDER@"
	db "BLU APRICORN@"
	db "TERU-SAMA@"
	db "AMULET COIN@"
	db "YLW APRICORN@"
	db "GRN APRICORN@"
	db "CLEANSE TAG@"
	db "MYSTIC WATER@"
	db "TWISTEDSPOON@"
	db "WHT APRICORN@"
	db "BLACKBELT@"
	db "BLK APRICORN@"
	db "TERU-SAMA@"
	db "PNK APRICORN@"
	db "BLACKGLASSES@"
	db "SLOWPOKETAIL@"
	db "PINK BOW@"
	db "STICK@"
	db "SMOKE BALL@"
	db "NEVERMELTICE@"
	db "MAGNET@"
	db "MIRACLEBERRY@"
	db "PEARL@"
	db "BIG PEARL@"
	db "EVERSTONE@"
	db "SPELL TAG@"
	db "RAGECANDYBAR@"
	db "GS BALL@"
	db "BLUE CARD@"
	db "MIRACLE SEED@"
	db "THICK CLUB@"
	db "FOCUS BAND@"
	db "TERU-SAMA@"
	db "ENERGYPOWDER@"
	db "ENERGY ROOT@"
	db "HEAL POWDER@"
	db "REVIVAL HERB@"
	db "HARD STONE@"
	db "LUCKY EGG@"
	db "CARD KEY@"
	db "MACHINE PART@"
	db "EGG TICKET@"
	db "LOST ITEM@"
	db "STARDUST@"
	db "STAR PIECE@"
	db "BASEMENT KEY@"
	db "PASS@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "CHARCOAL@"
	db "BERRY JUICE@"
	db "SCOPE LENS@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "METAL COAT@"
	db "DRAGON FANG@"
	db "TERU-SAMA@"
	db "LEFTOVERS@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "MYSTERYBERRY@"
	db "DRAGON SCALE@"
	db "BERSERK GENE@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "SACRED ASH@"
	db "HEAVY BALL@"
	db "FLOWER MAIL@"
	db "LEVEL BALL@"
	db "LURE BALL@"
	db "FAST BALL@"
	db "TERU-SAMA@"
	db "LIGHT BALL@"
	db "FRIEND BALL@"
	db "MOON BALL@"
	db "LOVE BALL@"
	db "NORMAL BOX@"
	db "GORGEOUS BOX@"
	db "SUN STONE@"
	db "POLKADOT BOW@"
	db "TERU-SAMA@"
	db "UP-GRADE@"
	db "BERRY@"
	db "GOLD BERRY@"
	db "SQUIRTBOTTLE@"
	db "TERU-SAMA@"
	db "PARK BALL@"
	db "RAINBOW WING@"
	db "TERU-SAMA@"
	db "BRICK PIECE@"
	db "SURF MAIL@"
	db "LITEBLUEMAIL@"
	db "PORTRAITMAIL@"
	db "LOVELY MAIL@"
	db "EON MAIL@"
	db "MORPH MAIL@"
	db "BLUESKY MAIL@"
	db "MUSIC MAIL@"
	db "MIRAGE MAIL@"
	db "TERU-SAMA@"
	db "TM01@"
	db "TM02@"
	db "TM03@"
	db "TM04@"
	db "TERU-SAMA@"
	db "TM05@"
	db "TM06@"
	db "TM07@"
	db "TM08@"
	db "TM09@"
	db "TM10@"
	db "TM11@"
	db "TM12@"
	db "TM13@"
	db "TM14@"
	db "TM15@"
	db "TM16@"
	db "TM17@"
	db "TM18@"
	db "TM19@"
	db "TM20@"
	db "TM21@"
	db "TM22@"
	db "TM23@"
	db "TM24@"
	db "TM25@"
	db "TM26@"
	db "TM27@"
	db "TM28@"
	db "TERU-SAMA@"
	db "TM29@"
	db "TM30@"
	db "TM31@"
	db "TM32@"
	db "TM33@"
	db "TM34@"
	db "TM35@"
	db "TM36@"
	db "TM37@"
	db "TM38@"
	db "TM39@"
	db "TM40@"
	db "TM41@"
	db "TM42@"
	db "TM43@"
	db "TM44@"
	db "TM45@"
	db "TM46@"
	db "TM47@"
	db "TM48@"
	db "TM49@"
	db "TM50@"
	db "HM01@"
	db "HM02@"
	db "HM03@"
	db "HM04@"
	db "HM05@"
	db "HM06@"
	db "HM07@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "TERU-SAMA@"
	db "?@"

INCBIN "baserom.gbc",$1C8955,$1C8B85-$1C8955

MasterBallDesc:
	db "The best BALL. It",$4E
	db "never misses.@"

UltraBallDesc:
	db "A BALL with a high",$4E
	db "rate of success.@"

BrightpowderDesc:
	db "Lowers the foe's",$4E
	db "accuracy. (HOLD)@"

GreatBallDesc:
	db "A BALL with a de-",$4E
	db "cent success rate.@"

PokeBallDesc:
	db "An item for catch-",$4E
	db "ing #MON.@"

TeruSama1Desc:
	db "?@"

BicycleDesc:
	db "A collapsible bike",$4E
	db "for fast movement.@"

MoonStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

AntidoteDesc:
	db "Cures poisoned",$4E
	db "#MON.@"

BurnHealDesc:
	db "Heals burned",$4E
	db "#MON.@"

IceHealDesc:
	db "Defrosts frozen",$4E
	db "#MON.@"

AwakeningDesc:
	db "Awakens sleeping",$4E
	db "#MON.@"

ParlyzHealDesc:
	db "Heals paralyzed",$4E
	db "#MON.@"

FullRestoreDesc:
	db "Fully restores HP",$4E
	db "& status.@"

MaxPotionDesc:
	db "Fully restores",$4E
	db "#MON HP.@"

HyperPotionDesc:
	db "Restores #MON",$4E
	db "HP by 200.@"

SuperPotionDesc:
	db "Restores #MON",$4E
	db "HP by 50.@"

PotionDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

EscapeRopeDesc:
	db "Use for escaping",$4E
	db "from caves, etc.@"

RepelDesc:
	db "Repels weak #-",$4E
	db "MON for 100 steps.@"

MaxElixerDesc:
	db "Fully restores the",$4E
	db "PP of one #MON.@"

FireStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

ThunderStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

WaterStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

TeruSama2Desc:
	db "?@"

HPUpDesc:
	db "Raises the HP of",$4E
	db "one #MON.@"

ProteinDesc:
	db "Raises ATTACK of",$4E
	db "one #MON.@"

IronDesc:
	db "Raises DEFENSE of",$4E
	db "one #MON.@"

CarbosDesc:
	db "Raises SPEED of",$4E
	db "one #MON.@"

LuckyPunchDesc:
	db "Ups critical hit",$4E
	db "ratio of CHANSEY.@"

CalciumDesc:
	db "Ups SPECIAL stats",$4E
	db "of one #MON.@"

RareCandyDesc:
	db "Raises level of a",$4E
	db "#MON by one.@"

XAccuracyDesc:
	db "Raises accuracy.",$4E
	db "(1 BTL)@"

LeafStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

MetalPowderDesc:
	db "Raises DEFENSE of",$4E
	db "DITTO. (HOLD)@"

NuggetDesc:
	db "Made of pure gold.",$4E
	db "Sell high.@"

PokeDollDesc:
	db "Use to escape from",$4E
	db "a wild #MON.@"

FullHealDesc:
	db "Eliminates all",$4E
	db "status problems.@"

ReviveDesc:
	db "Restores a fainted",$4E
	db "#MON to 1/2 HP.@"

MaxReviveDesc:
	db "Fully restores a",$4E
	db "fainted #MON.@"

GuardSpecDesc:
	db "Prevents stats",$4E
	db "reduction. (1 BTL)@"

SuperRepelDesc:
	db "Repels weak #-",$4E
	db "MON for 200 steps.@"

MaxRepelDesc:
	db "Repels weak #-",$4E
	db "MON for 250 steps.@"

DireHitDesc:
	db "Ups critical hit",$4E
	db "ratio. (1 BTL)@"

TeruSama3Desc:
	db "?@"

FreshWaterDesc:
	db "Restores #MON",$4E
	db "HP by 50.@"

SodaPopDesc:
	db "Restores #MON",$4E
	db "HP by 60.@"

LemonadeDesc:
	db "Restores #MON",$4E
	db "HP by 80.@"

XAttackDesc:
	db "Raises ATTACK.",$4E
	db "(1 BTL)@"

TeruSama4Desc:
	db "?@"

XDefendDesc:
	db "Raises DEFENSE.",$4E
	db "(1 BTL)@"

XSpeedDesc:
	db "Raises SPEED.",$4E
	db "(1 BTL)@"

XSpecialDesc:
	db "Raises SPECIAL",$4E
	db "ATTACK. (1 BTL)@"

CoinCaseDesc:
	db "Holds up to 9,999",$4E
	db "game coins.@"

ItemfinderDesc:
	db "Checks for unseen",$4E
	db "items in the area.@"

TeruSama5Desc:
	db "?@"

ExpShareDesc:
	db "Shares battle EXP.",$4E
	db "Points. (HOLD)@"

OldRodDesc:
	db "Use by water to",$4E
	db "fish for #MON.@"

GoodRodDesc:
	db "A good ROD for",$4E
	db "catching #MON.@"

SilverLeafDesc:
	db "A strange, silver-",$4E
	db "colored leaf.@"

SuperRodDesc:
	db "The best ROD for",$4E
	db "catching #MON.@"

PPUpDesc:
	db "Raises max PP of",$4E
	db "a selected move.@"

EtherDesc:
	db "Restores PP of one",$4E
	db "move by 10.@"

MaxEtherDesc:
	db "Fully restores PP",$4E
	db "of one move.@"

ElixerDesc:
	db "Restores PP of all",$4E
	db "moves by 10.@"

RedScaleDesc:
	db "A scale from the",$4E
	db "red GYARADOS.@"

SecretPotionDesc:
	db "Fully heals any",$4E
	db "#MON.@"

SSTicketDesc:
	db "A ticket for the",$4E
	db "S.S.AQUA.@"

MysteryEggDesc:
	db "An EGG obtained",$4E
	db "from MR.#MON.@"

ClearBellDesc:
	db "Makes a gentle",$4E
	db "ringing.@"

SilverWingDesc:
	db "A strange, silver-",$4E
	db "colored feather.@"

MoomooMilkDesc:
	db "Restores #MON",$4E
	db "HP by 100.@"

QuickClawDesc:
	db "Raises 1st strike",$4E
	db "ratio. (HOLD)@"

PsnCureBerryDesc:
	db "A self-cure for",$4E
	db "poison. (HOLD)@"

GoldLeafDesc:
	db "A strange, gold-",$4E
	db "colored leaf.@"

SoftSandDesc:
	db "Powers up ground-",$4E
	db "type moves. (HOLD)@"

SharpBeakDesc:
	db "Powers up flying-",$4E
	db "type moves. (HOLD)@"

PrzCureBerryDesc:
	db "A self-cure for",$4E
	db "paralysis. (HOLD)@"

BurntBerryDesc:
	db "A self-cure for",$4E
	db "freezing. (HOLD)@"

IceBerryDesc:
	db "A self-heal for a",$4E
	db "burn. (HOLD)@"

PoisonBarbDesc:
	db "Powers up poison-",$4E
	db "type moves. (HOLD)@"

KingsRockDesc:
	db "May make the foe",$4E
	db "flinch. (HOLD)@"

BitterBerryDesc:
	db "A self-cure for",$4E
	db "confusion. (HOLD)@"

MintBerryDesc:
	db "A self-awakening",$4E
	db "for sleep. (HOLD)@"

RedApricornDesc:
	db "A red APRICORN.@"

TinyMushroomDesc:
	db "An ordinary mush-",$4E
	db "room. Sell low.@"

BigMushroomDesc:
	db "A rare mushroom.",$4E
	db "Sell high.@"

SilverPowderDesc:
	db "Powers up bug-type",$4E
	db "moves. (HOLD)@"

BluApricornDesc:
	db "A blue APRICORN.@"

TeruSama6Desc:
	db "?@"

AmuletCoinDesc:
	db "Doubles monetary",$4E
	db "earnings. (HOLD)@"

YlwApricornDesc:
	db "A yellow APRICORN.@"

GrnApricornDesc:
	db "A green APRICORN.@"

CleanseTagDesc:
	db "Helps repel wild",$4E
	db "#MON. (HOLD)@"

MysticWaterDesc:
	db "Powers up water-",$4E
	db "type moves. (HOLD)@"

TwistedSpoonDesc:
	db "Powers up psychic-",$4E
	db "type moves. (HOLD)@"

WhtApricornDesc:
	db "A white APRICORN.@"

BlackbeltDesc:
	db "Boosts fighting-",$4E
	db "type moves. (HOLD)@"

BlkApricornDesc:
	db "A black APRICORN.",$4E
	db "@"

TeruSama7Desc:
	db "?@"

PnkApricornDesc:
	db "A pink APRICORN.",$4E
	db "@"

BlackGlassesDesc:
	db "Powers up dark-",$4E
	db "type moves. (HOLD)@"

SlowpokeTailDesc:
	db "Very tasty. Sell",$4E
	db "high.@"

PinkBowDesc:
	db "Powers up normal-",$4E
	db "type moves. (HOLD)@"

StickDesc:
	db "An ordinary stick.",$4E
	db "Sell low.@"

SmokeBallDesc:
	db "Escape from wild",$4E
	db "#MON. (HOLD)@"

NeverMeltIceDesc:
	db "Powers up ice-type",$4E
	db "moves. (HOLD)@"

MagnetDesc:
	db "Boosts electric-",$4E
	db "type moves. (HOLD)@"

MiracleBerryDesc:
	db "Cures all status",$4E
	db "problems. (HOLD)@"

PearlDesc:
	db "A beautiful pearl.",$4E
	db "Sell low.@"

BigPearlDesc:
	db "A big, beautiful",$4E
	db "pearl. Sell high.@"

EverStoneDesc:
	db "Stops evolution.",$4E
	db "(HOLD)@"

SpellTagDesc:
	db "Powers up ghost-",$4E
	db "type moves. (HOLD)@"

RageCandyBarDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

GSBallDesc:
	db "The mysterious",$4E
	db "BALL.@"

BlueCardDesc:
	db "Card to save",$4E
	db "points.@"

MiracleSeedDesc:
	db "Powers up grass-",$4E
	db "type moves. (HOLD)@"

ThickClubDesc:
	db "A bone of some",$4E
	db "sort. Sell low.@"

FocusBandDesc:
	db "May prevent faint-",$4E
	db "ing. (HOLD)@"

TeruSama8Desc:
	db "?@"

EnergyPowderDesc:
	db "Restores #MON",$4E
	db "HP by 50. Bitter.@"

EnergyRootDesc:
	db "Restores #MON",$4E
	db "HP by 200. Bitter.@"

HealPowderDesc:
	db "Cures all status",$4E
	db "problems. Bitter.@"

RevivalHerbDesc:
	db "Revives fainted",$4E
	db "#MON. Bitter.@"

HardStoneDesc:
	db "Powers up rock-",$4E
	db "type moves. (HOLD)@"

LuckyEggDesc:
	db "Earns extra EXP.",$4E
	db "points. (HOLD)@"

CardKeyDesc:
	db "Opens shutters in",$4E
	db "the RADIO TOWER.@"

MachinePartDesc:
	db "A machine part for",$4E
	db "the POWER PLANT.@"

EggTicketDesc:
	db "May use at Golden-",$4E
	db "rod trade corner.@"

LostItemDesc:
	db "The # DOLL lost",$4E
	db "by the COPYCAT.@"

StardustDesc:
	db "Pretty, red sand.",$4E
	db "Sell high.@"

StarPieceDesc:
	db "A hunk of red gem.",$4E
	db "Sell very high.@"

BasementKeyDesc:
	db "Opens doors.@"

PassDesc:
	db "A ticket for the",$4E
	db "MAGNET TRAIN.@"

TeruSama9Desc:
	db "?@"

TeruSama10Desc:
	db "?@"

TeruSama11Desc:
	db "?@"

CharcoalDesc:
	db "Powers up fire-",$4E
	db "type moves. (HOLD)@"

BerryJuiceDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

ScopeLensDesc:
	db "Raises critical",$4E
	db "hit ratio. (HOLD)@"

TeruSama12Desc:
	db "?@"

TeruSama13Desc:
	db "?@"

MetalCoatDesc:
	db "Powers up steel-",$4E
	db "type moves. (HOLD)@"

DragonFangDesc:
	db "Powers up dragon-",$4E
	db "type moves. (HOLD)@"

TeruSama14Desc:
	db "?@"

LeftoversDesc:
	db "Restores HP during",$4E
	db "battle. (HOLD)@"

TeruSama15Desc:
	db "?@"

TeruSama16Desc:
	db "?@"

TeruSama17Desc:
	db "?@"

MysteryBerryDesc:
	db "A self-restore",$4E
	db "for PP. (HOLD)@"

DragonScaleDesc:
	db "A rare dragon-type",$4E
	db "item.@"

BerserkGeneDesc:
	db "Boosts ATTACK but",$4E
	db "causes confusion.@"

TeruSama18Desc:
	db "?@"

TeruSama19Desc:
	db "?@"

TeruSama20Desc:
	db "?@"

SacredAshDesc:
	db "Fully revives all",$4E
	db "fainted #MON.@"

HeavyBallDesc:
	db "A BALL for catch-",$4E
	db "ing heavy #MON.@"

FlowerMailDesc:
	db "Flower-print MAIL.",$4E
	db "(HOLD)@"

LevelBallDesc:
	db "A BALL for lower-",$4E
	db "level #MON.@"

LureBallDesc:
	db "A BALL for #MON",$4E
	db "hooked by a ROD.@"

FastBallDesc:
	db "A BALL for catch-",$4E
	db "ing fast #MON.@"

TeruSama21Desc:
	db "?@"

LightBallDesc:
	db "An odd, electrical",$4E
	db "orb. (HOLD)@"

FriendBallDesc:
	db "A BALL that makes",$4E
	db "#MON friendly.@"

MoonBallDesc:
	db "A BALL for MOON",$4E
	db "STONE evolvers.@"

LoveBallDesc:
	db "For catching the",$4E
	db "opposite gender.@"

NormalBoxDesc:
	db "Open it and see",$4E
	db "what's inside.@"

GorgeousBoxDesc:
	db "Open it and see",$4E
	db "what's inside.@"

SunStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

PolkadotBowDesc:
	db "Powers up normal-",$4E
	db "type moves. (HOLD)@"

TeruSama22Desc:
	db "?@"

UpGradeDesc:
	db "A mysterious box",$4E
	db "made by SILPH CO.@"

BerryDesc:
	db "A self-restore",$4E
	db "item. (10HP, HOLD)@"

GoldBerryDesc:
	db "A self-restore",$4E
	db "item. (30HP, HOLD)@"

SquirtBottleDesc:
	db "A bottle used for",$4E
	db "watering plants.@"

TeruSama23Desc:
	db "?@"

ParkBallDesc:
	db "The Bug-Catching",$4E
	db "Contest BALL.@"

RainbowWingDesc:
	db "A mystical feather",$4E
	db "of rainbow colors.@"

TeruSama24Desc:
	db "?@"

BrickPieceDesc:
	db "A rare chunk of",$4E
	db "tile.@"

SurfMailDesc:
	db "LAPRAS-print MAIL.",$4E
	db "(HOLD)@"

LiteBlueMailDesc:
	db "DRATINI-print",$4E
	db "MAIL. (HOLD)@"

PortraitMailDesc:
	db "MAIL featuring the",$4E
	db "holder's likeness.@"

LovelyMailDesc:
	db "Heart-print MAIL.",$4E
	db "(HOLD)@"

EonMailDesc:
	db "EEVEE-print MAIL.",$4E
	db "(HOLD)@"

MorphMailDesc:
	db "DITTO-print MAIL.",$4E
	db "(HOLD)@"

BlueSkyMailDesc:
	db "Sky-print MAIL.",$4E
	db "(HOLD)@"

MusicMailDesc:
	db "NATU-print MAIL.",$4E
	db "(HOLD)@"

MewMailDesc:
	db "MEW-print MAIL.",$4E
	db "(HOLD)@"

TeruSama25Desc:
	db "?@"

TeruSama26Desc:
	db "?@"

TeruSama27Desc:
	db "?@"

TeruSama28Desc:
	db "?@"

TeruSama29Desc:
	db "?@"

TeruSama30Desc:
	db "?@"

TeruSama31Desc:
	db "?@"

TeruSama32Desc:
	db "?@"

TeruSama33Desc:
	db "?@"

	db "POUND@"
	db "KARATE CHOP@"
	db "DOUBLESLAP@"
	db "COMET PUNCH@"
	db "MEGA PUNCH@"
	db "PAY DAY@"
	db "FIRE PUNCH@"
	db "ICE PUNCH@"
	db "THUNDERPUNCH@"
	db "SCRATCH@"
	db "VICEGRIP@"
	db "GUILLOTINE@"
	db "RAZOR WIND@"
	db "SWORDS DANCE@"
	db "CUT@"
	db "GUST@"
	db "WING ATTACK@"
	db "WHIRLWIND@"
	db "FLY@"
	db "BIND@"
	db "SLAM@"
	db "VINE WHIP@"
	db "STOMP@"
	db "DOUBLE KICK@"
	db "MEGA KICK@"
	db "JUMP KICK@"
	db "ROLLING KICK@"
	db "SAND-ATTACK@"
	db "HEADBUTT@"
	db "HORN ATTACK@"
	db "FURY ATTACK@"
	db "HORN DRILL@"
	db "TACKLE@"
	db "BODY SLAM@"
	db "WRAP@"
	db "TAKE DOWN@"
	db "THRASH@"
	db "DOUBLE-EDGE@"
	db "TAIL WHIP@"
	db "POISON STING@"
	db "TWINEEDLE@"
	db "PIN MISSILE@"
	db "LEER@"
	db "BITE@"
	db "GROWL@"
	db "ROAR@"
	db "SING@"
	db "SUPERSONIC@"
	db "SONICBOOM@"
	db "DISABLE@"
	db "ACID@"
	db "EMBER@"
	db "FLAMETHROWER@"
	db "MIST@"
	db "WATER GUN@"
	db "HYDRO PUMP@"
	db "SURF@"
	db "ICE BEAM@"
	db "BLIZZARD@"
	db "PSYBEAM@"
	db "BUBBLEBEAM@"
	db "AURORA BEAM@"
	db "HYPER BEAM@"
	db "PECK@"
	db "DRILL PECK@"
	db "SUBMISSION@"
	db "LOW KICK@"
	db "COUNTER@"
	db "SEISMIC TOSS@"
	db "STRENGTH@"
	db "ABSORB@"
	db "MEGA DRAIN@"
	db "LEECH SEED@"
	db "GROWTH@"
	db "RAZOR LEAF@"
	db "SOLARBEAM@"
	db "POISONPOWDER@"
	db "STUN SPORE@"
	db "SLEEP POWDER@"
	db "PETAL DANCE@"
	db "STRING SHOT@"
	db "DRAGON RAGE@"
	db "FIRE SPIN@"
	db "THUNDERSHOCK@"
	db "THUNDERBOLT@"
	db "THUNDER WAVE@"
	db "THUNDER@"
	db "ROCK THROW@"
	db "EARTHQUAKE@"
	db "FISSURE@"
	db "DIG@"
	db "TOXIC@"
	db "CONFUSION@"
	db "PSYCHIC@"
	db "HYPNOSIS@"
	db "MEDITATE@"
	db "AGILITY@"
	db "QUICK ATTACK@"
	db "RAGE@"
	db "TELEPORT@"
	db "NIGHT SHADE@"
	db "MIMIC@"
	db "SCREECH@"
	db "DOUBLE TEAM@"
	db "RECOVER@"
	db "HARDEN@"
	db "MINIMIZE@"
	db "SMOKESCREEN@"
	db "CONFUSE RAY@"
	db "WITHDRAW@"
	db "DEFENSE CURL@"
	db "BARRIER@"
	db "LIGHT SCREEN@"
	db "HAZE@"
	db "REFLECT@"
	db "FOCUS ENERGY@"
	db "BIDE@"
	db "METRONOME@"
	db "MIRROR MOVE@"
	db "SELFDESTRUCT@"
	db "EGG BOMB@"
	db "LICK@"
	db "SMOG@"
	db "SLUDGE@"
	db "BONE CLUB@"
	db "FIRE BLAST@"
	db "WATERFALL@"
	db "CLAMP@"
	db "SWIFT@"
	db "SKULL BASH@"
	db "SPIKE CANNON@"
	db "CONSTRICT@"
	db "AMNESIA@"
	db "KINESIS@"
	db "SOFTBOILED@"
	db "HI JUMP KICK@"
	db "GLARE@"
	db "DREAM EATER@"
	db "POISON GAS@"
	db "BARRAGE@"
	db "LEECH LIFE@"
	db "LOVELY KISS@"
	db "SKY ATTACK@"
	db "TRANSFORM@"
	db "BUBBLE@"
	db "DIZZY PUNCH@"
	db "SPORE@"
	db "FLASH@"
	db "PSYWAVE@"
	db "SPLASH@"
	db "ACID ARMOR@"
	db "CRABHAMMER@"
	db "EXPLOSION@"
	db "FURY SWIPES@"
	db "BONEMERANG@"
	db "REST@"
	db "ROCK SLIDE@"
	db "HYPER FANG@"
	db "SHARPEN@"
	db "CONVERSION@"
	db "TRI ATTACK@"
	db "SUPER FANG@"
	db "SLASH@"
	db "SUBSTITUTE@"
	db "STRUGGLE@"
	db "SKETCH@"
	db "TRIPLE KICK@"
	db "THIEF@"
	db "SPIDER WEB@"
	db "MIND READER@"
	db "NIGHTMARE@"
	db "FLAME WHEEL@"
	db "SNORE@"
	db "CURSE@"
	db "FLAIL@"
	db "CONVERSION2@"
	db "AEROBLAST@"
	db "COTTON SPORE@"
	db "REVERSAL@"
	db "SPITE@"
	db "POWDER SNOW@"
	db "PROTECT@"
	db "MACH PUNCH@"
	db "SCARY FACE@"
	db "FAINT ATTACK@"
	db "SWEET KISS@"
	db "BELLY DRUM@"
	db "SLUDGE BOMB@"
	db "MUD-SLAP@"
	db "OCTAZOOKA@"
	db "SPIKES@"
	db "ZAP CANNON@"
	db "FORESIGHT@"
	db "DESTINY BOND@"
	db "PERISH SONG@"
	db "ICY WIND@"
	db "DETECT@"
	db "BONE RUSH@"
	db "LOCK-ON@"
	db "OUTRAGE@"
	db "SANDSTORM@"
	db "GIGA DRAIN@"
	db "ENDURE@"
	db "CHARM@"
	db "ROLLOUT@"
	db "FALSE SWIPE@"
	db "SWAGGER@"
	db "MILK DRINK@"
	db "SPARK@"
	db "FURY CUTTER@"
	db "STEEL WING@"
	db "MEAN LOOK@"
	db "ATTRACT@"
	db "SLEEP TALK@"
	db "HEAL BELL@"
	db "RETURN@"
	db "PRESENT@"
	db "FRUSTRATION@"
	db "SAFEGUARD@"
	db "PAIN SPLIT@"
	db "SACRED FIRE@"
	db "MAGNITUDE@"
	db "DYNAMICPUNCH@"
	db "MEGAHORN@"
	db "DRAGONBREATH@"
	db "BATON PASS@"
	db "ENCORE@"
	db "PURSUIT@"
	db "RAPID SPIN@"
	db "SWEET SCENT@"
	db "IRON TAIL@"
	db "METAL CLAW@"
	db "VITAL THROW@"
	db "MORNING SUN@"
	db "SYNTHESIS@"
	db "MOONLIGHT@"
	db "HIDDEN POWER@"
	db "CROSS CHOP@"
	db "TWISTER@"
	db "RAIN DANCE@"
	db "SUNNY DAY@"
	db "CRUNCH@"
	db "MIRROR COAT@"
	db "PSYCH UP@"
	db "EXTREMESPEED@"
	db "ANCIENTPOWER@"
	db "SHADOW BALL@"
	db "FUTURE SIGHT@"
	db "ROCK SMASH@"
	db "WHIRLPOOL@"
	db "BEAT UP@"

INCBIN "baserom.gbc",$1CA896,$1CAA43-$1CA896

	db "NEW BARK",$1F,"TOWN@"
	db "CHERRYGROVE",$1F,"CITY@"
	db "VIOLET CITY@"
	db "AZALEA TOWN@"
	db "GOLDENROD",$1F,"CITY@"
	db "ECRUTEAK",$1F,"CITY@"
	db "OLIVINE",$1F,"CITY@"
	db "CIANWOOD",$1F,"CITY@"
	db "MAHOGANY",$1F,"TOWN@"
	db "BLACKTHORN",$1F,"CITY@"
	db "LAKE OF",$1F,"RAGE@"
	db "SILVER CAVE@"
	db "SPROUT",$1F,"TOWER@"
	db "RUINS",$1F,"OF ALPH@"
	db "UNION CAVE@"
	db "SLOWPOKE",$1F,"WELL@"
	db "RADIO TOWER@"
	db "POWER PLANT@"
	db "NATIONAL",$1F,"PARK@"
	db "TIN TOWER@"
	db "LIGHTHOUSE@"
	db "WHIRL",$1F,"ISLANDS@"
	db "MT.MORTAR@"
	db "DRAGON'S",$1F,"DEN@"
	db "ICE PATH@"
	db "N/A@"
	db "PALLET TOWN@"
	db "VIRIDIAN",$1F,"CITY@"
	db "PEWTER CITY@"
	db "CERULEAN",$1F,"CITY@"
	db "LAVENDER",$1F,"TOWN@"
	db "VERMILION",$1F,"CITY@"
	db "CELADON",$1F,"CITY@"
	db "SAFFRON",$1F,"CITY@"
	db "FUCHSIA",$1F,"CITY@"
	db "CINNABAR",$1F,"ISLAND@"
	db "INDIGO",$1F,"PLATEAU@"
	db "VICTORY",$1F,"ROAD@"
	db "MT.MOON@"
	db "ROCK TUNNEL@"
	db "LAV",$1F,"RADIO TOWER@"
	db "SILPH CO.@"
	db "SAFARI ZONE@"
	db "SEAFOAM",$1F,"ISLANDS@"
	db "#MON",$1F,"MANSION@"
	db "CERULEAN",$1F,"CAVE@"
	db "ROUTE 1@"
	db "ROUTE 2@"
	db "ROUTE 3@"
	db "ROUTE 4@"
	db "ROUTE 5@"
	db "ROUTE 6@"
	db "ROUTE 7@"
	db "ROUTE 8@"
	db "ROUTE 9@"
	db "ROUTE 10@"
	db "ROUTE 11@"
	db "ROUTE 12@"
	db "ROUTE 13@"
	db "ROUTE 14@"
	db "ROUTE 15@"
	db "ROUTE 16@"
	db "ROUTE 17@"
	db "ROUTE 18@"
	db "ROUTE 19@"
	db "ROUTE 20@"
	db "ROUTE 21@"
	db "ROUTE 22@"
	db "ROUTE 23@"
	db "ROUTE 24@"
	db "ROUTE 25@"
	db "ROUTE 26@"
	db "ROUTE 27@"
	db "ROUTE 28@"
	db "ROUTE 29@"
	db "ROUTE 30@"
	db "ROUTE 31@"
	db "ROUTE 32@"
	db "ROUTE 33@"
	db "ROUTE 34@"
	db "ROUTE 35@"
	db "ROUTE 36@"
	db "ROUTE 37@"
	db "ROUTE 38@"
	db "ROUTE 39@"
	db "ROUTE 40@"
	db "ROUTE 41@"
	db "ROUTE 42@"
	db "ROUTE 43@"
	db "ROUTE 44@"
	db "ROUTE 45@"
	db "ROUTE 46@"
	db "DARK CAVE@"
	db "ILEX",$1F,"FOREST@"
	db "BURNED",$1F,"TOWER@"
	db "FAST SHIP@"
	db "VIRIDIAN",$1F,"FOREST@"
	db "DIGLETT'S",$1F,"CAVE@"
	db "TOHJO FALLS@"
	db "UNDERGROUND@"
	db "BATTLE",$1F,"TOWER@"
	db "SPECIAL@"

INCBIN "baserom.gbc",$1CAEA1,$40

SECTION "bank73",DATA,BANK[$73]

INCBIN "baserom.gbc",$1CC000,$4000

SECTION "bank74",DATA,BANK[$74]

INCBIN "baserom.gbc",$1D0000,$4000

SECTION "bank75",DATA,BANK[$75]

INCBIN "baserom.gbc",$1D4000,$4000

SECTION "bank76",DATA,BANK[$76]

INCBIN "baserom.gbc",$1D8000,$4000

SECTION "bank77",DATA,BANK[$77]

INCBIN "baserom.gbc",$1DC000,$4000

SECTION "bank78",DATA,BANK[$78]

INCBIN "baserom.gbc",$1E0000,$4000

SECTION "bank79",DATA,BANK[$79]

INCBIN "baserom.gbc",$1E4000,$4000

SECTION "bank7A",DATA,BANK[$7A]

INCBIN "baserom.gbc",$1E8000,$4000

SECTION "bank7B",DATA,BANK[$7B]

INCBIN "baserom.gbc",$1EC000,$4000

SECTION "bank7C",DATA,BANK[$7C]

INCBIN "baserom.gbc",$1F0000,$4000

SECTION "bank7D",DATA,BANK[$7D]

INCBIN "baserom.gbc",$1F4000,$4000

SECTION "bank7E",DATA,BANK[$7E]

INCBIN "baserom.gbc",$1F8000,$4000

SECTION "bank7F",DATA,BANK[$7F]

INCBIN "baserom.gbc",$1FC000,$4000
