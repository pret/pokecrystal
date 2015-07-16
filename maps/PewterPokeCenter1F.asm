PewterPokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x1a2ee7:
	jumpstd pokecenternurse

TeacherScript_0x1a2eea:
	jumptextfaceplayer UnknownText_0x1a2f01

JigglypuffScript_0x1a2eed:
	loadfont
	writetext UnknownText_0x1a2f5d
	cry JIGGLYPUFF
	closetext
	loadmovesprites
	end

BugCatcherScript_0x1a2ef7:
	jumptextfaceplayer UnknownText_0x1a2f75

PokefanMScript_0x1a2efa:
	faceplayer
	loadfont
	trade $4
	closetext
	loadmovesprites
	end

UnknownText_0x1a2f01:
	text "…Yeah, and the"
	line "GYM in CINNABAR's"

	para "gone. I was really"
	line "amazed."

	para "…Yes? I'm on the"
	line "phone. Go away!"
	done

UnknownText_0x1a2f5d:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

UnknownText_0x1a2f75:
	text "Most #MON get"
	line "drowsy if they"

	para "hear a JIGGLYPUFF"
	line "singing."

	para "There are several"
	line "moves that can be"

	para "used only while a"
	line "#MON is asleep."
	done

PewterPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $4, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 7, UP << 2 | $2, $0, -1, -1, $0, 0, NurseScript_0x1a2ee7, -1
	person_event SPRITE_TEACHER, 10, 12, UP << 2 | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, TeacherScript_0x1a2eea, -1
	person_event SPRITE_JIGGLYPUFF, 7, 5, UP << 2 | $12, $0, -1, -1, $0, 0, JigglypuffScript_0x1a2eed, -1
	person_event SPRITE_BUG_CATCHER, 7, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, BugCatcherScript_0x1a2ef7, -1
	person_event SPRITE_POKEFAN_M, 6, 11, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanMScript_0x1a2efa, -1
