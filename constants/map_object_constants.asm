; object_struct members (see macros/ram.asm)
rsreset
DEF OBJECT_SPRITE           rb ; 00
DEF OBJECT_MAP_OBJECT_INDEX rb ; 01
DEF OBJECT_SPRITE_TILE      rb ; 02
DEF OBJECT_MOVEMENT_TYPE    rb ; 03
DEF OBJECT_FLAGS1           rb ; 04
DEF OBJECT_FLAGS2           rb ; 05
DEF OBJECT_PALETTE          rb ; 06
DEF OBJECT_WALKING          rb ; 07
DEF OBJECT_DIRECTION        rb ; 08
DEF OBJECT_STEP_TYPE        rb ; 09
DEF OBJECT_STEP_DURATION    rb ; 0a
DEF OBJECT_ACTION           rb ; 0b
DEF OBJECT_STEP_FRAME       rb ; 0c
DEF OBJECT_FACING           rb ; 0d
DEF OBJECT_TILE             rb ; 0e
DEF OBJECT_LAST_TILE        rb ; 0f
DEF OBJECT_MAP_X            rb ; 10
DEF OBJECT_MAP_Y            rb ; 11
DEF OBJECT_LAST_MAP_X       rb ; 12
DEF OBJECT_LAST_MAP_Y       rb ; 13
DEF OBJECT_INIT_X           rb ; 14
DEF OBJECT_INIT_Y           rb ; 15
DEF OBJECT_RADIUS           rb ; 16
DEF OBJECT_SPRITE_X         rb ; 17
DEF OBJECT_SPRITE_Y         rb ; 18
DEF OBJECT_SPRITE_X_OFFSET  rb ; 19
DEF OBJECT_SPRITE_Y_OFFSET  rb ; 1a
DEF OBJECT_MOVEMENT_INDEX   rb ; 1b
DEF OBJECT_STEP_INDEX       rb ; 1c
DEF OBJECT_1D               rb ; 1d
DEF OBJECT_1E               rb ; 1e
DEF OBJECT_JUMP_HEIGHT      rb ; 1f
DEF OBJECT_RANGE            rb ; 20
                            rb_skip 7
DEF OBJECT_LENGTH EQU _RS
DEF NUM_OBJECT_STRUCTS EQU 13 ; see wObjectStructs

; object_struct OBJECT_DIRECTION values
DEF OW_DOWN  EQU DOWN  << 2
DEF OW_UP    EQU UP    << 2
DEF OW_LEFT  EQU LEFT  << 2
DEF OW_RIGHT EQU RIGHT << 2

; object_struct OBJECT_FLAGS1 bit flags
	const_def
	const INVISIBLE_F     ; 0
	const WONT_DELETE_F   ; 1
	const FIXED_FACING_F  ; 2
	const SLIDING_F       ; 3
	const NOCLIP_TILES_F  ; 4
	const MOVE_ANYWHERE_F ; 5
	const NOCLIP_OBJS_F   ; 6
	const EMOTE_OBJECT_F  ; 7

DEF INVISIBLE     EQU 1 << INVISIBLE_F
DEF WONT_DELETE   EQU 1 << WONT_DELETE_F
DEF FIXED_FACING  EQU 1 << FIXED_FACING_F
DEF SLIDING       EQU 1 << SLIDING_F
DEF NOCLIP_TILES  EQU 1 << NOCLIP_TILES_F
DEF MOVE_ANYWHERE EQU 1 << MOVE_ANYWHERE_F
DEF NOCLIP_OBJS   EQU 1 << NOCLIP_OBJS_F
DEF EMOTE_OBJECT  EQU 1 << EMOTE_OBJECT_F

; object_struct OBJECT_FLAGS2 bit flags
	const_def
	const LOW_PRIORITY_F  ; 0
	const HIGH_PRIORITY_F ; 1
	const OBJ_FLAGS2_2    ; 2
	const OVERHEAD_F      ; 3
	const USE_OBP1_F      ; 4
	const FROZEN_F        ; 5
	const OBJ_FLAGS2_6    ; 6
	const OBJ_FLAGS2_7    ; 7

DEF LOW_PRIORITY  EQU 1 << LOW_PRIORITY_F
DEF HIGH_PRIORITY EQU 1 << HIGH_PRIORITY_F
DEF OVERHEAD      EQU 1 << OVERHEAD_F
DEF USE_OBP1      EQU 1 << USE_OBP1_F

