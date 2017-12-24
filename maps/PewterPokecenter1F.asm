const_value set 2
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_TEACHER
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_CHRIS

PewterPokecenter1F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x1a2ee7:
	jumpstd pokecenternurse

PewterPokecenter1FTeacherScript:
	jumptextfaceplayer PewterPokecenter1FTeacherText

PewterJigglypuff:
	opentext
	writetext PewterJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

PewterPokecenter1FBugCatcherScript:
	jumptextfaceplayer PewterPokecenter1FBugCatcherText

Chris:
	faceplayer
	opentext
	trade NPCTRADE_CHRIS
	waitbutton
	closetext
	end

PewterPokecenter1FTeacherText:
	text "…Yeah, and the"
	line "GYM in CINNABAR's"

	para "gone. I was really"
	line "amazed."

	para "…Yes? I'm on the"
	line "phone. Go away!"
	done

PewterJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

PewterPokecenter1FBugCatcherText:
	text "Most #MON get"
	line "drowsy if they"

	para "hear a JIGGLYPUFF"
	line "singing."

	para "There are several"
	line "moves that can be"

	para "used only while a"
	line "#MON is asleep."
	done

PewterPokecenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 4, PEWTER_CITY
	warp_def $7, $4, 4, PEWTER_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 5
	object_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NurseScript_0x1a2ee7, -1
	object_event SPRITE_TEACHER, 6, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FTeacherScript, -1
	object_event SPRITE_JIGGLYPUFF, 3, 1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterJigglypuff, -1
	object_event SPRITE_BUG_CATCHER, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FBugCatcherScript, -1
	object_event SPRITE_POKEFAN_M, 2, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Chris, -1
