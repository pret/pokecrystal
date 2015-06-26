Route27SandstormHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SandstormHouseWoman:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special Function718d
	writetext SandstormHouseWomanText1
	keeptextopen
	if_greater_than $95, .Loyal
	jump .Disloyal

.Loyal
	writetext SandstormHouseWomanLoyalText
	keeptextopen
	verbosegiveitem TM_37, 1
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem
	writetext SandstormHouseSandstormDescription
	closetext
.Done
	loadmovesprites
	end

.Disloyal
	writetext SandstormHouseWomanDisloyalText
	closetext
	loadmovesprites
	end

SandstormHouseBookshelf:
	jumpstd magazinebookshelf

SandstormHouseWomanText1:
	text "Where are you off"
	line "to with #MON?"

	para "#MON LEAGUE?"

	para "Are your #MON"
	line "loyal enough for"
	cont "you to win?"

	para "Let me see…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! Your #MON"
	line "trusts you very"
	cont "much."

	para "It's nice to see a"
	line "good trainer."

	para "Here. A gift for"
	line "your journey."
	done

SandstormHouseSandstormDescription:
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

SandstormHouseWomanDisloyalText:
	text "If it doesn't come"
	line "to trust you some"

	para "more, it could be"
	line "tough going."

	para "Trust is the tie"
	line "that binds #MON"
	cont "and trainers."
	done

Route27SandstormHouse_MapEventHeader:
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
	signpost 1, 0, $0, SandstormHouseBookshelf
	signpost 1, 1, $0, SandstormHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_GRANNY, 8, 6, $6, $0, 255, 255, $0, 0, SandstormHouseWoman, $ffff
