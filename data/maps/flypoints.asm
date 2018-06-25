flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint NEW_BARK,     NEW_BARK_TOWN
	flypoint CHERRYGROVE,  CHERRYGROVE_CITY
	flypoint VIOLET,       VIOLET_CITY
	flypoint AZALEA,       AZALEA_TOWN
	flypoint GOLDENROD,    GOLDENROD_CITY
	flypoint ECRUTEAK,     ECRUTEAK_CITY
	flypoint OLIVINE,      OLIVINE_CITY
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint MAHOGANY,     MAHOGANY_TOWN
	flypoint LAKE_OF_RAGE, LAKE_OF_RAGE
	flypoint BLACKTHORN,   BLACKTHORN_CITY
	flypoint MT_SILVER,    SILVER_CAVE

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint PALLET,       PALLET_TOWN
	flypoint VIRIDIAN,     VIRIDIAN_CITY
	flypoint PEWTER,       PEWTER_CITY
	flypoint CERULEAN,     CERULEAN_CITY
	flypoint VERMILION,    VERMILION_CITY
	flypoint ROCK_TUNNEL,  ROCK_TUNNEL
	flypoint LAVENDER,     LAVENDER_TOWN
	flypoint CELADON,      CELADON_CITY
	flypoint SAFFRON,      SAFFRON_CITY
	flypoint FUCHSIA,      FUCHSIA_CITY
	flypoint CINNABAR,     CINNABAR_ISLAND
	flypoint INDIGO,       INDIGO_PLATEAU
	db -1
