const_value set 2
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x18db27, 0

.MapCallbacks:
	db 0

UnknownScript_0x18db27:
	end

NurseScript_0x18db28:
	jumpstd pokecenternurse

GentlemanScript_0x18db2b:
	jumptextfaceplayer UnknownText_0x18db34

FishingGuruScript_0x18db2e:
	jumptextfaceplayer UnknownText_0x18dbee

PokefanFScript_0x18db31:
	jumptextfaceplayer UnknownText_0x18dc19

UnknownText_0x18db34:
	text "Do your #MON"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #MON has"
	line "fainted."
	done

UnknownText_0x18db88:
	text "This BILL guy"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

UnknownText_0x18dbee:
	text "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

UnknownText_0x18dc19:
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
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x18db28, -1
	person_event SPRITE_GENTLEMAN, 6, 9, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x18db2b, -1
	person_event SPRITE_FISHING_GURU, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x18db2e, -1
	person_event SPRITE_POKEFAN_F, 4, 1, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x18db31, -1
