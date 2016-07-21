const_value set 2
	const BURNEDTOWER1F_ROCK
	const BURNEDTOWER1F_EUSINE
	const BURNEDTOWER1F_SILVER
	const BURNEDTOWER1F_MORTY
	const BURNEDTOWER1F_POKE_BALL

BurnedTower1F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .HoleAndLadder

.Trigger0:
	priorityjump .EusineTrigger
	end

.Trigger1:
	end

.Trigger2:
	end

.HoleAndLadder:
	checkevent EVENT_HOLE_IN_BURNED_TOWER
	iftrue .Next
	changeblock $a, $8, $32 ; hole
.Next:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .Done
	changeblock $6, $e, $9 ; ladder
.Done:
	return

.EusineTrigger:
	spriteface BURNEDTOWER1F_EUSINE, DOWN
	showemote EMOTE_SHOCK, BURNEDTOWER1F_EUSINE, 15
	applymovement BURNEDTOWER1F_EUSINE, BurnedTower1FEusineMovement
	opentext
	writetext BurnedTower1FEusineIntroText
	waitbutton
	closetext
	moveperson BURNEDTOWER1F_EUSINE, $9, $e
	dotrigger $1
	end

BurnedTowerRivalBattleScript:
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 15
	special Special_FadeOutMusic
	pause 15
	spriteface BURNEDTOWER1F_SILVER, RIGHT
	pause 15
	applymovement PLAYER, BurnedTowerMovement_PlayerWalksToSilver
	applymovement BURNEDTOWER1F_SILVER, BurnedTowerMovement_SilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_9
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.totodile
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	dotrigger $2
	setevent EVENT_RIVAL_BURNED_TOWER
	special Special_FadeOutMusic
	pause 15
	earthquake 50
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	waitsfx
	changeblock $a, $8, $25
	reloadmappart
	pause 15
	applymovement PLAYER, BurnedTower1FMovement_PlayerStartsToFall
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 20
	opentext
	writetext BurnedTowerSilver_AfterText2
	waitbutton
	closetext
	setevent EVENT_HOLE_IN_BURNED_TOWER
	pause 15
	warpcheck
	end

BurnedTower1FEusineScript:
	jumptextfaceplayer BurnedTower1FEusineText

BurnedTower1FMortyScript:
	jumptextfaceplayer BurnedTower1FMortyText

BurnedTower1FRock:
	jumpstd smashrock

BurnedTower1FHiddenEther:
	dwb EVENT_BURNED_TOWER_1F_HIDDEN_ETHER, ETHER


BurnedTower1FHiddenUltraBall:
	dwb EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL, ULTRA_BALL


BurnedTower1FHPUp:
	itemball HP_UP

BurnedTowerMovement_PlayerWalksToSilver:
	step LEFT
	step_end

BurnedTowerMovement_SilverWalksToPlayer:
	step RIGHT
	step_end

BurnedTower1FMovement_PlayerStartsToFall:
	skyfall_top
	step_end

BurnedTower1FEusineMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

BurnedTowerSilver_BeforeText:
	text "<......> <......> <......>"

	para "…Oh, it's you."

	para "I came looking for"
	line "some legendary"

	para "#MON that they"
	line "say roosts here."

	para "But there's"
	line "nothing here!"

	para "Nothing after all"
	line "the trouble of"

	para "coming to this"
	line "dump? No way!"

	para "It's all your"
	line "fault!"
	done

BurnedTowerSilver_WinText:
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "There's no"
	line "challenge in it."
	done

BurnedTowerSilver_AfterText1:
	text "…Aw, whatever."

	para "You would never be"
	line "able to catch a"

	para "legendary #MON"
	line "anyway."
	done

BurnedTowerSilver_LossText:
	text "…Humph!"

	para "This is why I hate"
	line "battling wimps."

	para "It's just a waste"
	line "of my time."
	done

BurnedTowerSilver_AfterText2:
	text "Humph!"

	para "What are you doing"
	line "falling into a"

	para "hole? Some genius"
	line "you are!"

	para "Serves you right!"
	done

BurnedTower1FEusineIntroText:
	text "EUSINE: My name's"
	line "EUSINE."

	para "I'm on the trail"
	line "of a #MON named"
	cont "SUICUNE."

	para "And you are…?"

	para "<PLAYER>? Glad to"
	line "meet you!"

	para "I heard rumors"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

BurnedTower1FEusineText:
	text "EUSINE: I heard"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

BurnedTower1FMortyText:
	text "MORTY: ECRUTEAK's"
	line "GYM LEADER has to"

	para "study what are"
	line "said to be the"

	para "legendary #MON"
	line "--SUICUNE, ENTEI"
	cont "and RAIKOU."

	para "EUSINE is here, so"
	line "I've decided to"

	para "investigate the"
	line "TOWER with him."
	done

BurnedTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 14
	warp_def $f, $9, 13, ECRUTEAK_CITY
	warp_def $f, $a, 13, ECRUTEAK_CITY
	warp_def $9, $a,  1, BURNED_TOWER_B1F
	warp_def $5, $5,  1, BURNED_TOWER_B1F
	warp_def $6, $5,  1, BURNED_TOWER_B1F
	warp_def $6, $4,  1, BURNED_TOWER_B1F
	warp_def $4, $f,  2, BURNED_TOWER_B1F
	warp_def $5, $f,  2, BURNED_TOWER_B1F
	warp_def $7, $a,  3, BURNED_TOWER_B1F
	warp_def $e, $5,  4, BURNED_TOWER_B1F
	warp_def $e, $4,  4, BURNED_TOWER_B1F
	warp_def $e, $e,  5, BURNED_TOWER_B1F
	warp_def $e, $f,  5, BURNED_TOWER_B1F
	warp_def $f, $7,  6, BURNED_TOWER_B1F

.XYTriggers:
	db 1
	xy_trigger 1, $9, $b, $0, BurnedTowerRivalBattleScript, $0, $0

.Signposts:
	db 2
	signpost  7,  8, SIGNPOST_ITEM, BurnedTower1FHiddenEther
	signpost 11, 13, SIGNPOST_ITEM, BurnedTower1FHiddenUltraBall

.PersonEvents:
	db 5
	person_event SPRITE_ROCK, 4, 15, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	person_event SPRITE_SUPER_NERD, 12, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BurnedTower1FEusineScript, EVENT_BURNED_TOWER_1F_EUSINE
	person_event SPRITE_SILVER, 9, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	person_event SPRITE_MORTY, 14, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BurnedTower1FMortyScript, EVENT_BURNED_TOWER_MORTY
	person_event SPRITE_POKE_BALL, 2, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, BurnedTower1FHPUp, EVENT_BURNED_TOWER_1F_HP_UP