; object_struct OBJECT_PALETTE bit flags
	const_def 5
	const SWIMMING_F         ; 5
	const STRENGTH_BOULDER_F ; 6
	const BIG_OBJECT_F       ; 7

DEF SWIMMING         EQU 1 << SWIMMING_F
DEF STRENGTH_BOULDER EQU 1 << STRENGTH_BOULDER_F
DEF BIG_OBJECT       EQU 1 << BIG_OBJECT_F

; facing attribute bit flags
DEF RELATIVE_ATTRIBUTES_F EQU 1
DEF ABSOLUTE_TILE_ID_F    EQU 2

DEF RELATIVE_ATTRIBUTES EQU 1 << RELATIVE_ATTRIBUTES_F
DEF ABSOLUTE_TILE_ID    EQU 1 << ABSOLUTE_TILE_ID_F

; map_object struct members (see macros/ram.asm)
rsreset
DEF MAPOBJECT_OBJECT_STRUCT_ID rb ; 0
DEF MAPOBJECT_SPRITE           rb ; 1
DEF MAPOBJECT_Y_COORD          rb ; 2
DEF MAPOBJECT_X_COORD          rb ; 3
DEF MAPOBJECT_MOVEMENT         rb ; 4
DEF MAPOBJECT_RADIUS           rb ; 5
DEF MAPOBJECT_HOUR_1           rb ; 6
DEF MAPOBJECT_HOUR_2           rb ; 7
rsset MAPOBJECT_HOUR_2
DEF MAPOBJECT_TIMEOFDAY        rb ; 7
DEF MAPOBJECT_PALETTE          rb ; 8
rsset MAPOBJECT_PALETTE
DEF MAPOBJECT_TYPE             rb ; 8
DEF MAPOBJECT_SIGHT_RANGE      rb ; 9
DEF MAPOBJECT_SCRIPT_POINTER   rw ; a
DEF MAPOBJECT_EVENT_FLAG       rw ; c
                               rb_skip 2
DEF MAPOBJECT_LENGTH EQU _RS
DEF NUM_OBJECTS EQU 16
DEF PLAYER_OBJECT EQU 0

DEF MAPOBJECT_PALETTE_MASK EQU %11110000
DEF MAPOBJECT_TYPE_MASK    EQU %00001111

; SpriteMovementData struct members (see data/sprites/map_objects.asm)
rsreset
DEF SPRITEMOVEATTR_MOVEMENT rb ; 0
DEF SPRITEMOVEATTR_FACING   rb ; 1
DEF SPRITEMOVEATTR_ACTION   rb ; 2
DEF SPRITEMOVEATTR_FLAGS1   rb ; 3
DEF SPRITEMOVEATTR_FLAGS2   rb ; 4
DEF SPRITEMOVEATTR_PALFLAGS rb ; 5
DEF NUM_SPRITEMOVEDATA_FIELDS EQU _RS

DEF MAPOBJECT_SCREEN_WIDTH  EQU (SCREEN_WIDTH / 2) + 2
DEF MAPOBJECT_SCREEN_HEIGHT EQU (SCREEN_HEIGHT / 2) + 2

