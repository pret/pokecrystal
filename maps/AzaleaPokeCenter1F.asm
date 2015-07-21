AzaleaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x18db27, $0000

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
	warp_def $7, $3, 1, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $4, 1, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x18db28, -1
	person_event SPRITE_GENTLEMAN, 10, 13, OW_UP | $0, $10, -1, -1, $0, 0, GentlemanScript_0x18db2b, -1
	person_event SPRITE_FISHING_GURU, 5, 10, OW_UP | $2, $0, -1, -1, $0, 0, FishingGuruScript_0x18db2e, -1
	person_event SPRITE_POKEFAN_F, 8, 5, OW_DOWN | $2, $21, -1, -1, $0, 0, PokefanFScript_0x18db31, -1
