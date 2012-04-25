SECTION "bank0",HOME

INCBIN "baserom.gbc",$0,$304d

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

INCBIN "baserom.gbc",$38000,$3C000 - $38000

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
