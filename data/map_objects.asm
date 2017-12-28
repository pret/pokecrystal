sprite_movement_data: MACRO
	db \1, \2, \3, \4, \5
	dn \6, 0
ENDM

SpriteMovementData:: ; 4273
; entries correspond to SPRITEMOVEDATA_* constants
	; function,                                              facing, action,                  flags1, flags2, palette flags
	sprite_movement_data SPRITEMOVEFN_00,                    DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; SPRITEMOVEDATA_00
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $0c,    $00,    %0000 ; SPRITEMOVEDATA_ITEM_TREE
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_WANDER
	sprite_movement_data SPRITEMOVEFN_SLOW_RANDOM_SPIN,      DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_SPINRANDOM_SLOW
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_Y,         DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_WALK_UP_DOWN
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_X,         DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_WALK_LEFT_RIGHT
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_DOWN
	sprite_movement_data SPRITEMOVEFN_STANDING,              UP,     OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_UP
	sprite_movement_data SPRITEMOVEFN_STANDING,              LEFT,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_LEFT
	sprite_movement_data SPRITEMOVEFN_STANDING,              RIGHT,  OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_STANDING_RIGHT
	sprite_movement_data SPRITEMOVEFN_FAST_RANDOM_SPIN,      DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_SPINRANDOM_FAST
	sprite_movement_data SPRITEMOVEFN_OBEY_DPAD,             DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; SPRITEMOVEDATA_PLAYER
	sprite_movement_data SPRITEMOVEFN_08,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_0C
	sprite_movement_data SPRITEMOVEFN_09,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_0D
	sprite_movement_data SPRITEMOVEFN_0A,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_0E
	sprite_movement_data SPRITEMOVEFN_0B,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_0F
	sprite_movement_data SPRITEMOVEFN_0C,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_10
	sprite_movement_data SPRITEMOVEFN_0D,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_11
	sprite_movement_data SPRITEMOVEFN_0E,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_12
	sprite_movement_data SPRITEMOVEFN_FOLLOW,                DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; SPRITEMOVEDATA_FOLLOWING
	sprite_movement_data SPRITEMOVEFN_SCRIPTED,              DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; SPRITEMOVEDATA_SCRIPTED
	sprite_movement_data SPRITEMOVEFN_BIG_SNORLAX,           DOWN,   OBJECT_ACTION_BIG_SNORLAX,  $2e,    $01,    %1100 ; SPRITEMOVEDATA_SNORLAX
	sprite_movement_data SPRITEMOVEFN_BOUNCE,                DOWN,   OBJECT_ACTION_BOUNCE,       $2e,    $00,    %0000 ; SPRITEMOVEDATA_POKEMON
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $0c,    $00,    %0000 ; SPRITEMOVEDATA_SUDOWOODO
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $2e,    $10,    %0000 ; SPRITEMOVEDATA_SMASHABLE_ROCK
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_STAND,        $2e,    $00,    %0100 ; SPRITEMOVEDATA_STRENGTH_BOULDER
	sprite_movement_data SPRITEMOVEFN_FOLLOWNOTEXACT,        DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; SPRITEMOVEDATA_FOLLOWNOTEXACT
	sprite_movement_data SPRITEMOVEFN_SHADOW,                DOWN,   OBJECT_ACTION_00,           $8e,    $01,    %0000 ; SPRITEMOVEDATA_SHADOW
	sprite_movement_data SPRITEMOVEFN_EMOTE,                 DOWN,   OBJECT_ACTION_EMOTE,        $8e,    $02,    %0000 ; SPRITEMOVEDATA_EMOTE
	sprite_movement_data SPRITEMOVEFN_SCREENSHAKE,           DOWN,   OBJECT_ACTION_00,           $82,    $00,    %0000 ; SPRITEMOVEDATA_SCREENSHAKE
	sprite_movement_data SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE, LEFT,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE
	sprite_movement_data SPRITEMOVEFN_SPIN_CLOCKWISE,        RIGHT,  OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; SPRITEMOVEDATA_SPINCLOCKWISE
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_BIG_LAPRAS,   $2e,    $01,    %1100 ; SPRITEMOVEDATA_20
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_BIG_DOLL,     $2e,    $01,    %1100 ; SPRITEMOVEDATA_BIGDOLL
	sprite_movement_data SPRITEMOVEFN_BOULDERDUST,           DOWN,   OBJECT_ACTION_BOULDER_DUST, $8e,    $01,    %0000 ; SPRITEMOVEDATA_BOULDERDUST
	sprite_movement_data SPRITEMOVEFN_GRASS,                 DOWN,   OBJECT_ACTION_GRASS_SHAKE,  $8e,    $02,    %0000 ; SPRITEMOVEDATA_GRASS
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0010 ; SPRITEMOVEDATA_LAPRAS
	sprite_movement_data SPRITEMOVEFN_00,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 25
; 4357
