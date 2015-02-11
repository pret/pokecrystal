Route27SandstormHouse_MapScriptHeader: ; 0x7b392
	; trigger count
	db 0

	; callback count
	db 0
; 0x7b394

GrannyScript_0x7b394: ; 0x7b394
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue UnknownScript_0x7b3b7
	special Function718d
	writetext UnknownText_0x7b3c6
	keeptextopen
	if_greater_than $95, UnknownScript_0x7b3aa
	jump UnknownScript_0x7b3bd
; 0x7b3aa

UnknownScript_0x7b3aa: ; 0x7b3aa
	writetext UnknownText_0x7b42b
	keeptextopen
	verbosegiveitem TM_37, 1
	iffalse UnknownScript_0x7b3bb
	setevent EVENT_GOT_TM37_SANDSTORM
UnknownScript_0x7b3b7: ; 0x7b3b7
	writetext UnknownText_0x7b48f
	closetext
UnknownScript_0x7b3bb: ; 0x7b3bb
	loadmovesprites
	end
; 0x7b3bd

UnknownScript_0x7b3bd: ; 0x7b3bd
	writetext UnknownText_0x7b51f
	closetext
	loadmovesprites
	end
; 0x7b3c3

MapRoute27SandstormHouseSignpost1Script: ; 0x7b3c3
	jumpstd $0003
; 0x7b3c6

UnknownText_0x7b3c6: ; 0x7b3c6
	text "Where are you off"
	line "to with #MON?"

	para "#MON LEAGUE?"

	para "Are your #MON"
	line "loyal enough for"
	cont "you to win?"

	para "Let me see…"
	done
; 0x7b42b

UnknownText_0x7b42b: ; 0x7b42b
	text "Ah! Your #MON"
	line "trusts you very"
	cont "much."

	para "It's nice to see a"
	line "good trainer."

	para "Here. A gift for"
	line "your journey."
	done
; 0x7b48f

UnknownText_0x7b48f: ; 0x7b48f
	text "TM37 happens to be"
	line "SANDSTORM."

	para "It's a move that"
	line "inflicts damage on"
	cont "both battlers."

	para "It's for advanced"
	line "trainers only."

	para "Use it if you"
	line "dare. Good luck!"
	done
; 0x7b51f

UnknownText_0x7b51f: ; 0x7b51f
	text "If it doesn't come"
	line "to trust you some"

	para "more, it could be"
	line "tough going."

	para "Trust is the tie"
	line "that binds #MON"
	cont "and trainers."
	done
; 0x7b592

Route27SandstormHouse_MapEventHeader: ; 0x7b592
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_27, MAP_ROUTE_27
	warp_def $7, $3, 1, GROUP_ROUTE_27, MAP_ROUTE_27

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute27SandstormHouseSignpost1Script
	signpost 1, 1, $0, MapRoute27SandstormHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_GRANNY, 8, 6, $6, $0, 255, 255, $0, 0, GrannyScript_0x7b394, $ffff
; 0x7b5b9

