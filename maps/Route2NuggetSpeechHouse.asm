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
	2writetext UnknownText_0x9b865
	keeptextopen
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x9b860
	setevent $00c8
UnknownScript_0x9b85c: ; 0x9b85c
	2writetext UnknownText_0x9b8e5
	closetext
UnknownScript_0x9b860: ; 0x9b860
	loadmovesprites
	end
; 0x9b862

UnknownScript_0x9b862: ; 0x9b862
	jumpstd $0001
; 0x9b865

UnknownText_0x9b865: ; 0x9b865
	db $0, "Hi! Wow, I'm glad", $4f
	db "to see you.", $51
	db "You're the first", $4f
	db "visitor I've had", $55
	db "in a long time.", $51
	db "I'm super-happy!", $4f
	db "Let me give you a", $55
	db "little present.", $57
; 0x9b8e5

UnknownText_0x9b8e5: ; 0x9b8e5
	db $0, "That's a NUGGET.", $51
	db "I can't give you", $4f
	db "any nuggets of", $51
	db "wisdom, so that'll", $4f
	db "have to do!", $57
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

