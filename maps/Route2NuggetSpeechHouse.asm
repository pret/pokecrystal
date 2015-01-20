Route2NuggetSpeechHouse_MapScriptHeader: ; 0x9b845
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b847

FisherScript_0x9b847: ; 0x9b847
	faceplayer
	loadfont
	checkevent $00c8
	iftrue UnknownScript_0x9b85c
	writetext UnknownText_0x9b865
	keeptextopen
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x9b860
	setevent $00c8
UnknownScript_0x9b85c: ; 0x9b85c
	writetext UnknownText_0x9b8e5
	closetext
UnknownScript_0x9b860: ; 0x9b860
	loadmovesprites
	end
; 0x9b862

UnknownScript_0x9b862: ; 0x9b862
	jumpstd $0001
; 0x9b865

UnknownText_0x9b865: ; 0x9b865
	text "Hi! Wow, I'm glad"
	line "to see you."

	para "You're the first"
	line "visitor I've had"
	cont "in a long time."

	para "I'm super-happy!"
	line "Let me give you a"
	cont "little present."
	done
; 0x9b8e5

UnknownText_0x9b8e5: ; 0x9b8e5
	text "That's a NUGGET."

	para "I can't give you"
	line "any nuggets of"

	para "wisdom, so that'll"
	line "have to do!"
	done
; 0x9b933

Route2NuggetSpeechHouse_MapEventHeader: ; 0x9b933
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_2, MAP_ROUTE_2
	warp_def $7, $3, 1, GROUP_ROUTE_2, MAP_ROUTE_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_FISHER, 8, 6, $4, $20, 255, 255, $90, 0, FisherScript_0x9b847, $ffff
; 0x9b950

