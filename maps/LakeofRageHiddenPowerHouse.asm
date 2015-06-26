LakeofRageHiddenPowerHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

HiddenPowerGuy:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	keeptextopen
	verbosegiveitem TM_10, 1
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	closetext
	loadmovesprites
	end
.AlreadyGotItem
	writetext HiddenPowerGuyText3
	closetext
.Done
	loadmovesprites
	end

HiddenPowerHouseBookshelf:
	jumpstd difficultbookshelf

HiddenPowerGuyText1:
	text "…You have strayed"
	line "far…"

	para "Here I have medi-"
	line "tated. Inside me,"

	para "a new power has"
	line "been awakened."

	para "Let me share my"
	line "power with your"

	para "#MON."
	line "Take this, child."
	done

HiddenPowerGuyText2:
	text "Do you see it? It"
	line "is HIDDEN POWER!"

	para "It draws out the"
	line "power of #MON"
	cont "for attacking."

	para "Remember this: its"
	line "type and power de-"
	cont "pend on the #-"
	cont "MON using it."
	done

HiddenPowerGuyText3:
	text "I am meditating…"
	done

LakeofRageHiddenPowerHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE
	warp_def $7, $3, 1, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, HiddenPowerHouseBookshelf
	signpost 1, 1, $0, HiddenPowerHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_FISHER, 7, 6, $3, $0, 255, 255, $0, 0, HiddenPowerGuy, $ffff
