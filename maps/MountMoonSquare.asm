const_value set 2
	const MOUNTMOONSQUARE_FAIRY1
	const MOUNTMOONSQUARE_FAIRY2
	const MOUNTMOONSQUARE_ROCK

MountMoonSquare_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw .Trigger0, 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .DisappearMoonStone
	dbw MAPCALLBACK_OBJECTS, .DisappearRock

.Trigger0:
	end

.DisappearMoonStone:
	setevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	return

.DisappearRock:
	disappear MOUNTMOONSQUARE_ROCK
	return

ClefairyDance:
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .NoDancing
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, .NoDancing
	checknite
	iffalse .NoDancing
	appear MOUNTMOONSQUARE_FAIRY1
	appear MOUNTMOONSQUARE_FAIRY2
	applymovement PLAYER, PlayerWalksUpToDancingClefairies
	pause 15
	appear MOUNTMOONSQUARE_ROCK
	spriteface MOUNTMOONSQUARE_FAIRY1, RIGHT
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
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
	pause 10
	showemote EMOTE_SHOCK, MOUNTMOONSQUARE_FAIRY1, 15
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
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
	dwb EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE, MOON_STONE


DontLitterSign:
	jumptext DontLitterSignText

MtMoonSquareRock:
	jumpstd smashrock

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

MountMoonSquare_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $14, 5, MOUNT_MOON
	warp_def $b, $16, 6, MOUNT_MOON
	warp_def $7, $d, 1, MOUNT_MOON_GIFT_SHOP

.XYTriggers:
	db 1
	xy_trigger 0, $b, $7, $0, ClefairyDance, $0, $0

.Signposts:
	db 2
	signpost 7, 7, SIGNPOST_ITEM, MountMoonSquareHiddenMoonStone
	signpost 7, 17, SIGNPOST_READ, DontLitterSign

.PersonEvents:
	db 3
	person_event SPRITE_FAIRY, 6, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	person_event SPRITE_FAIRY, 6, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	person_event SPRITE_ROCK, 7, 7, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MtMoonSquareRock, EVENT_MT_MOON_SQUARE_ROCK
