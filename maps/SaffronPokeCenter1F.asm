SaffronPokeCenter1F_MapScriptHeader: ; 0x18a47b
	; trigger count
	db 0

	; callback count
	db 0
; 0x18a47d

NurseScript_0x18a47d: ; 0x18a47d
	jumpstd $0000
; 0x18a480

TeacherScript_0x18a480: ; 0x18a480
	special Function10630f
	iftrue UnknownScript_0x18a489
	jumptextfaceplayer UnknownText_0x18a4a3
; 0x18a489

UnknownScript_0x18a489: ; 0x18a489
	jumptextfaceplayer UnknownText_0x18a532
; 0x18a48c

FisherScript_0x18a48c: ; 0x18a48c
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18a49a
	writetext UnknownText_0x18a5d3
	closetext
	loadmovesprites
	end
; 0x18a49a

UnknownScript_0x18a49a: ; 0x18a49a
	writetext UnknownText_0x18a62e
	closetext
	loadmovesprites
	end
; 0x18a4a0

YoungsterScript_0x18a4a0: ; 0x18a4a0
	jumptextfaceplayer UnknownText_0x18a6c5
; 0x18a4a3

UnknownText_0x18a4a3: ; 0x18a4a3
	text "What are JOHTO's"
	line "#MON CENTERS"
	cont "like?"

	para "…Oh, I see. So"
	line "they're not much"

	para "different from the"
	line "ones in KANTO."

	para "I can go to JOHTO"
	line "without worrying,"
	cont "then!"
	done
; 0x18a532

UnknownText_0x18a532: ; 0x18a532
	text "What are JOHTO's"
	line "#MON CENTERS"
	cont "like?"

	para "…Oh, I see."
	line "So they let you"

	para "link with people"
	line "far away?"

	para "Then I'll get my"
	line "friend in JOHTO to"

	para "catch a MARILL and"
	line "trade it to me!"
	done
; 0x18a5d3

UnknownText_0x18a5d3: ; 0x18a5d3
	text "I just happened to"
	line "come through ROCK"

	para "TUNNEL. There was"
	line "some commotion at"
	cont "the POWER PLANT."
	done
; 0x18a62e

UnknownText_0x18a62e: ; 0x18a62e
	text "Caves collapse"
	line "easily."

	para "Several caves have"
	line "disappeared in the"

	para "past few years,"
	line "like the one out-"
	cont "side CERULEAN."

	para "As a pro HIKER,"
	line "that's common"
	cont "knowledge."
	done
; 0x18a6c5

UnknownText_0x18a6c5: ; 0x18a6c5
	text "SILPH CO.'s HEAD"
	line "OFFICE and the"

	para "MAGNET TRAIN STA-"
	line "TION--they're the"

	para "places to see in"
	line "SAFFRON."
	done
; 0x18a722

SaffronPokeCenter1F_MapEventHeader: ; 0x18a722
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $4, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x18a47d, $ffff
	person_event SPRITE_TEACHER, 6, 11, $2, $11, 255, 255, $a0, 0, TeacherScript_0x18a480, $ffff
	person_event SPRITE_FISHER, 10, 12, $8, $0, 255, 255, $80, 0, FisherScript_0x18a48c, $ffff
	person_event SPRITE_YOUNGSTER, 8, 5, $3, $0, 255, 255, $90, 0, YoungsterScript_0x18a4a0, $ffff
; 0x18a76b
