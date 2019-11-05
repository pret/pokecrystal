	object_const_def ; object_event constants
	const ROUTE39BARN_TWIN1
	const ROUTE39BARN_TWIN2
	const ROUTE39BARN_MOOMOO

Route39Barn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39BarnTwin1Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

Route39BarnTwin2Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

MoomooScript:
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .HappyCow
	writetext MoomooWeakMooText
	setval MILTANK
	special PlaySlowCry
	promptbutton
	writetext Route39BarnItsCryIsWeakText
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue .GiveBerry
	waitbutton
	closetext
	end

.GiveBerry:
	promptbutton
	writetext Route39BarnAskGiveBerryText
	yesorno
	iffalse .Refused
	checkitem BERRY
	iffalse .NoBerriesInBag
	takeitem BERRY
	readmem wMooMooBerries
	addval 1
	writemem wMooMooBerries
	ifequal 3, .ThreeBerries
	ifequal 5, .FiveBerries
	ifequal 7, .SevenBerries
	writetext Route39BarnGaveBerryText
	waitbutton
	closetext
	end

.ThreeBerries:
	writetext Route39BarnGaveBerryText
	promptbutton
	writetext Route39BarnLittleHealthierText
	waitbutton
	closetext
	end

.FiveBerries:
	writetext Route39BarnGaveBerryText
	promptbutton
	writetext Route39BarnQuiteHealthyText
	waitbutton
	closetext
	end

.SevenBerries:
	playmusic MUSIC_HEAL
	writetext Route39BarnGaveBerryText
	pause 60
	promptbutton
	special RestartMapMusic
	writetext Route39BarnTotallyHealthyText
	waitbutton
	closetext
	setevent EVENT_HEALED_MOOMOO
	end

.NoBerriesInBag:
	writetext Route39BarnNoBerriesText
	waitbutton
	closetext
	end

.Refused:
	writetext Route39BarnRefusedBerryText
	waitbutton
	closetext
	end

.HappyCow:
	writetext MoomooHappyMooText
	cry MILTANK
	waitbutton
	closetext
	end

Route39BarnTwinMoomooIsSickText:
	text "MOOMOO is sick…"

	para "She needs lots of"
	line "BERRIES."
	done

Route39BarnTwinWereFeedingMoomooText:
	text "We're feeding"
	line "MOOMOO!"
	done

MoomooWeakMooText:
	text "MILTANK: …Moo…"
	done

Route39BarnItsCryIsWeakText:
	text "Its cry is weak…"
	done

MoomooHappyMooText:
	text "MILTANK: Mooo!"
	done

Route39BarnAskGiveBerryText:
	text "Give a BERRY to"
	line "MILTANK?"
	done

Route39BarnGaveBerryText:
	text "<PLAYER> gave a"
	line "BERRY to MILTANK."
	done

Route39BarnLittleHealthierText:
	text "MILTANK became a"
	line "little healthier!"
	done

Route39BarnQuiteHealthyText:
	text "MILTANK became"
	line "quite healthy!"
	done

Route39BarnTotallyHealthyText:
	text "MILTANK became"
	line "totally healthy!"
	done

Route39BarnNoBerriesText:
	text "<PLAYER> has no"
	line "BERRIES…"
	done

Route39BarnRefusedBerryText:
	text "<PLAYER> wouldn't"
	line "give a BERRY."

	para "MILTANK looks sad."
	done

Route39Barn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ROUTE_39, 1
	warp_event  4,  7, ROUTE_39, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin1Script, -1
	object_event  4,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin2Script, -1
	object_event  3,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
