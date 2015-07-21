Route27SandstormHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SandstormHouseWoman:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	keeptextopen
	if_greater_than $95, .Loyal
	jump .Disloyal

.Loyal
	writetext SandstormHouseWomanLoyalText
	keeptextopen
	verbosegiveitem TM_SANDSTORM, 1
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

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_27, MAP_ROUTE_27
	warp_def $7, $3, 1, GROUP_ROUTE_27, MAP_ROUTE_27

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, SandstormHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, SandstormHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_GRANNY, 8, 6, OW_UP | $2, $0, -1, -1, $0, 0, SandstormHouseWoman, -1
