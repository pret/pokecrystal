GROUP_N_A  EQU -1
MAP_N_A    EQU -1
GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map header struct members (see maps/map_headers.asm)
	const_def
	const MAPHEADER_MAPHEADER2_BANK ; 0
	const MAPHEADER_TILESET         ; 1
	const MAPHEADER_ENVIRONMENT     ; 2
	const MAPHEADER_MAPHEADER2      ; 3
	const MAPHEADER_MAPHEADER2_HI   ; 4
	const MAPHEADER_LOCATION        ; 5
	const MAPHEADER_MUSIC           ; 6
	const MAPHEADER_PALETTE         ; 7
	const MAPHEADER_FISHGROUP       ; 8
NUM_MAPHEADER_ATTRIBUTES EQU const_value

; map environments (wEnvironment)
const_value set 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

; fish groups
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_DRATINI
	const FISHGROUP_QWILFISH_SWARM
	const FISHGROUP_REMORAID_SWARM
	const FISHGROUP_GYARADOS
	const FISHGROUP_DRATINI_2
	const FISHGROUP_WHIRL_ISLANDS
	const FISHGROUP_QWILFISH
	const FISHGROUP_REMORAID
	const FISHGROUP_QWILFISH_NO_SWARM


; connection directions
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; MapConnections
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH


; object_struct members (see macros/wram.asm)
	const_def
	const OBJECT_SPRITE              ; 00
	const OBJECT_MAP_OBJECT_INDEX    ; 01
	const OBJECT_SPRITE_TILE         ; 02
	const OBJECT_MOVEMENTTYPE        ; 03
	const OBJECT_FLAGS1              ; 04
	const OBJECT_FLAGS2              ; 05
	const OBJECT_PALETTE             ; 06
	const OBJECT_DIRECTION_WALKING   ; 07
	const OBJECT_FACING              ; 08
	const OBJECT_STEP_TYPE           ; 09
	const OBJECT_STEP_DURATION       ; 0a
	const OBJECT_ACTION              ; 0b
	const OBJECT_STEP_FRAME          ; 0c
	const OBJECT_FACING_STEP         ; 0d
	const OBJECT_NEXT_TILE           ; 0e
	const OBJECT_STANDING_TILE       ; 0f
	const OBJECT_NEXT_MAP_X          ; 10
	const OBJECT_NEXT_MAP_Y          ; 11
	const OBJECT_MAP_X               ; 12
	const OBJECT_MAP_Y               ; 13
	const OBJECT_INIT_X              ; 14
	const OBJECT_INIT_Y              ; 15
	const OBJECT_RADIUS              ; 16
	const OBJECT_SPRITE_X            ; 17
	const OBJECT_SPRITE_Y            ; 18
	const OBJECT_SPRITE_X_OFFSET     ; 19
	const OBJECT_SPRITE_Y_OFFSET     ; 1a
	const OBJECT_MOVEMENT_BYTE_INDEX ; 1b
	const OBJECT_1C                  ; 1c
	const OBJECT_1D                  ; 1d
	const OBJECT_1E                  ; 1e
	const OBJECT_1F                  ; 1f
	const OBJECT_RANGE               ; 20
	; 21-27 are not used
OBJECT_STRUCT_LENGTH EQU 40
NUM_OBJECT_STRUCTS EQU 13 ; see ObjectStructs

; map_object struct members (see macros/wram.asm)
	const_def
	const MAPOBJECT_OBJECT_STRUCT_ID ; 0
	const MAPOBJECT_SPRITE ; 1
	const MAPOBJECT_Y_COORD ; 2
	const MAPOBJECT_X_COORD ; 3
	const MAPOBJECT_MOVEMENT ; 4
	const MAPOBJECT_RADIUS ; 5
	const MAPOBJECT_HOUR ; 6
	const MAPOBJECT_TIMEOFDAY ; 7
	const MAPOBJECT_COLOR ; 8
	const MAPOBJECT_RANGE ; 9
	const MAPOBJECT_SCRIPT_POINTER ; a
	const MAPOBJECT_POINTER_HI ; b
	const MAPOBJECT_EVENT_FLAG ; c
	const MAPOBJECT_FLAG_HI ; d
	const MAPOBJECT_E ; unused
	const MAPOBJECT_F ; unused
