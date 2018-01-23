const_value set 2
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x69b52:
	jumpstd pokecenternurse

FishingGuruScript_0x69b55:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue UnknownScript_0x69b7a
	writetext UnknownText_0x69b83
	yesorno
	iffalse UnknownScript_0x69b74
	writetext UnknownText_0x69be8
	buttonsound
	verbosegiveitem OLD_ROD
	writetext UnknownText_0x69c1b
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

UnknownScript_0x69b74:
	writetext UnknownText_0x69c6c
	waitbutton
	closetext
	end

UnknownScript_0x69b7a:
	writetext UnknownText_0x69c8d
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

UnknownText_0x69b83:
	text "This is a great"
	line "fishing spot."

	para "You saw people"
	line "fishing? How"
	cont "about you?"

	para "Would you like one"
	line "of my RODS?"
	done

UnknownText_0x69be8:
	text "Heh, that's good"
	line "to hear."

	para "Now you're an"
	line "angler too!"
	done

UnknownText_0x69c1b:
	text "Fishing is great!"

	para "If there's water,"
	line "be it the sea or a"

	para "stream, try out"
	line "your ROD."
	done

UnknownText_0x69c6c:
	text "Oh. That's rather"
	line "disappointing…"
	done

UnknownText_0x69c8d:
	text "Yo, kid. How are"
	line "they biting?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "What should I make"
	line "my #MON hold?"

	para "Maybe an item that"
	line "increases ATTACK"
	cont "power…"
	done

Route32Pokecenter1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 3, 7, 1, ROUTE_32
	warp_def 4, 7, 1, ROUTE_32
	warp_def 0, 7, 1, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 3
	object_event 3, 1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NurseScript_0x69b52, -1
	object_event 1, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x69b55, -1
	object_event 6, 2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
