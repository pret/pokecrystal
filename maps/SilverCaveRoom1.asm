const_value set 2
	const SILVERCAVEROOM1_POKE_BALL1
	const SILVERCAVEROOM1_POKE_BALL2
	const SILVERCAVEROOM1_POKE_BALL3
	const SILVERCAVEROOM1_POKE_BALL4

SilverCaveRoom1_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SilverCaveRoom1MaxElixer:
	itemball MAX_ELIXER

SilverCaveRoom1Protein:
	itemball PROTEIN

SilverCaveRoom1EscapeRope:
	itemball ESCAPE_ROPE

SilverCaveRoom1UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom1HiddenDireHit:
	dwb EVENT_SILVER_CAVE_ROOM_1_HIDDEN_DIRE_HIT, DIRE_HIT


SilverCaveRoom1HiddenUltraBall:
	dwb EVENT_SILVER_CAVE_ROOM_1_HIDDEN_ULTRA_BALL, ULTRA_BALL


SilverCaveRoom1_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $21, $9, 2, SILVER_CAVE_OUTSIDE
	warp_def $1, $f, 1, SILVER_CAVE_ROOM_2

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 23, 16, BGEVENT_ITEM, SilverCaveRoom1HiddenDireHit
	bg_event 12, 17, BGEVENT_ITEM, SilverCaveRoom1HiddenUltraBall

.ObjectEvents:
	db 4
	object_event SPRITE_POKE_BALL, 9, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1MaxElixer, EVENT_SILVER_CAVE_ROOM_1_MAX_ELIXER
	object_event SPRITE_POKE_BALL, 29, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1Protein, EVENT_SILVER_CAVE_ROOM_1_PROTEIN
	object_event SPRITE_POKE_BALL, 30, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1EscapeRope, EVENT_SILVER_CAVE_ROOM_1_ESCAPE_ROPE
	object_event SPRITE_POKE_BALL, 18, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1UltraBall, EVENT_SILVER_CAVE_ROOM_1_ULTRA_BALL