; SpriteMovementData indexes (see data/sprites/map_objects.asm)
	const_def
	const SPRITEMOVEDATA_00                   ; 00
	const SPRITEMOVEDATA_STILL                ; 01
	const SPRITEMOVEDATA_WANDER               ; 02
	const SPRITEMOVEDATA_SPINRANDOM_SLOW      ; 03
	const SPRITEMOVEDATA_WALK_UP_DOWN         ; 04
	const SPRITEMOVEDATA_WALK_LEFT_RIGHT      ; 05
	const SPRITEMOVEDATA_STANDING_DOWN        ; 06
	const SPRITEMOVEDATA_STANDING_UP          ; 07
	const SPRITEMOVEDATA_STANDING_LEFT        ; 08
	const SPRITEMOVEDATA_STANDING_RIGHT       ; 09
	const SPRITEMOVEDATA_SPINRANDOM_FAST      ; 0a
	const SPRITEMOVEDATA_PLAYER               ; 0b
	const SPRITEMOVEDATA_INDEXED_1            ; 0c
	const SPRITEMOVEDATA_INDEXED_2            ; 0d
	const SPRITEMOVEDATA_0E                   ; 0e
	const SPRITEMOVEDATA_0F                   ; 0f
	const SPRITEMOVEDATA_10                   ; 10
	const SPRITEMOVEDATA_11                   ; 11
	const SPRITEMOVEDATA_12                   ; 12
	const SPRITEMOVEDATA_FOLLOWING            ; 13
	const SPRITEMOVEDATA_SCRIPTED             ; 14
	const SPRITEMOVEDATA_BIGDOLLSYM           ; 15
	const SPRITEMOVEDATA_POKEMON              ; 16
	const SPRITEMOVEDATA_SUDOWOODO            ; 17
	const SPRITEMOVEDATA_SMASHABLE_ROCK       ; 18
	const SPRITEMOVEDATA_STRENGTH_BOULDER     ; 19
	const SPRITEMOVEDATA_FOLLOWNOTEXACT       ; 1a
	const SPRITEMOVEDATA_SHADOW               ; 1b
	const SPRITEMOVEDATA_EMOTE                ; 1c
	const SPRITEMOVEDATA_SCREENSHAKE          ; 1d
	const SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE ; 1e
	const SPRITEMOVEDATA_SPINCLOCKWISE        ; 1f
	const SPRITEMOVEDATA_BIGDOLLASYM          ; 20
	const SPRITEMOVEDATA_BIGDOLL              ; 21
	const SPRITEMOVEDATA_BOULDERDUST          ; 22
	const SPRITEMOVEDATA_GRASS                ; 23
	const SPRITEMOVEDATA_SWIM_WANDER          ; 24
DEF NUM_SPRITEMOVEDATA EQU const_value

; StepFunction_FromMovement.Pointers indexes (see engine/overworld/map_objects.asm)
	const_def
	const SPRITEMOVEFN_00                    ; 00
	const SPRITEMOVEFN_RANDOM_WALK_Y         ; 01
	const SPRITEMOVEFN_RANDOM_WALK_X         ; 02
	const SPRITEMOVEFN_RANDOM_WALK_XY        ; 03
	const SPRITEMOVEFN_SLOW_RANDOM_SPIN      ; 04
	const SPRITEMOVEFN_FAST_RANDOM_SPIN      ; 05
	const SPRITEMOVEFN_STANDING              ; 06
	const SPRITEMOVEFN_OBEY_DPAD             ; 07
	const SPRITEMOVEFN_INDEXED_1             ; 08
	const SPRITEMOVEFN_INDEXED_2             ; 09
	const SPRITEMOVEFN_0A                    ; 0a
	const SPRITEMOVEFN_0B                    ; 0b
	const SPRITEMOVEFN_0C                    ; 0c
	const SPRITEMOVEFN_0D                    ; 0d
	const SPRITEMOVEFN_0E                    ; 0e
	const SPRITEMOVEFN_FOLLOW                ; 0f
	const SPRITEMOVEFN_SCRIPTED              ; 10
	const SPRITEMOVEFN_STRENGTH              ; 11
	const SPRITEMOVEFN_FOLLOWNOTEXACT        ; 12
	const SPRITEMOVEFN_SHADOW                ; 13
	const SPRITEMOVEFN_EMOTE                 ; 14
	const SPRITEMOVEFN_BIG_SNORLAX           ; 15
	const SPRITEMOVEFN_BOUNCE                ; 16
	const SPRITEMOVEFN_SCREENSHAKE           ; 17
	const SPRITEMOVEFN_SPIN_CLOCKWISE        ; 18
	const SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE ; 19
	const SPRITEMOVEFN_BOULDERDUST           ; 1a
	const SPRITEMOVEFN_GRASS                 ; 1b
DEF NUM_SPRITEMOVEFN EQU const_value

; StepTypesJumptable indexes (see engine/overworld/map_objects.asm)
	const_def
	const STEP_TYPE_RESET            ; 00
	const STEP_TYPE_FROM_MOVEMENT    ; 01
	const STEP_TYPE_NPC_WALK         ; 02
	const STEP_TYPE_SLEEP            ; 03
	const STEP_TYPE_STANDING         ; 04
	const STEP_TYPE_RESTORE          ; 05
	const STEP_TYPE_PLAYER_WALK      ; 06
	const STEP_TYPE_CONTINUE_WALK    ; 07
	const STEP_TYPE_NPC_JUMP         ; 08
	const STEP_TYPE_PLAYER_JUMP      ; 09
	const STEP_TYPE_TURN             ; 0a
	const STEP_TYPE_BUMP             ; 0b
	const STEP_TYPE_TELEPORT_FROM    ; 0c
	const STEP_TYPE_TELEPORT_TO      ; 0d
	const STEP_TYPE_SKYFALL          ; 0e
	const STEP_TYPE_STRENGTH_BOULDER ; 0f
	const STEP_TYPE_GOT_BITE         ; 10
	const STEP_TYPE_ROCK_SMASH       ; 11
	const STEP_TYPE_RETURN_DIG       ; 12
	const STEP_TYPE_TRACKING_OBJECT  ; 13
	const STEP_TYPE_14               ; 14
	const STEP_TYPE_SCREENSHAKE      ; 15
	const STEP_TYPE_16               ; 16
	const STEP_TYPE_17               ; 17
	const STEP_TYPE_DELETE           ; 18
	const STEP_TYPE_SKYFALL_TOP      ; 19