OBJECT_LENGTH EQU const_value

MAPOBJECT_SCREEN_HEIGHT EQU 11
MAPOBJECT_SCREEN_WIDTH EQU 12

; object_struct OBJECT_FACING values
OW_DOWN  EQU DOWN  << 2
OW_UP    EQU UP    << 2
OW_LEFT  EQU LEFT  << 2
OW_RIGHT EQU RIGHT << 2

; object_struct OBJECT_FLAGS1 bit flags
INVISIBLE    EQU 0
FIXED_FACING EQU 2
SLIDING      EQU 3
EMOTE_OBJECT EQU 7


; see engine/overworld.asm
MAX_OUTDOOR_SPRITES EQU 23
SPRITE_GFX_LIST_CAPACITY EQU $20


; SpawnPoints indexes (see data/maps/spawn_points.asm)
const_value = -1
	const SPAWN_N_A
	const SPAWN_HOME
	const SPAWN_DEBUG
; kanto
	const SPAWN_PALLET
	const SPAWN_VIRIDIAN
	const SPAWN_PEWTER
	const SPAWN_CERULEAN
	const SPAWN_ROCK_TUNNEL
	const SPAWN_VERMILION
	const SPAWN_LAVENDER
	const SPAWN_SAFFRON
	const SPAWN_CELADON
	const SPAWN_FUCHSIA
	const SPAWN_CINNABAR
	const SPAWN_INDIGO
; johto
	const SPAWN_NEW_BARK
	const SPAWN_CHERRYGROVE
	const SPAWN_VIOLET
	const SPAWN_UNION_CAVE
	const SPAWN_AZALEA
	const SPAWN_CIANWOOD
	const SPAWN_GOLDENROD
	const SPAWN_OLIVINE
	const SPAWN_ECRUTEAK
	const SPAWN_MAHOGANY
	const SPAWN_LAKE
	const SPAWN_BLACKTHORN
	const SPAWN_MT_SILVER
	const SPAWN_FAST_SHIP
NUM_SPAWNS EQU const_value


; treemon sets
; TreeMons indexes (see data/wild/treemons.asm)
	const_def
	const TREEMON_SET_CITY
	const TREEMON_SET_CANYON
	const TREEMON_SET_AZALEA
	const TREEMON_SET_ROUTE
	const TREEMON_SET_KANTO
	const TREEMON_SET_LAKE
	const TREEMON_SET_FOREST
	const TREEMON_SET_ROCK
NUM_TREEMON_SETS EQU const_value

; treemon scores
	const_def
	const TREEMON_SCORE_BAD  ; 0
	const TREEMON_SCORE_GOOD ; 1
	const TREEMON_SCORE_RARE ; 2


; TryBGEvent arguments (see engine/events.asm)
	const_def
	const BGEVENT_READ
	const BGEVENT_UP
	const BGEVENT_DOWN
	const BGEVENT_RIGHT
	const BGEVENT_LEFT
	const BGEVENT_IFSET
	const BGEVENT_IFNOTSET
	const BGEVENT_ITEM
	const BGEVENT_COPY

; object_event types
; TryObjectEvent arguments (see engine/events.asm)
	const_def
	const OBJECTTYPE_SCRIPT
	const OBJECTTYPE_ITEMBALL
	const OBJECTTYPE_TRAINER
	const OBJECTTYPE_3
	const OBJECTTYPE_4
	const OBJECTTYPE_5
	const OBJECTTYPE_6


; Emotes indexes (see data/sprites/emotes.asm)
	const_def
	const EMOTE_SHOCK ; 0
	const EMOTE_QUESTION ; 1
	const EMOTE_HAPPY ; 2
	const EMOTE_SAD ; 3
	const EMOTE_HEART ; 4
	const EMOTE_BOLT ; 5
	const EMOTE_SLEEP ; 6
	const EMOTE_FISH ; 7
	const EMOTE_SHADOW ; 8
	const EMOTE_ROD ; 9
	const EMOTE_BOULDER_DUST ; 10
	const EMOTE_GRASS_RUSTLE ; 11
