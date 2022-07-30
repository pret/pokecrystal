	object_const_def
	const MOUNTMOONSQUARE_FAIRY1
	const MOUNTMOONSQUARE_FAIRY2
	const MOUNTMOONSQUARE_ROCK

MountMoonSquare_MapScripts:
	def_scene_scripts
	scene_script MountMoonSquareNoopScene, SCENE_MOUNTMOONSQUARE_CLEFAIRY_DANCE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MountMoonSquareDisappearMoonStoneCallback
	callback MAPCALLBACK_OBJECTS, MountMoonSquareDisappearRockCallback

MountMoonSquareNoopScene:
	end

MountMoonSquareDisappearMoonStoneCallback:
	setevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	endcallback

MountMoonSquareDisappearRockCallback:
	disappear MOUNTMOONSQUARE_ROCK
	endcallback

ClefairyDance:
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .NoDancing
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NoDancing
	checktime NITE
	iffalse .NoDancing
	appear MOUNTMOONSQUARE_FAIRY1
	appear MOUNTMOONSQUARE_FAIRY2
	applymovement PLAYER, PlayerWalksUpToDancingClefairies
	pause 15
	appear MOUNTMOONSQUARE_ROCK
	turnobject MOUNTMOONSQUARE_FAIRY1, RIGHT
	cry CLEFAIRY
	waitsfx
	pause 30
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep1
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep2
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep3
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep4
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep5
	stopfollow
	applymovement MOUNTMOONSQUARE_FAIRY2, ClefairyDanceStep6
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyDanceStep7
	stopfollow
	turnobject MOUNTMOONSQUARE_FAIRY1, DOWN
	pause 10
	showemote EMOTE_SHOCK, MOUNTMOONSQUARE_FAIRY1, 15
	turnobject MOUNTMOONSQUARE_FAIRY1, DOWN
	cry CLEFAIRY
	pause 15
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, ClefairyFleeMovement
	disappear MOUNTMOONSQUARE_FAIRY1
	disappear MOUNTMOONSQUARE_FAIRY2
	stopfollow
	clearevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	end

.NoDancing:
	end

MountMoonSquareHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE

DontLitterSign:
	jumptext DontLitterSignText

MtMoonSquareRock:
	jumpstd SmashRockScript

PlayerWalksUpToDancingClefairies:
	step UP
	step_end

ClefairyDanceStep1:
	slow_step DOWN
	slow_jump_step DOWN
	step_end

ClefairyDanceStep2:
	slow_jump_step RIGHT
	step_end

ClefairyDanceStep3:
	slow_step UP
	slow_jump_step UP
	step_end

ClefairyDanceStep4:
	slow_jump_step LEFT
	step_end

ClefairyDanceStep5:
	slow_step DOWN
	slow_jump_step DOWN
	step_end

ClefairyDanceStep6:
	slow_step DOWN
	step_end

ClefairyDanceStep7:
	slow_step RIGHT
	step_end

ClefairyFleeMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	jump_step RIGHT
	step RIGHT
	step RIGHT
	step_end

DontLitterSignText:
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done

MountMoonSquare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  5, MOUNT_MOON, 5
	warp_event 22, 11, MOUNT_MOON, 6
	warp_event 13,  7, MOUNT_MOON_GIFT_SHOP, 1

	def_coord_events
	coord_event  7, 11, SCENE_MOUNTMOONSQUARE_CLEFAIRY_DANCE, ClefairyDance

	def_bg_events
	bg_event  7,  7, BGEVENT_ITEM, MountMoonSquareHiddenMoonStone
	bg_event 17,  7, BGEVENT_READ, DontLitterSign

	def_object_events
	object_event  6,  6, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	object_event  7,  6, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	object_event  7,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtMoonSquareRock, EVENT_MT_MOON_SQUARE_ROCK
