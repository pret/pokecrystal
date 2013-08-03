KrissNeighborsHouse_MapScriptHeader: ; 0x7acec
	; trigger count
	db 0

	; callback count
	db 0
; 0x7acee

CooltrainerFScript_0x7acee: ; 0x7acee
	jumptextfaceplayer UnknownText_0x7ad2f
; 0x7acf1

PokefanFScript_0x7acf1: ; 0x7acf1
	jumptextfaceplayer UnknownText_0x7add4
; 0x7acf4

MapKrissNeighborsHouseSignpost1Script: ; 0x7acf4
	jumpstd $0003
; 0x7acf7

MapKrissNeighborsHouseSignpost2Script: ; 0x7acf7
	checkbit1 $001a
	iftrue UnknownScript_0x7ad24
	checkbit1 $0325
	iftrue UnknownScript_0x7ad27
	playmusic $001d
	loadfont
	2writetext UnknownText_0x7ae3b
	pause 45
	2writetext UnknownText_0x7ae6c
	pause 45
	2writetext UnknownText_0x7ae7b
	pause 45
	musicfadeout $003c, $10
	2writetext UnknownText_0x7ae9b
	pause 45
	loadmovesprites
	setbit1 $0325
	end
; 0x7ad24

UnknownScript_0x7ad24: ; 0x7ad24
	jumpstd $000b
; 0x7ad27

UnknownScript_0x7ad27: ; 0x7ad27
	loadfont
	2writetext UnknownText_0x7ae9b
	pause 45
	loadmovesprites
	end
; 0x7ad2f

UnknownText_0x7ad2f: ; 0x7ad2f
	db $0, "PIKACHU is an", $4f
	db "evolved #MON.", $51
	db "I was amazed by", $4f
	db "PROF.ELM's find-", $55
	db "ings.", $51
	db "He's so famous for", $4f
	db "his research on", $55
	db "#MON evolution.", $51
	db "…sigh…", $51
	db "I wish I could be", $4f
	db "a researcher like", $55
	db "him…", $57
; 0x7add4

UnknownText_0x7add4: ; 0x7add4
	db $0, "My daughter is", $4f
	db "adamant about", $51
	db "becoming PROF.", $4f
	db "ELM's assistant.", $51
	db "She really loves", $4f
	db "#MON!", $51
	db "But then, so do I!", $57
; 0x7ae3b

UnknownText_0x7ae3b: ; 0x7ae3b
	db $0, "PROF.OAK'S #MON", $4f
	db "TALK! Please tune", $55
	db "in next time!", $57
; 0x7ae6c

UnknownText_0x7ae6c: ; 0x7ae6c
	db $0, "#MON CHANNEL!", $57
; 0x7ae7b

UnknownText_0x7ae7b: ; 0x7ae7b
	db $0, "This is DJ MARY,", $4f
	db "your co-host!", $57
; 0x7ae9b

UnknownText_0x7ae9b: ; 0x7ae9b
	db $0, "#MON!", $4f
	db "#MON CHANNEL…", $57
; 0x7aeb0

KrissNeighborsHouse_MapEventHeader: ; 0x7aeb0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $3, 3, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapKrissNeighborsHouseSignpost1Script
	signpost 1, 1, $0, MapKrissNeighborsHouseSignpost1Script
	signpost 1, 7, $0, MapKrissNeighborsHouseSignpost2Script

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_F, 7, 6, $9, $0, 255, 255, $80, 0, CooltrainerFScript_0x7acee, $ffff
	person_event SPRITE_POKEFAN_F, 7, 9, $8, $0, 255, 255, $80, 0, PokefanFScript_0x7acf1, $0793
; 0x7aee9

