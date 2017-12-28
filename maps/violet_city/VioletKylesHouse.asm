const_value set 2
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE

VioletKylesHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

VioletKylesHousePokefanMScript:
	jumptextfaceplayer VioletKylesHousePokefanMText

Kyle:
	faceplayer
	opentext
	trade NPCTRADE_KYLE
	waitbutton
	closetext
	end

VioletKylesHousePokefanMText:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

VioletKylesHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 6, VIOLET_CITY
	warp_def $7, $4, 6, VIOLET_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletKylesHousePokefanMScript, -1
	object_event SPRITE_YOUNGSTER, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