EMOTE_MEM EQU -1

; FruitTreeItems indexes (see data/items/fruit_trees.asm)
; used by fruittree command
const_value set 1
	const FRUITTREE_ROUTE_29      ; 01
	const FRUITTREE_ROUTE_30_1    ; 02
	const FRUITTREE_ROUTE_38      ; 03
	const FRUITTREE_ROUTE_46_1    ; 04
	const FRUITTREE_ROUTE_30_2    ; 05
	const FRUITTREE_ROUTE_33      ; 06
	const FRUITTREE_ROUTE_31      ; 07
	const FRUITTREE_ROUTE_43      ; 08
	const FRUITTREE_VIOLET_CITY   ; 09
	const FRUITTREE_ROUTE_46_2    ; 0a
	const FRUITTREE_ROUTE_35      ; 0b
	const FRUITTREE_ROUTE_45      ; 0c
	const FRUITTREE_ROUTE_36      ; 0d
	const FRUITTREE_ROUTE_26      ; 0e
	const FRUITTREE_ROUTE_39      ; 0f
	const FRUITTREE_ROUTE_44      ; 10
	const FRUITTREE_ROUTE_37_1    ; 11
	const FRUITTREE_ROUTE_37_2    ; 12
	const FRUITTREE_ROUTE_37_3    ; 13
	const FRUITTREE_AZALEA_TOWN   ; 14
	const FRUITTREE_ROUTE_42_1    ; 15
	const FRUITTREE_ROUTE_42_2    ; 16
	const FRUITTREE_ROUTE_42_3    ; 17
	const FRUITTREE_ROUTE_11      ; 18
	const FRUITTREE_ROUTE_2       ; 19
	const FRUITTREE_ROUTE_1       ; 1a
	const FRUITTREE_ROUTE_8       ; 1b
	const FRUITTREE_PEWTER_CITY_1 ; 1c
	const FRUITTREE_PEWTER_CITY_2 ; 1d
	const FRUITTREE_FUCHSIA_CITY  ; 1e
NUM_FRUIT_TREES EQU const_value +- 1


; ElevatorFloorNames indexes (see data/elevator_floors.asm)
; used by elevfloor macro
	const_def
	const FLOOR_B4F
	const FLOOR_B3F
	const FLOOR_B2F
	const FLOOR_B1F
	const FLOOR_1F
	const FLOOR_2F
	const FLOOR_3F
	const FLOOR_4F
	const FLOOR_5F
	const FLOOR_6F
	const FLOOR_7F
	const FLOOR_8F
	const FLOOR_9F
	const FLOOR_10F
	const FLOOR_11F
	const FLOOR_ROOF

; command queue members
CMDQUEUE_TYPE  EQU 0
CMDQUEUE_ADDR  EQU 1
CMDQUEUE_03    EQU 3
CMDQUEUE_04    EQU 4
CMDQUEUE_05    EQU 5
CMDQUEUE_ENTRY_SIZE EQU 6
CMDQUEUE_CAPACITY EQU 4

; command queue types
CMDQUEUE_STONETABLE EQU 2


; used by Special_UnownPuzzle
; LoadUnownPuzzlePiecesGFX.LZPointers indexes (see engine/unown_puzzle.asm)
	const_def
	const UNOWNPUZZLE_KABUTO     ; 0
	const UNOWNPUZZLE_OMANYTE    ; 1
	const UNOWNPUZZLE_AERODACTYL ; 2
	const UNOWNPUZZLE_HO_OH      ; 3
NUM_UNOWN_PUZZLES EQU const_value

; used by Special_DisplayUnownWords
; UnownWalls and MenuDataHeaders_UnownWalls indexes (see data/unown_walls.asm)
	const_def
	const UNOWNWORDS_ESCAPE ; 0
	const UNOWNWORDS_LIGHT  ; 1
	const UNOWNWORDS_WATER  ; 2
	const UNOWNWORDS_HO_OH  ; 3
