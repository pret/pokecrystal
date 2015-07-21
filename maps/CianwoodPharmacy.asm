CianwoodPharmacy_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw CianwoodPharmacyTrigger, $0000

.MapCallbacks:
	db 0

CianwoodPharmacyTrigger:
	end

CianwoodPharmacist:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	keeptextopen
	giveitem SECRETPOTION, 1
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitbutton
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	closetext
	loadmovesprites
	end

.Mart
	pokemart $3, $0004
	loadmovesprites
	end

CianwoodPharmacyBookshelf:
	jumpstd difficultbookshelf

PharmacistGiveSecretpotionText:
	text "Your #MON ap-"
	line "pear to be fine."

	para "Is something wor- "
	line "rying you?"

	para "…"

	para "The LIGHTHOUSE"
	line "#MON is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> received"
	line "SECRETPOTION."
	done

PharmacistDescribeSecretpotionText:
	text "My SECRETPOTION is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done

CianwoodPharmacy_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CianwoodPharmacyBookshelf
	signpost 1, 1, SIGNPOST_READ, CianwoodPharmacyBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_PHARMACIST, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CianwoodPharmacist, -1
