GoldenrodHappinessRater_MapScriptHeader: ; 0x54951
	; trigger count
	db 0

	; callback count
	db 0
; 0x54953

TeacherScript_0x54953: ; 0x54953
	faceplayer
	loadfont
	special $0059
	2writetext UnknownText_0x549a3
	keeptextopen
	if_greater_than $f9, UnknownScript_0x54973
	if_greater_than $c7, UnknownScript_0x54979
	if_greater_than $95, UnknownScript_0x5497f
	if_greater_than $63, UnknownScript_0x54985
	if_greater_than $31, UnknownScript_0x5498b
	2jump UnknownScript_0x54991
; 0x54973

UnknownScript_0x54973: ; 0x54973
	2writetext UnknownText_0x549fc
	closetext
	loadmovesprites
	end
; 0x54979

UnknownScript_0x54979: ; 0x54979
	2writetext UnknownText_0x54a2c
	closetext
	loadmovesprites
	end
; 0x5497f

UnknownScript_0x5497f: ; 0x5497f
	2writetext UnknownText_0x54a5a
	closetext
	loadmovesprites
	end
; 0x54985

UnknownScript_0x54985: ; 0x54985
	2writetext UnknownText_0x54a8e
	closetext
	loadmovesprites
	end
; 0x5498b

UnknownScript_0x5498b: ; 0x5498b
	2writetext UnknownText_0x54a9f
	closetext
	loadmovesprites
	end
; 0x54991

UnknownScript_0x54991: ; 0x54991
	2writetext UnknownText_0x54ad1
	closetext
	loadmovesprites
	end
; 0x54997

PokefanMScript_0x54997: ; 0x54997
	jumptextfaceplayer UnknownText_0x54b04
; 0x5499a

TwinScript_0x5499a: ; 0x5499a
	jumptextfaceplayer UnknownText_0x54b67
; 0x5499d

MapGoldenrodHappinessRaterSignpost1Script: ; 0x5499d
	jumpstd $0001
; 0x549a0

MapGoldenrodHappinessRaterSignpost2Script: ; 0x549a0
	jumpstd $000c
; 0x549a3

UnknownText_0x549a3: ; 0x549a3
	db $0, "If you treat your", $4f
	db "#MON nicely,", $51
	db "they will love you", $4f
	db "in return.", $51
	db "Oh? Let me see", $4f
	db "your @"
	text_from_ram $d099
	db $0, "…", $57
; 0x549fc

UnknownText_0x549fc: ; 0x549fc
	db $0, "It looks really", $4f
	db "happy! It must", $55
	db "love you a lot.", $57
; 0x54a2c

UnknownText_0x54a2c: ; 0x54a2c
	db $0, "I get the feeling", $4f
	db "that it really", $55
	db "trusts you.", $57
; 0x54a5a

UnknownText_0x54a5a: ; 0x54a5a
	db $0, "It's friendly to-", $4f
	db "ward you. It looks", $55
	db "sort of happy.", $57
; 0x54a8e

UnknownText_0x54a8e: ; 0x54a8e
	db $0, "It's quite cute.", $57
; 0x54a9f

UnknownText_0x54a9f: ; 0x54a9f
	db $0, "You should treat", $4f
	db "it better. It's", $55
	db "not used to you.", $57
; 0x54ad1

UnknownText_0x54ad1: ; 0x54ad1
	db $0, "It doesn't seem to", $4f
	db "like you at all.", $55
	db "It looks mean.", $57
; 0x54b04

UnknownText_0x54b04: ; 0x54b04
	db $0, "I keep losing in", $4f
	db "battles, and my", $51
	db "#MON end up", $4f
	db "fainting…", $51
	db "Maybe that's why", $4f
	db "my #MON don't", $55
	db "like me much…", $57
; 0x54b67

UnknownText_0x54b67: ; 0x54b67
	db $0, "When I use an item", $4f
	db "on my #MON, it", $55
	db "acts really glad!", $57
; 0x54b9c

GoldenrodHappinessRater_MapEventHeader: ; 0x54b9c
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 3, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapGoldenrodHappinessRaterSignpost1Script
	signpost 1, 1, $0, MapGoldenrodHappinessRaterSignpost1Script
	signpost 1, 7, $0, MapGoldenrodHappinessRaterSignpost2Script

	; people-events
	db 3
	person_event SPRITE_TEACHER, 8, 6, $6, $0, 255, 255, $90, 0, TeacherScript_0x54953, $ffff
	person_event SPRITE_POKEFAN_M, 7, 9, $8, $0, 255, 255, $0, 0, PokefanMScript_0x54997, $ffff
	person_event SPRITE_TWIN, 10, 9, $5, $1, 255, 255, $a0, 0, TwinScript_0x5499a, $ffff
; 0x54be2

