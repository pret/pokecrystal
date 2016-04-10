const_value set 2
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeofRageHiddenPowerHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	buttonsound
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
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

.Warps:
	db 2
	warp_def $7, $2, 1, LAKE_OF_RAGE
	warp_def $7, $3, 1, LAKE_OF_RAGE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, HiddenPowerHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, HiddenPowerHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_FISHER, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, HiddenPowerGuy, -1