DEF NUM_STEP_TYPES EQU const_value

; ObjectActionPairPointers indexes (see engine/overworld/map_object_action.asm)
	const_def
	const OBJECT_ACTION_00            ; 00
	const OBJECT_ACTION_STAND         ; 01
	const OBJECT_ACTION_STEP          ; 02
	const OBJECT_ACTION_BUMP          ; 03
	const OBJECT_ACTION_SPIN          ; 04
	const OBJECT_ACTION_SPIN_FLICKER  ; 05
	const OBJECT_ACTION_FISHING       ; 06
	const OBJECT_ACTION_SHADOW        ; 07
	const OBJECT_ACTION_EMOTE         ; 08
	const OBJECT_ACTION_BIG_DOLL_SYM  ; 09
	const OBJECT_ACTION_BOUNCE        ; 0a
	const OBJECT_ACTION_WEIRD_TREE    ; 0b
	const OBJECT_ACTION_BIG_DOLL_ASYM ; 0c
	const OBJECT_ACTION_BIG_DOLL      ; 0d
	const OBJECT_ACTION_BOULDER_DUST  ; 0e
	const OBJECT_ACTION_GRASS_SHAKE   ; 0f
	const OBJECT_ACTION_SKYFALL       ; 10
DEF NUM_OBJECT_ACTIONS EQU const_value

; Facings indexes (see data/sprites/facings.asm)
	const_def
	const FACING_STEP_DOWN_0    ; 00
	const FACING_STEP_DOWN_1    ; 01
	const FACING_STEP_DOWN_2    ; 02
	const FACING_STEP_DOWN_3    ; 03
	const FACING_STEP_UP_0      ; 04
	const FACING_STEP_UP_1      ; 05
	const FACING_STEP_UP_2      ; 06
	const FACING_STEP_UP_3      ; 07
	const FACING_STEP_LEFT_0    ; 08
	const FACING_STEP_LEFT_1    ; 09
	const FACING_STEP_LEFT_2    ; 0a
	const FACING_STEP_LEFT_3    ; 0b
	const FACING_STEP_RIGHT_0   ; 0c
	const FACING_STEP_RIGHT_1   ; 0d
	const FACING_STEP_RIGHT_2   ; 0e
	const FACING_STEP_RIGHT_3   ; 0f
	const FACING_FISH_DOWN      ; 10
	const FACING_FISH_UP        ; 11
	const FACING_FISH_LEFT      ; 12
	const FACING_FISH_RIGHT     ; 13
	const FACING_EMOTE          ; 14
	const FACING_SHADOW         ; 15
	const FACING_BIG_DOLL_ASYM  ; 16
	const FACING_BIG_DOLL_SYM   ; 17
	const FACING_WEIRD_TREE_0   ; 18
	const FACING_WEIRD_TREE_1   ; 19
	const FACING_WEIRD_TREE_2   ; 1a
	const FACING_WEIRD_TREE_3   ; 1b
	const FACING_BOULDER_DUST_1 ; 1c
	const FACING_BOULDER_DUST_2 ; 1d
	const FACING_GRASS_1        ; 1e
	const FACING_GRASS_2        ; 1f
DEF NUM_FACINGS EQU const_value

; DoPlayerMovement.DoStep arguments (see engine/overworld/player_movement.asm)
	const_def
	const STEP_SLOW          ; 0
	const STEP_WALK          ; 1
	const STEP_BIKE          ; 2
	const STEP_LEDGE         ; 3
	const STEP_ICE           ; 4
	const STEP_TURN          ; 5
	const STEP_BACK_LEDGE    ; 6
	const STEP_WALK_IN_PLACE ; 7
DEF NUM_STEPS EQU const_value
