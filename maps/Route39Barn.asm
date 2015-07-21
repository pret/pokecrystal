Route39Barn_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TwinScript_0x9cc76:
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cc87
	writetext UnknownText_0x9cd2e
	closetext
	loadmovesprites
	spriteface $2, RIGHT
	end

UnknownScript_0x9cc87:
	writetext UnknownText_0x9cd5a
	closetext
	loadmovesprites
	spriteface $2, RIGHT
	end

TwinScript_0x9cc90:
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cca1
	writetext UnknownText_0x9cd2e
	closetext
	loadmovesprites
	spriteface $3, LEFT
	end

UnknownScript_0x9cca1:
	writetext UnknownText_0x9cd5a
	closetext
	loadmovesprites
	spriteface $3, LEFT
	end

TaurosScript_0x9ccaa:
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cd25
	writetext UnknownText_0x9cd70
	writebyte MILTANK
	special Functionfb841
	keeptextopen
	writetext UnknownText_0x9cd80
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue UnknownScript_0x9ccc6
	closetext
	loadmovesprites
	end

UnknownScript_0x9ccc6:
	keeptextopen
	writetext UnknownText_0x9cda2
	yesorno
	iffalse UnknownScript_0x9cd1f
	checkitem BERRY
	iffalse UnknownScript_0x9cd19
	takeitem BERRY, 1
	copybytetovar MooMooBerries
	addvar $1
	copyvartobyte MooMooBerries
	if_equal $3, UnknownScript_0x9ccf0
	if_equal $5, UnknownScript_0x9ccfa
	if_equal $7, UnknownScript_0x9cd04
	writetext UnknownText_0x9cdbc
	closetext
	loadmovesprites
	end

UnknownScript_0x9ccf0:
	writetext UnknownText_0x9cdbc
	keeptextopen
	writetext UnknownText_0x9cdd8
	closetext
	loadmovesprites
	end

UnknownScript_0x9ccfa:
	writetext UnknownText_0x9cdbc
	keeptextopen
	writetext UnknownText_0x9cdfc
	closetext
	loadmovesprites
	end

UnknownScript_0x9cd04:
	playmusic MUSIC_HEAL
	writetext UnknownText_0x9cdbc
	pause 60
	keeptextopen
	special RestartMapMusic
	writetext UnknownText_0x9ce1b
	closetext
	loadmovesprites
	setevent EVENT_HEALED_MOOMOO
	end

UnknownScript_0x9cd19:
	writetext UnknownText_0x9ce3c
	closetext
	loadmovesprites
	end

UnknownScript_0x9cd1f:
	writetext UnknownText_0x9ce4f
	closetext
	loadmovesprites
	end

UnknownScript_0x9cd25:
	writetext UnknownText_0x9cd92
	cry MILTANK
	closetext
	loadmovesprites
	end

UnknownText_0x9cd2e:
	text "MOOMOO is sick…"

	para "She needs lots of"
	line "BERRIES."
	done

UnknownText_0x9cd5a:
	text "We're feeding"
	line "MOOMOO!"
	done

UnknownText_0x9cd70:
	text "MILTANK: …Moo…"
	done

UnknownText_0x9cd80:
	text "Its cry is weak…"
	done

UnknownText_0x9cd92:
	text "MILTANK: Mooo!"
	done

UnknownText_0x9cda2:
	text "Give a BERRY to"
	line "MILTANK?"
	done

UnknownText_0x9cdbc:
	text "<PLAYER> gave a"
	line "BERRY to MILTANK."
	done

UnknownText_0x9cdd8:
	text "MILTANK became a"
	line "little healthier!"
	done

UnknownText_0x9cdfc:
	text "MILTANK became"
	line "quite healthy!"
	done

UnknownText_0x9ce1b:
	text "MILTANK became"
	line "totally healthy!"
	done

UnknownText_0x9ce3c:
	text "<PLAYER> has no"
	line "BERRIES…"
	done

UnknownText_0x9ce4f:
	text "<PLAYER> wouldn't"
	line "give a BERRY."

	para "MILTANK looks sad."
	done

Route39Barn_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 1, GROUP_ROUTE_39, MAP_ROUTE_39
	warp_def $7, $4, 1, GROUP_ROUTE_39, MAP_ROUTE_39

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_TWIN, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, TwinScript_0x9cc76, -1
	person_event SPRITE_TWIN, 7, 8, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, TwinScript_0x9cc90, -1
	person_event SPRITE_TAUROS, 7, 7, OW_UP | $12, $0, -1, -1, $0, 0, TaurosScript_0x9ccaa, -1
