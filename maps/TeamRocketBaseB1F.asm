const_value set 2
	const TEAMROCKETBASEB1F_ROCKET1
	const TEAMROCKETBASEB1F_ROCKET2
	const TEAMROCKETBASEB1F_SCIENTIST
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3

TeamRocketBaseB1F_MapScriptHeader:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_OBJECTS, .HideSecurityGrunt

.DummyScene:
	end

.HideSecurityGrunt:
	disappear TEAMROCKETBASEB1F_ROCKET1
	return

SecurityCamera1a:
	checkevent EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $2
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $2
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_1
	end

SecurityCamera1b:
	checkevent EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $3
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $3
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_1
	end

SecurityCamera2a:
	checkevent EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $4, $7
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement2
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $c, $5
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement3
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_2
	end

SecurityCamera2b:
	checkevent EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $4, $8
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement4
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $c, $5
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement5
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_2
	end

SecurityCamera3a:
	checkevent EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $6
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $19, $b
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement6
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_3
	end

SecurityCamera3b:
	checkevent EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $13, $7
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $19, $c
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement7
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_3
	end

SecurityCamera4:
	checkevent EVENT_SECURITY_CAMERA_4
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $11, $10
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $19, $b
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement8
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_4
	end

SecurityCamera5:
	checkevent EVENT_SECURITY_CAMERA_5
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, $3, $10
	appear TEAMROCKETBASEB1F_ROCKET1
	spriteface PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, $e, $10
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement9
	scall TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_5
	end

NoSecurityCamera:
	end

TrainerCameraGrunt1:
	opentext
	writetext CameraGrunt1SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt1BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, GRUNTM_20
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

TrainerCameraGrunt2:
	opentext
	writetext CameraGrunt2SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt2BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, GRUNTM_21
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

PlaySecurityCameraSounds:
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	end

ExplodingTrap1:
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2:
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_3
	end

ExplodingTrap4:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5:
	checkevent EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6:
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7:
	checkevent EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8:
	checkevent EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9:
	checkevent EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_9
	end

ExplodingTrap10:
	checkevent EVENT_EXPLODING_TRAP_10
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_10
	end

ExplodingTrap11:
	checkevent EVENT_EXPLODING_TRAP_11
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_11
	end

ExplodingTrap12:
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_12
	end

ExplodingTrap13:
	checkevent EVENT_EXPLODING_TRAP_13
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_13
	end

ExplodingTrap14:
	checkevent EVENT_EXPLODING_TRAP_14
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_14
	end

ExplodingTrap15:
	checkevent EVENT_EXPLODING_TRAP_15
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_15
	end

ExplodingTrap16:
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_16
	end

ExplodingTrap17:
	checkevent EVENT_EXPLODING_TRAP_17
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_17
	end

ExplodingTrap18:
	checkevent EVENT_EXPLODING_TRAP_18
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_18
	end

ExplodingTrap19:
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	end

ExplodingTrap20:
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_20
	end

ExplodingTrap21:
	checkevent EVENT_EXPLODING_TRAP_21
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_21
	end

ExplodingTrap22:
	checkevent EVENT_EXPLODING_TRAP_22
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_22
	end

VoltorbExplodingTrap:
	special FadeOutPalettes
	cry VOLTORB
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VOLTORB, 23
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 21
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 21
	startbattle
	end

NoExplodingTrap:
	end

TrainerScientistJed:
	trainer EVENT_BEAT_SCIENTIST_JED, SCIENTIST, JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM16:
	trainer EVENT_BEAT_ROCKET_GRUNTM_16, GRUNTM, GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end

MapTeamRocketBaseB1FSignpost5Script:
	jumptext SecurityCameraText

MapTeamRocketBaseB1FSignpost7Script:
	jumpstd teamrocketoath

MapTeamRocketBaseB1FSignpost0Script:
	opentext
	checkevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	iftrue UnknownScript_0x6cabe
	writetext UnknownText_0x6cdad
	playsound SFX_TALLY
	waitbutton
	closetext
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

UnknownScript_0x6cabe:
	writetext UnknownText_0x6cdd0
	waitbutton
	closetext
	end

TeamRocketBaseB1FHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB1FNugget:
	itemball NUGGET

TeamRocketBaseB1FGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB1FHiddenRevive:
	dwb EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE, REVIVE


SecurityCameraMovement1:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

SecurityCameraMovement2:
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	turn_head RIGHT
	step_end

SecurityCameraMovement3:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement4:
; he jumps over a trap
	jump_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	turn_head RIGHT
	step_end

SecurityCameraMovement5:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement6:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement7:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement8:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement9:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

CameraGrunt1SeenText:
	text "Hey!"
	line "Intruder alert!"
	done

CameraGrunt1BeatenText:
	text "Dang… I failed…"
	done

CameraGrunt2SeenText:
	text "It's my turn!"
	line "There's no escape!"
	done

CameraGrunt2BeatenText:
	text "Surveillance cams"
	line "are in the #MON"
	cont "statues."

	para "We'll keep appear-"
	line "ing until you trip"
	cont "a secret switch."
	done

