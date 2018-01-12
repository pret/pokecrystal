; overworld_sprite struct members (see gfx/sprite_data.asm)
	const_def
	const SPRITEDATA_ADDR    ; 0
	const SPRITEDATA_ADDR_HI ; 1
	const SPRITEDATA_SIZE    ; 2
	const SPRITEDATA_BANK    ; 3
	const SPRITEDATA_TYPE    ; 4
	const SPRITEDATA_PALETTE ; 5
NUM_SPRITEDATA_FIELDS EQU const_value

; sprite types
const_value set 1
	const WALKING_SPRITE  ; 1
	const STANDING_SPRITE ; 2
	const STILL_SPRITE    ; 3

; sprite palettes
	const_def
	const PAL_OW_RED    ; 0
	const PAL_OW_BLUE   ; 1
	const PAL_OW_GREEN  ; 2
	const PAL_OW_BROWN  ; 3
	const PAL_OW_PINK   ; 4
	const PAL_OW_SILVER ; 5
	const PAL_OW_TREE   ; 6
	const PAL_OW_ROCK   ; 7

; object_events set bit 3 so as not to use the sprite's default palette
; MapObjectPals indexes (see gfx/overworld/npc_sprites.pal)
const_value set (1 << 3)
	const PAL_NPC_RED    ; 8
	const PAL_NPC_BLUE   ; 9
	const PAL_NPC_GREEN  ; a
	const PAL_NPC_BROWN  ; b
	const PAL_NPC_PINK   ; c
	const PAL_NPC_SILVER ; d
	const PAL_NPC_TREE   ; e
	const PAL_NPC_ROCK   ; f

; SpriteMovementData indexes (see data/sprites/map_objects.asm)
	const_def
	const SPRITEMOVEDATA_00                   ; 00
	const SPRITEMOVEDATA_ITEM_TREE            ; 01
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
	const SPRITEMOVEDATA_0C                   ; 0c
	const SPRITEMOVEDATA_0D                   ; 0d
	const SPRITEMOVEDATA_0E                   ; 0e
	const SPRITEMOVEDATA_0F                   ; 0f
	const SPRITEMOVEDATA_10                   ; 10
	const SPRITEMOVEDATA_11                   ; 11
	const SPRITEMOVEDATA_12                   ; 12
	const SPRITEMOVEDATA_FOLLOWING            ; 13
	const SPRITEMOVEDATA_SCRIPTED             ; 14
	const SPRITEMOVEDATA_SNORLAX              ; 15
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
	const SPRITEMOVEDATA_20                   ; 20
	const SPRITEMOVEDATA_BIGDOLL              ; 21
	const SPRITEMOVEDATA_BOULDERDUST          ; 22
	const SPRITEMOVEDATA_GRASS                ; 23
	const SPRITEMOVEDATA_LAPRAS               ; 24
NUM_SPRITEMOVEDATA EQU const_value
SPRITEMOVEDATA_FIELDS EQU 6

; MapObjectMovementPattern.Pointers indexes (see engine/map_objects.asm)
	const_def
	const SPRITEMOVEFN_00                    ; 00
	const SPRITEMOVEFN_RANDOM_WALK_Y         ; 01
	const SPRITEMOVEFN_RANDOM_WALK_X         ; 02
	const SPRITEMOVEFN_RANDOM_WALK_XY        ; 03
	const SPRITEMOVEFN_SLOW_RANDOM_SPIN      ; 04
	const SPRITEMOVEFN_FAST_RANDOM_SPIN      ; 05
	const SPRITEMOVEFN_STANDING              ; 06
	const SPRITEMOVEFN_OBEY_DPAD             ; 07
	const SPRITEMOVEFN_08                    ; 08
	const SPRITEMOVEFN_09                    ; 09
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

; StepTypesJumptable indexes (see engine/map_objects.asm)
	const_def
	const STEP_TYPE_00              ; 00
	const STEP_TYPE_SLEEP           ; 01
	const STEP_TYPE_NPC_WALK        ; 02
	const STEP_TYPE_03              ; 03
	const STEP_TYPE_04              ; 04
	const STEP_TYPE_05              ; 05
	const STEP_TYPE_PLAYER_WALK     ; 06
	const STEP_TYPE_07              ; 07
	const STEP_TYPE_NPC_JUMP        ; 08
	const STEP_TYPE_PLAYER_JUMP     ; 09
	const STEP_TYPE_HALF_STEP       ; 0a
	const STEP_TYPE_BUMP            ; 0b
	const STEP_TYPE_TELEPORT_FROM   ; 0c
	const STEP_TYPE_TELEPORT_TO     ; 0d
	const STEP_TYPE_SKYFALL         ; 0e
	const STEP_TYPE_0F              ; 0f
	const STEP_TYPE_GOT_BITE        ; 10
	const STEP_TYPE_ROCK_SMASH      ; 11
	const STEP_TYPE_RETURN_DIG      ; 12
	const STEP_TYPE_TRACKING_OBJECT ; 13
	const STEP_TYPE_14              ; 14
	const STEP_TYPE_15              ; 15
	const STEP_TYPE_16              ; 16
	const STEP_TYPE_17              ; 17
	const STEP_TYPE_18              ; 18
	const STEP_TYPE_SKYFALL_TOP     ; 19

; ObjectActionPairPointers indexes (see engine/map_object_action.asm)
	const_def
	const OBJECT_ACTION_00           ; 00
	const OBJECT_ACTION_STAND        ; 01
	const OBJECT_ACTION_STEP         ; 02
	const OBJECT_ACTION_BUMP         ; 03
	const OBJECT_ACTION_SPIN         ; 04
	const OBJECT_ACTION_SPIN_FLICKER ; 05
	const OBJECT_ACTION_FISHING      ; 06
	const OBJECT_ACTION_SHADOW       ; 07
	const OBJECT_ACTION_EMOTE        ; 08
	const OBJECT_ACTION_BIG_SNORLAX  ; 09
	const OBJECT_ACTION_BOUNCE       ; 0a
	const OBJECT_ACTION_WEIRD_TREE   ; 0b
	const OBJECT_ACTION_BIG_LAPRAS   ; 0c
	const OBJECT_ACTION_BIG_DOLL     ; 0d
	const OBJECT_ACTION_BOULDER_DUST ; 0e
	const OBJECT_ACTION_GRASS_SHAKE  ; 0f
	const OBJECT_ACTION_SKYFALL      ; 10

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
