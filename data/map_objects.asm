sprite_movement_data: macro
	db \1, \2, \3, \4, \5
	dn \6, 0
endm

SpriteMovementData:: ; 4273
; entries correspond to SPRITEMOVEDATA_* constants
	; function,                                              facing, action,                  flags1, flags2, palette flags
	sprite_movement_data SPRITEMOVEFN_00,                    DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; 00
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $0c,    $00,    %0000 ; 01
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 02
	sprite_movement_data SPRITEMOVEFN_SLOW_RANDOM_SPIN,      DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 03
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_Y,         DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 04
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_X,         DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 05
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 06
	sprite_movement_data SPRITEMOVEFN_STANDING,              UP,     OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 07
	sprite_movement_data SPRITEMOVEFN_STANDING,              LEFT,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 08
	sprite_movement_data SPRITEMOVEFN_STANDING,              RIGHT,  OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 09
	sprite_movement_data SPRITEMOVEFN_FAST_RANDOM_SPIN,      DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 0a
	sprite_movement_data SPRITEMOVEFN_OBEY_DPAD,             DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; 0b
	sprite_movement_data SPRITEMOVEFN_08,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 0c
	sprite_movement_data SPRITEMOVEFN_09,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 0d
	sprite_movement_data SPRITEMOVEFN_0A,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 0e
	sprite_movement_data SPRITEMOVEFN_0B,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 0f
	sprite_movement_data SPRITEMOVEFN_0C,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 10
	sprite_movement_data SPRITEMOVEFN_0D,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 11
	sprite_movement_data SPRITEMOVEFN_0E,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 12
	sprite_movement_data SPRITEMOVEFN_FOLLOW,                DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; 13
	sprite_movement_data SPRITEMOVEFN_SCRIPTED,              DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; 14
	sprite_movement_data SPRITEMOVEFN_BIG_SNORLAX,           DOWN,   OBJECT_ACTION_BIG_SNORLAX,  $2e,    $01,    %1100 ; 15
	sprite_movement_data SPRITEMOVEFN_BOUNCE,                DOWN,   OBJECT_ACTION_BOUNCE,       $2e,    $00,    %0000 ; 16
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $0c,    $00,    %0000 ; 17
	sprite_movement_data SPRITEMOVEFN_STANDING,              DOWN,   OBJECT_ACTION_STAND,        $2e,    $10,    %0000 ; 18
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_STAND,        $2e,    $00,    %0100 ; 19
	sprite_movement_data SPRITEMOVEFN_FOLLOWNOTEXACT,        DOWN,   OBJECT_ACTION_STAND,        $02,    $00,    %0000 ; 1a
	sprite_movement_data SPRITEMOVEFN_SHADOW,                DOWN,   OBJECT_ACTION_00,           $8e,    $01,    %0000 ; 1b
	sprite_movement_data SPRITEMOVEFN_EMOTE,                 DOWN,   OBJECT_ACTION_EMOTE,        $8e,    $02,    %0000 ; 1c
	sprite_movement_data SPRITEMOVEFN_SCREENSHAKE,           DOWN,   OBJECT_ACTION_00,           $82,    $00,    %0000 ; 1d
	sprite_movement_data SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE, LEFT,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 1e
	sprite_movement_data SPRITEMOVEFN_SPIN_CLOCKWISE,        RIGHT,  OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 1f
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_BIG_LAPRAS,   $2e,    $01,    %1100 ; 20
	sprite_movement_data SPRITEMOVEFN_STRENGTH,              DOWN,   OBJECT_ACTION_BIG_DOLL,     $2e,    $01,    %1100 ; 21
	sprite_movement_data SPRITEMOVEFN_BOULDERDUST,           DOWN,   OBJECT_ACTION_BOULDER_DUST, $8e,    $01,    %0000 ; 22
	sprite_movement_data SPRITEMOVEFN_GRASS,                 DOWN,   OBJECT_ACTION_GRASS_SHAKE,  $8e,    $02,    %0000 ; 23
	sprite_movement_data SPRITEMOVEFN_RANDOM_WALK_XY,        DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0010 ; 24
	sprite_movement_data SPRITEMOVEFN_00,                    DOWN,   OBJECT_ACTION_STAND,        $00,    $00,    %0000 ; 25
; 4357
