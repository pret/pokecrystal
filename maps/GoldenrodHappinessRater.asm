GoldenrodHappinessRater_MapScriptHeader: ; 0x54951
	; trigger count
	db 0

	; callback count
	db 0
; 0x54953

TeacherScript_0x54953: ; 0x54953
	faceplayer
	loadfont
	special Function718d
	writetext UnknownText_0x549a3
	keeptextopen
	if_greater_than $f9, UnknownScript_0x54973
	if_greater_than $c7, UnknownScript_0x54979
	if_greater_than $95, UnknownScript_0x5497f
	if_greater_than $63, UnknownScript_0x54985
	if_greater_than $31, UnknownScript_0x5498b
	jump UnknownScript_0x54991
; 0x54973

UnknownScript_0x54973: ; 0x54973
	writetext UnknownText_0x549fc
	closetext
	loadmovesprites
	end
; 0x54979

UnknownScript_0x54979: ; 0x54979
	writetext UnknownText_0x54a2c
	closetext
	loadmovesprites
	end
; 0x5497f

UnknownScript_0x5497f: ; 0x5497f
	writetext UnknownText_0x54a5a
	closetext
	loadmovesprites
	end
; 0x54985

UnknownScript_0x54985: ; 0x54985
	writetext UnknownText_0x54a8e
	closetext
	loadmovesprites
	end
; 0x5498b

UnknownScript_0x5498b: ; 0x5498b
	writetext UnknownText_0x54a9f
	closetext
	loadmovesprites
	end
; 0x54991

UnknownScript_0x54991: ; 0x54991
	writetext UnknownText_0x54ad1
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
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_from_ram StringBuffer3
	text "…"
	done
; 0x549fc

UnknownText_0x549fc: ; 0x549fc
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done
; 0x54a2c

UnknownText_0x54a2c: ; 0x54a2c
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done
; 0x54a5a

UnknownText_0x54a5a: ; 0x54a5a
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done
; 0x54a8e

UnknownText_0x54a8e: ; 0x54a8e
	text "It's quite cute."
	done
; 0x54a9f

UnknownText_0x54a9f: ; 0x54a9f
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done
; 0x54ad1

UnknownText_0x54ad1: ; 0x54ad1
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done
; 0x54b04

UnknownText_0x54b04: ; 0x54b04
	text "I keep losing in"
	line "battles, and my"

	para "#MON end up"
	line "fainting…"

	para "Maybe that's why"
	line "my #MON don't"
	cont "like me much…"
	done
; 0x54b67

UnknownText_0x54b67: ; 0x54b67
	text "When I use an item"
	line "on my #MON, it"
	cont "acts really glad!"
	done
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

