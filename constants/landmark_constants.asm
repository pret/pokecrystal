; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const NEW_BARK_TOWN     ; 01
	const ROUTE_29          ; 02
	const CHERRYGROVE_CITY  ; 03
	const ROUTE_30          ; 04
	const ROUTE_31          ; 05
	const VIOLET_CITY       ; 06
	const SPROUT_TOWER      ; 07
	const ROUTE_32          ; 08
	const RUINS_OF_ALPH     ; 09
	const UNION_CAVE        ; 0a
	const ROUTE_33          ; 0b
	const AZALEA_TOWN       ; 0c
	const SLOWPOKE_WELL     ; 0d
	const ILEX_FOREST       ; 0e
	const ROUTE_34          ; 0f
	const GOLDENROD_CITY    ; 10
	const RADIO_TOWER       ; 11
	const ROUTE_35          ; 12
	const NATIONAL_PARK     ; 13
	const ROUTE_36          ; 14
	const ROUTE_37          ; 15
	const ECRUTEAK_CITY     ; 16
	const TIN_TOWER         ; 17
	const BURNED_TOWER      ; 18
	const ROUTE_38          ; 19
	const ROUTE_39          ; 1a
	const OLIVINE_CITY      ; 1b
	const LIGHTHOUSE        ; 1c
	const BATTLE_TOWER      ; 1d
	const ROUTE_40          ; 1e
	const WHIRL_ISLANDS     ; 1f
	const ROUTE_41          ; 20
	const CIANWOOD_CITY     ; 21
	const ROUTE_42          ; 22
	const MT_MORTAR         ; 23
	const MAHOGANY_TOWN     ; 24
	const ROUTE_43          ; 25
	const LAKE_OF_RAGE      ; 26
	const ROUTE_44          ; 27
	const ICE_PATH          ; 28
	const BLACKTHORN_CITY   ; 29
	const DRAGONS_DEN       ; 2a
	const ROUTE_45          ; 2b
	const DARK_CAVE         ; 2c
	const ROUTE_46          ; 2d
	const SILVER_CAVE       ; 2e

KANTO_LANDMARK EQU const_value
	const PALLET_TOWN       ; 2f
	const ROUTE_1           ; 30
	const VIRIDIAN_CITY     ; 31
	const ROUTE_2           ; 32
	const PEWTER_CITY       ; 33
	const ROUTE_3           ; 34
	const MT_MOON           ; 35
	const ROUTE_4           ; 36
	const CERULEAN_CITY     ; 37
	const ROUTE_24          ; 38
	const ROUTE_25          ; 39
	const ROUTE_5           ; 3a
	const UNDERGROUND_PATH  ; 3b
	const ROUTE_6           ; 3c
	const VERMILION_CITY    ; 3d
	const DIGLETTS_CAVE     ; 3e
	const ROUTE_7           ; 3f
	const ROUTE_8           ; 40
	const ROUTE_9           ; 41
	const ROCK_TUNNEL       ; 42
	const ROUTE_10          ; 43
	const POWER_PLANT       ; 44
	const LAVENDER_TOWN     ; 45
	const LAV_RADIO_TOWER   ; 46
	const CELADON_CITY      ; 47
	const SAFFRON_CITY      ; 48
	const ROUTE_11          ; 49
	const ROUTE_12          ; 4a
	const ROUTE_13          ; 4b
	const ROUTE_14          ; 4c
	const ROUTE_15          ; 4d
	const ROUTE_16          ; 4e
	const ROUTE_17          ; 4f
	const ROUTE_18          ; 50
	const FUCHSIA_CITY      ; 51
	const ROUTE_19          ; 52
	const ROUTE_20          ; 53
	const SEAFOAM_ISLANDS   ; 54
	const CINNABAR_ISLAND   ; 55
	const ROUTE_21          ; 56
	const ROUTE_22          ; 57
	const VICTORY_ROAD      ; 58
	const ROUTE_23          ; 59
	const INDIGO_PLATEAU    ; 5a
	const ROUTE_26          ; 5b
	const ROUTE_27          ; 5c
	const TOHJO_FALLS       ; 5d
	const ROUTE_28          ; 5e
	const FAST_SHIP         ; 5f

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
