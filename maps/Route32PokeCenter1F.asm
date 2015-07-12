Route32PokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x69b52:
	jumpstd pokecenternurse

FishingGuruScript_0x69b55:
	faceplayer
	loadfont
	checkevent EVENT_GOT_OLD_ROD
	iftrue UnknownScript_0x69b7a
	writetext UnknownText_0x69b83
	yesorno
	iffalse UnknownScript_0x69b74
	writetext UnknownText_0x69be8
	keeptextopen
	verbosegiveitem OLD_ROD, 1
	writetext UnknownText_0x69c1b
	closetext
	loadmovesprites
	setevent EVENT_GOT_OLD_ROD
	end

UnknownScript_0x69b74:
	writetext UnknownText_0x69c6c
	closetext
	loadmovesprites
	end

UnknownScript_0x69b7a:
	writetext UnknownText_0x69c8d
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x69b80:
	jumptextfaceplayer UnknownText_0x69cac

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

UnknownText_0x69cac:
	text "What should I make"
	line "my #MON hold?"

	para "Maybe an item that"
	line "increases ATTACK"
	cont "power…"
	done

Route32PokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_32, MAP_ROUTE_32
	warp_def $7, $4, 1, GROUP_ROUTE_32, MAP_ROUTE_32
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x69b52, EVENT_ALWAYS_THERE
	person_event SPRITE_FISHING_GURU, 8, 5, $6, $0, 255, 255, $a0, 0, FishingGuruScript_0x69b55, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 6, 10, $6, $0, 255, 255, $80, 0, CooltrainerFScript_0x69b80, EVENT_ALWAYS_THERE