ScientistJedSeenText:
	text "This was once a"
	line "ninja hideout."

	para "There are traps to"
	line "confound intruders"
	cont "like you."
	done

ScientistJedBeatenText:
	text "I get it…"
	done

ScientistJedAfterBattleText:
	text "All right. I'll"
	line "divulge a secret"
	cont "about our hideout."

	para "That thing on the"
	line "floor up ahead is"
	cont "a warp panel."

	para "If you step on it,"
	line "you'll be warped"

	para "back to the en-"
	line "trance."
	done

GruntM16SeenText:
	text "Heheh. Feeling"
	line "lucky, punk?"

	para "Go ahead, take"
	line "another step."

	para "We've got traps"
	line "set in the floor!"
	done

GruntM16BeatenText:
	text "Kaboom!"
	done

GruntM16AfterBattleText:
	text "I don't even know"
	line "where the traps"
	cont "are planted."

	para "You'll just have"
	line "to collect your"
	cont "courage and walk."
	done

SecurityCameraText:
	text "It's a PERSIAN"
	line "statue…"

	para "Its eyes are oddly"
	line "shiny."
	done

UnknownText_0x6cdad:
	text "A secret switch!"
	line "Better press it."
	done

UnknownText_0x6cdd0:
	text "The switch is"
	line "turned off."
	done

TeamRocketBaseB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $2, $1b, 3, MAHOGANY_MART_1F
	warp_def $e, $3, 1, TEAM_ROCKET_BASE_B2F
	warp_def $f, $5, 4, TEAM_ROCKET_BASE_B1F
	warp_def $2, $19, 3, TEAM_ROCKET_BASE_B1F

.CoordEvents:
	db 30
	; There are five security cameras in the base.
	; Walking in front of one triggers two Rocket Grunts.
	coord_event 0, $2, $18, SecurityCamera1a
	coord_event 0, $3, $18, SecurityCamera1b
	coord_event 0, $2, $6, SecurityCamera2a
	coord_event 0, $3, $6, SecurityCamera2b
	coord_event 0, $6, $18, SecurityCamera3a
	coord_event 0, $7, $18, SecurityCamera3b
	coord_event 0, $10, $16, SecurityCamera4
	coord_event 0, $10, $8, SecurityCamera5
	; There are spots on the floor that trigger a Pokémon battle.
	; Each Pokémon (Voltorb, Koffing, Geodude) knows Selfdestruct.
	coord_event 0, $7, $2, ExplodingTrap1
	coord_event 0, $7, $3, ExplodingTrap2
	coord_event 0, $7, $4, ExplodingTrap3
	coord_event 0, $8, $1, ExplodingTrap4
	coord_event 0, $8, $3, ExplodingTrap5
	coord_event 0, $8, $5, ExplodingTrap6
	coord_event 0, $9, $3, ExplodingTrap7
	coord_event 0, $9, $4, ExplodingTrap8
	coord_event 0, $a, $1, ExplodingTrap9
	coord_event 0, $a, $2, ExplodingTrap10
	coord_event 0, $a, $3, ExplodingTrap11
	coord_event 0, $a, $5, ExplodingTrap12
	coord_event 0, $b, $2, ExplodingTrap13
	coord_event 0, $b, $4, ExplodingTrap14
	coord_event 0, $c, $1, ExplodingTrap15
	coord_event 0, $c, $2, ExplodingTrap16
	coord_event 0, $c, $4, ExplodingTrap17
	coord_event 0, $c, $5, ExplodingTrap18
	coord_event 0, $d, $1, ExplodingTrap19
	coord_event 0, $d, $3, ExplodingTrap20
	coord_event 0, $d, $4, ExplodingTrap21
	coord_event 0, $d, $5, ExplodingTrap22

.BGEvents:
	db 9
	bg_event 11, 19, BGEVENT_READ, MapTeamRocketBaseB1FSignpost0Script
	bg_event 1, 24, BGEVENT_UP, MapTeamRocketBaseB1FSignpost5Script
	bg_event 1, 6, BGEVENT_UP, MapTeamRocketBaseB1FSignpost5Script
	bg_event 15, 8, BGEVENT_UP, MapTeamRocketBaseB1FSignpost5Script
	bg_event 15, 22, BGEVENT_UP, MapTeamRocketBaseB1FSignpost5Script
	bg_event 5, 24, BGEVENT_UP, MapTeamRocketBaseB1FSignpost5Script
	bg_event 11, 20, BGEVENT_READ, MapTeamRocketBaseB1FSignpost7Script
	bg_event 11, 21, BGEVENT_READ, MapTeamRocketBaseB1FSignpost7Script
	bg_event 11, 3, BGEVENT_ITEM, TeamRocketBaseB1FHiddenRevive

.ObjectEvents:
	db 6
	object_event SPRITE_ROCKET, 0, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_SECURITY_GRUNTS
	object_event SPRITE_ROCKET, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM16, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event SPRITE_SCIENTIST, 12, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistJed, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event SPRITE_POKE_BALL, 6, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event SPRITE_POKE_BALL, 15, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	object_event SPRITE_POKE_BALL, 12, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FGuardSpec, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
