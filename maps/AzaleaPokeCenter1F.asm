const_value set 2
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1
	maptrigger .DummyTrigger

.MapCallbacks:
	db 0

.DummyTrigger:
	end

AzaleaPokeCenter1FNurseScript:
	jumpstd pokecenternurse

AzaleaPokeCenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokeCenter1FGentlemanText

AzaleaPokeCenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokeCenter1FFishingGuruText

AzaleaPokeCenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokeCenter1FPokefanFText

AzaleaPokeCenter1FGentlemanText:
	text "Do your #MON"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #MON has"
	line "fainted."
	done

AzaleaPokeCenter1FUnusedText:
	text "This BILL guy"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

AzaleaPokeCenter1FFishingGuruText:
	text "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

AzaleaPokeCenter1FPokefanFText:
	text "Do you know about"
	line "APRICORNS?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#MON with it."

	para "Before # BALLS"
	line "were invented,"

	para "everyone used"
	line "APRICORNS."
	done

AzaleaPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, AZALEA_TOWN
	warp_def $7, $4, 1, AZALEA_TOWN
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaPokeCenter1FNurseScript, -1
	person_event SPRITE_GENTLEMAN, 6, 9, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaPokeCenter1FGentlemanScript, -1
	person_event SPRITE_FISHING_GURU, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaPokeCenter1FFishingGuruScript, -1
	person_event SPRITE_POKEFAN_F, 4, 1, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AzaleaPokeCenter1FPokefanFScript, -1
