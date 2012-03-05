SECTION "bank0",HOME
INCBIN "baserom.gbc",$0,$4000
SECTION "bank1",DATA,BANK[$1]
INCBIN "baserom.gbc",$4000,$4000
SECTION "bank2",DATA,BANK[$2]
INCBIN "baserom.gbc",$8000,$4000
SECTION "bank3",DATA,BANK[$3]
INCBIN "baserom.gbc",$C000,$4000
SECTION "bank4",DATA,BANK[$4]
INCBIN "baserom.gbc",$10000,$4000
SECTION "bank5",DATA,BANK[$5]
INCBIN "baserom.gbc",$14000,$4000
SECTION "bank6",DATA,BANK[$6]
INCBIN "baserom.gbc",$18000,$4000
SECTION "bank7",DATA,BANK[$7]
INCBIN "baserom.gbc",$1C000,$4000
SECTION "bank8",DATA,BANK[$8]
INCBIN "baserom.gbc",$20000,$4000
SECTION "bank9",DATA,BANK[$9]
INCBIN "baserom.gbc",$24000,$4000
SECTION "bankA",DATA,BANK[$A]
INCBIN "baserom.gbc",$28000,$$2A5e9 - $28000

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

	db $02,$06 ; Route 43
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

INCBIN "baserom.gbc",$2b11d,$2c000 - $2b11d

SECTION "bankB",DATA,BANK[$B]
INCBIN "baserom.gbc",$2C000,$4000
SECTION "bankC",DATA,BANK[$C]
INCBIN "baserom.gbc",$30000,$4000
SECTION "bankD",DATA,BANK[$D]
INCBIN "baserom.gbc",$34000,$4000
SECTION "bankE",DATA,BANK[$E]
INCBIN "baserom.gbc",$38000,$4000
SECTION "bankF",DATA,BANK[$F]
INCBIN "baserom.gbc",$3C000,$4000
SECTION "bank10",DATA,BANK[$10]
INCBIN "baserom.gbc",$40000,$4000
SECTION "bank11",DATA,BANK[$11]
INCBIN "baserom.gbc",$44000,$4000
SECTION "bank12",DATA,BANK[$12]
INCBIN "baserom.gbc",$48000,$4000
SECTION "bank13",DATA,BANK[$13]
INCBIN "baserom.gbc",$4C000,$4000
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

INCBIN "baserom.gbc",$53D84,$4000 - $3D84
SECTION "bank15",DATA,BANK[$15]
INCBIN "baserom.gbc",$54000,$4000
SECTION "bank16",DATA,BANK[$16]
INCBIN "baserom.gbc",$58000,$4000
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
INCBIN "baserom.gbc",$88000,$4000
SECTION "bank23",DATA,BANK[$23]
INCBIN "baserom.gbc",$8C000,$4000
SECTION "bank24",DATA,BANK[$24]
INCBIN "baserom.gbc",$90000,$4000
SECTION "bank25",DATA,BANK[$25]
INCBIN "baserom.gbc",$94000,$4000
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
