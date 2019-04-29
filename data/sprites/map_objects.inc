SpriteMovementData::
; entries correspond to SPRITEMOVEDATA_* constants

; SPRITEMOVEDATA_00
	db SPRITEMOVEFN_00 ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STILL
	db SPRITEMOVEFN_STANDING ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db FIXED_FACING | SLIDING ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_WANDER
	db SPRITEMOVEFN_RANDOM_WALK_XY ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SPINRANDOM_SLOW
	db SPRITEMOVEFN_SLOW_RANDOM_SPIN ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_WALK_UP_DOWN
	db SPRITEMOVEFN_RANDOM_WALK_Y ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_WALK_LEFT_RIGHT
	db SPRITEMOVEFN_RANDOM_WALK_X ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STANDING_DOWN
	db SPRITEMOVEFN_STANDING ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STANDING_UP
	db SPRITEMOVEFN_STANDING ; movement function
	db UP ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STANDING_LEFT
	db SPRITEMOVEFN_STANDING ; movement function
	db LEFT ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STANDING_RIGHT
	db SPRITEMOVEFN_STANDING ; movement function
	db RIGHT ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SPINRANDOM_FAST
	db SPRITEMOVEFN_FAST_RANDOM_SPIN ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_PLAYER
	db SPRITEMOVEFN_OBEY_DPAD ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_0C
	db SPRITEMOVEFN_08 ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_0D
	db SPRITEMOVEFN_09 ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_0E
	db SPRITEMOVEFN_0A ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_0F
	db SPRITEMOVEFN_0B ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_10
	db SPRITEMOVEFN_0C ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_11
	db SPRITEMOVEFN_0D ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_12
	db SPRITEMOVEFN_0E ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_FOLLOWING
	db SPRITEMOVEFN_FOLLOW ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SCRIPTED
	db SPRITEMOVEFN_SCRIPTED ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_BIGDOLLSYM
	db SPRITEMOVEFN_BIG_SNORLAX ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_BIG_DOLL_SYM ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db LOW_PRIORITY ; flags2
	db STRENGTH_BOULDER | BIG_OBJECT ; palette flags

; SPRITEMOVEDATA_POKEMON
	db SPRITEMOVEFN_BOUNCE ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_BOUNCE ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SUDOWOODO
	db SPRITEMOVEFN_STANDING ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db FIXED_FACING | SLIDING ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SMASHABLE_ROCK
	db SPRITEMOVEFN_STANDING ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db USE_OBP1 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_STRENGTH_BOULDER
	db SPRITEMOVEFN_STRENGTH ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db 0 ; flags2
	db STRENGTH_BOULDER ; palette flags

; SPRITEMOVEDATA_FOLLOWNOTEXACT
	db SPRITEMOVEFN_FOLLOWNOTEXACT ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db WONT_DELETE ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SHADOW
	db SPRITEMOVEFN_SHADOW ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_00 ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | EMOTE_OBJECT ; flags1
	db LOW_PRIORITY ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_EMOTE
	db SPRITEMOVEFN_EMOTE ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_EMOTE ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | EMOTE_OBJECT ; flags1
	db HIGH_PRIORITY ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SCREENSHAKE
	db SPRITEMOVEFN_SCREENSHAKE ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_00 ; action
	db WONT_DELETE | EMOTE_OBJECT ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE
	db SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE ; movement function
	db LEFT ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SPINCLOCKWISE
	db SPRITEMOVEFN_SPIN_CLOCKWISE ; movement function
	db RIGHT ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_BIGDOLLASYM
	db SPRITEMOVEFN_STRENGTH ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_BIG_DOLL_ASYM ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db LOW_PRIORITY ; flags2
	db STRENGTH_BOULDER | BIG_OBJECT ; palette flags

; SPRITEMOVEDATA_BIGDOLL
	db SPRITEMOVEFN_STRENGTH ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_BIG_DOLL ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | MOVE_ANYWHERE ; flags1
	db LOW_PRIORITY ; flags2
	db STRENGTH_BOULDER | BIG_OBJECT ; palette flags

; SPRITEMOVEDATA_BOULDERDUST
	db SPRITEMOVEFN_BOULDERDUST ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_BOULDER_DUST ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | EMOTE_OBJECT ; flags1
	db LOW_PRIORITY ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_GRASS
	db SPRITEMOVEFN_GRASS ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_GRASS_SHAKE ; action
	db WONT_DELETE | FIXED_FACING | SLIDING | EMOTE_OBJECT ; flags1
	db HIGH_PRIORITY ; flags2
	db 0 ; palette flags

; SPRITEMOVEDATA_SWIM_WANDER
	db SPRITEMOVEFN_RANDOM_WALK_XY ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db SWIMMING ; palette flags

; 25
	db SPRITEMOVEFN_00 ; movement function
	db DOWN ; facing
	db OBJECT_ACTION_STAND ; action
	db 0 ; flags1
	db 0 ; flags2
	db 0 ; palette flags
