TeamRocketBaseB1F_MapScriptHeader: ; 0x6c651
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x6c65a, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x6c65b
; 0x6c65a

UnknownScript_0x6c65a: ; 0x6c65a
	end
; 0x6c65b

UnknownScript_0x6c65b: ; 0x6c65b
	disappear $2
	return
; 0x6c65e

SecurityCamera1a: ; 0x6c65e
	checkbit1 EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $2
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $2
	appear $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_1
	end
; 0x6c6a7

SecurityCamera1b: ; 0x6c6a7
	checkbit1 EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $3
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $3
	appear $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_1
	end
; 0x6c6f0

SecurityCamera2a: ; 0x6c6f0
	checkbit1 EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $4, $7
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement2
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $c, $5
	appear $2
	applymovement $2, SecurityCameraMovement3
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_2
	end
; 0x6c73c

SecurityCamera2b: ; 0x6c73c
	checkbit1 EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $4, $8
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement4
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $c, $5
	appear $2
	applymovement $2, SecurityCameraMovement5
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_2
	end
; 0x6c788

SecurityCamera3a: ; 0x6c788
	checkbit1 EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $6
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $19, $b
	appear $2
	applymovement $2, SecurityCameraMovement6
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_3
	end
; 0x6c7d4

SecurityCamera3b: ; 0x6c7d4
	checkbit1 EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $13, $7
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $19, $c
	appear $2
	applymovement $2, SecurityCameraMovement7
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_3
	end
; 0x6c820

SecurityCamera4: ; 0x6c820
	checkbit1 EVENT_SECURITY_CAMERA_4
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $11, $10
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $19, $b
	appear $2
	applymovement $2, SecurityCameraMovement8
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_4
	end
; 0x6c86c

SecurityCamera5: ; 0x6c86c
	checkbit1 EVENT_SECURITY_CAMERA_5
	iftrue NoSecurityCamera
	2call PlaySecurityCameraSounds
	checkbit1 $06da
	iftrue NoSecurityCamera
	showemote $0, $0, 15
	playmusic $0039
	moveperson $2, $3, $10
	appear $2
	spriteface $0, $2
	applymovement $2, SecurityCameraMovement1
	2call TrainerCameraGrunt1
	if_equal $1, NoSecurityCamera
	2call PlaySecurityCameraSounds
	showemote $0, $0, 15
	playmusic $0039
	spriteface $0, $3
	moveperson $2, $e, $10
	appear $2
	applymovement $2, SecurityCameraMovement9
	2call TrainerCameraGrunt2
	if_equal $1, NoSecurityCamera
	setbit1 EVENT_SECURITY_CAMERA_5
	end
; 0x6c8b8

NoSecurityCamera: ; 0x6c8b8
	end
; 0x6c8b9

TrainerCameraGrunt1: ; 0x6c8b9
	loadfont
	2writetext CameraGrunt1SeenText
	closetext
	loadmovesprites
	winlosstext CameraGrunt1BeatenText, $0000
	setlasttalked $2
	loadtrainer GRUNTM, 20
	startbattle
	disappear $2
	returnafterbattle
	end
; 0x6c8ce

TrainerCameraGrunt2: ; 0x6c8ce
	loadfont
	2writetext CameraGrunt2SeenText
	closetext
	loadmovesprites
	winlosstext CameraGrunt2BeatenText, $0000
	setlasttalked $2
	loadtrainer GRUNTM, 21
	startbattle
	disappear $2
	returnafterbattle
	end
; 0x6c8e3

PlaySecurityCameraSounds: ; 0x6c8e3
	playsound $0030
	pause 10
	playsound $0030
	pause 10
	playsound $0030
	pause 10
	playsound $0030
	pause 10
	playsound $0030
	pause 10
	playsound $0030
	end
; 0x6c900

ExplodingTrap1: ; 0x6c900
	checkbit1 EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2: ; 0x6c90e
	checkbit1 EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3: ; 0x6c91c
	checkbit1 EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_3
	end

ExplodingTrap4: ; 0x6c92a
	checkbit1 EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5: ; 0x6c938
	checkbit1 EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6: ; 0x6c946
	checkbit1 EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7: ; 0x6c954
	checkbit1 EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8: ; 0x6c962
	checkbit1 EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9: ; 0x6c970
	checkbit1 EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_9
	end

ExplodingTrap10: ; 0x6c97e
	checkbit1 EVENT_EXPLODING_TRAP_10
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_10
	end

ExplodingTrap11: ; 0x6c98c
	checkbit1 EVENT_EXPLODING_TRAP_11
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_11
	end

ExplodingTrap12: ; 0x6c99a
	checkbit1 EVENT_EXPLODING_TRAP_12
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_12
	end

ExplodingTrap13: ; 0x6c9a8
	checkbit1 EVENT_EXPLODING_TRAP_13
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_13
	end

ExplodingTrap14: ; 0x6c9b6
	checkbit1 EVENT_EXPLODING_TRAP_14
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_14
	end

ExplodingTrap15: ; 0x6c9c4
	checkbit1 EVENT_EXPLODING_TRAP_15
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_15
	end

ExplodingTrap16: ; 0x6c9d2
	checkbit1 EVENT_EXPLODING_TRAP_16
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_16
	end

ExplodingTrap17: ; 0x6c9e0
	checkbit1 EVENT_EXPLODING_TRAP_17
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_17
	end

ExplodingTrap18: ; 0x6c9ee
	checkbit1 EVENT_EXPLODING_TRAP_18
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_18
	end

ExplodingTrap19: ; 0x6c9fc
	checkbit1 EVENT_EXPLODING_TRAP_19
	iftrue NoExplodingTrap
	2call GeodudeExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_19
	end

ExplodingTrap20: ; 0x6ca0a
	checkbit1 EVENT_EXPLODING_TRAP_20
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_20
	end

ExplodingTrap21: ; 0x6ca18
	checkbit1 EVENT_EXPLODING_TRAP_21
	iftrue NoExplodingTrap
	2call KoffingExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_21
	end

ExplodingTrap22: ; 0x6ca26
	checkbit1 EVENT_EXPLODING_TRAP_22
	iftrue NoExplodingTrap
	2call VoltorbExplodingTrap
	returnafterbattle
	setbit1 EVENT_EXPLODING_TRAP_22
	end

VoltorbExplodingTrap: ; 0x6ca34
	special $002e
	cry VOLTORB
	special $0031
	setlasttalked $ff
	writecode $3, $9
	loadpokedata VOLTORB, 23
	startbattle
	end

GeodudeExplodingTrap: ; 0x6ca47
	special $002e
	cry GEODUDE
	special $0031
	setlasttalked $ff
	writecode $3, $9
	loadpokedata GEODUDE, 21
	startbattle
	end

KoffingExplodingTrap: ; 0x6ca5a
	special $002e
	cry KOFFING
	special $0031
	setlasttalked $ff
	writecode $3, $9
	loadpokedata KOFFING, 21
	startbattle
	end

NoExplodingTrap: ; 0x6ca6d
	end
; 0x6ca6e

TrainerScientistJed: ; 0x6ca6e
	; bit/flag number
	dw $4a1

	; trainer group && trainer id
	db SCIENTIST, JED

	; text when seen
	dw ScientistJedSeenText

	; text when trainer beaten
	dw ScientistJedBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistJedScript
; 0x6ca7a

ScientistJedScript: ; 0x6ca7a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6cc16
	closetext
	loadmovesprites
	end
; 0x6ca82

TrainerGruntM16: ; 0x6ca82
	; bit/flag number
	dw $500

	; trainer group && trainer id
	db GRUNTM, 16

	; text when seen
	dw GruntM16SeenText

	; text when trainer beaten
	dw GruntM16BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM16Script
; 0x6ca8e

GruntM16Script: ; 0x6ca8e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6cd1b
	closetext
	loadmovesprites
	end
; 0x6ca96

MapTeamRocketBaseB1FSignpost5Script: ; 0x6ca96
	jumptext SecurityCameraText
; 0x6ca99

MapTeamRocketBaseB1FSignpost7Script: ; 0x6ca99
	jumpstd $0004
; 0x6ca9c

MapTeamRocketBaseB1FSignpost0Script: ; 0x6ca9c
	loadfont
	checkbit1 EVENT_TURNED_OFF_SECURITY_CAMERAS
	iftrue UnknownScript_0x6cabe
	2writetext UnknownText_0x6cdad
	playsound $0021
	closetext
	loadmovesprites
	setbit1 EVENT_TURNED_OFF_SECURITY_CAMERAS
	setbit1 EVENT_SECURITY_CAMERA_1
	setbit1 EVENT_SECURITY_CAMERA_2
	setbit1 EVENT_SECURITY_CAMERA_3
	setbit1 EVENT_SECURITY_CAMERA_4
	setbit1 EVENT_SECURITY_CAMERA_5
	end
; 0x6cabe

UnknownScript_0x6cabe: ; 0x6cabe
	2writetext UnknownText_0x6cdd0
	closetext
	loadmovesprites
	end
; 0x6cac4

ItemFragment_0x6cac4: ; 0x6cac4
	db HYPER_POTION, 1
; 0x6cac6

ItemFragment_0x6cac6: ; 0x6cac6
	db NUGGET, 1
; 0x6cac8

ItemFragment_0x6cac8: ; 0x6cac8
	db GUARD_SPEC, 1
; 0x6caca

MapTeamRocketBaseB1FSignpostItem8: ; 0x6caca
	dw $0086
	db REVIVE
	
; 0x6cacd

SecurityCameraMovement1: ; 0x6cacd
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6cad2

SecurityCameraMovement2: ; 0x6cad2
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	turn_head_right
	step_end
; 0x6cada

SecurityCameraMovement3: ; 0x6cada
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x6cae3

SecurityCameraMovement4: ; 0x6cae3
; he jumps over a trap
	jump_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	turn_head_right
	step_end
; 0x6caea

SecurityCameraMovement5: ; 0x6caea
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x6caf2

SecurityCameraMovement6: ; 0x6caf2
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_left
	step_end
; 0x6cafa

SecurityCameraMovement7: ; 0x6cafa
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	big_step_left
	step_end
; 0x6cb02

SecurityCameraMovement8: ; 0x6cb02
	big_step_down
	big_step_down
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	step_end
; 0x6cb0c

SecurityCameraMovement9: ; 0x6cb0c
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
; 0x6cb12

CameraGrunt1SeenText: ; 0x6cb12
	db $0, "Hey!", $4f
	db "Intruder alert!", $57
; 0x6cb28

CameraGrunt1BeatenText: ; 0x6cb28
	db $0, "Dang… I failed…", $57
; 0x6cb39

CameraGrunt2SeenText: ; 0x6cb39
	db $0, "It's my turn!", $4f
	db "There's no escape!", $57
; 0x6cb59

CameraGrunt2BeatenText: ; 0x6cb59
	db $0, "Surveillance cams", $4f
	db "are in the #MON", $55
	db "statues.", $51
	db "We'll keep appear-", $4f
	db "ing until you trip", $55
	db "a secret switch.", $57
; 0x6cbbb

ScientistJedSeenText: ; 0x6cbbb
	db $0, "This was once a", $4f
	db "ninja hideout.", $51
	db "There are traps to", $4f
	db "confound intruders", $55
	db "like you.", $57
; 0x6cc0b

ScientistJedBeatenText: ; 0x6cc0b
	db $0, "I get it…", $57
; 0x6cc16

UnknownText_0x6cc16: ; 0x6cc16
	db $0, "All right. I'll", $4f
	db "divulge a secret", $55
	db "about our hideout.", $51
	db "That thing on the", $4f
	db "floor up ahead is", $55
	db "a warp panel.", $51
	db "If you step on it,", $4f
	db "you'll be warped", $51
	db "back to the en-", $4f
	db "trance.", $57
; 0x6ccb7

GruntM16SeenText: ; 0x6ccb7
	db $0, "Heheh. Feeling", $4f
	db "lucky, punk?", $51
	db "Go ahead, take", $4f
	db "another step.", $51
	db "We've got traps", $4f
	db "set in the floor!", $57
; 0x6cd12

GruntM16BeatenText: ; 0x6cd12
	db $0, "Kaboom!", $57
; 0x6cd1b

UnknownText_0x6cd1b: ; 0x6cd1b
	db $0, "I don't even know", $4f
	db "where the traps", $55
	db "are planted.", $51
	db "You'll just have", $4f
	db "to collect your", $55
	db "courage and walk.", $57
; 0x6cd7c

SecurityCameraText: ; 0x6cd7c
	db $0, "It's a PERSIAN", $4f
	db "statue…", $51
	db "Its eyes are oddly", $4f
	db "shiny.", $57
; 0x6cdad

UnknownText_0x6cdad: ; 0x6cdad
	db $0, "A secret switch!", $4f
	db "Better press it.", $57
; 0x6cdd0

UnknownText_0x6cdd0: ; 0x6cdd0
	db $0, "The switch is", $4f
	db "turned off.", $57
; 0x6cdeb

TeamRocketBaseB1F_MapEventHeader: ; 0x6cdeb
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $2, $1b, 3, GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F
	warp_def $e, $3, 1, GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
	warp_def $f, $5, 4, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F
	warp_def $2, $19, 3, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F

	; xy triggers
	db 30
	; There are five security cameras in the base.
	; Walking in front of one triggers two Rocket Grunts.
	xy_trigger 0, $2, $18, $0, SecurityCamera1a, $0, $0
	xy_trigger 0, $3, $18, $0, SecurityCamera1b, $0, $0
	xy_trigger 0, $2, $6, $0, SecurityCamera2a, $0, $0
	xy_trigger 0, $3, $6, $0, SecurityCamera2b, $0, $0
	xy_trigger 0, $6, $18, $0, SecurityCamera3a, $0, $0
	xy_trigger 0, $7, $18, $0, SecurityCamera3b, $0, $0
	xy_trigger 0, $10, $16, $0, SecurityCamera4, $0, $0
	xy_trigger 0, $10, $8, $0, SecurityCamera5, $0, $0
	; There are spots on the floor that trigger a Pokémon battle.
	; Each Pokémon (Voltorb, Koffing, Geodude) knows Selfdestruct.
	xy_trigger 0, $7, $2, $0, ExplodingTrap1, $0, $0
	xy_trigger 0, $7, $3, $0, ExplodingTrap2, $0, $0
	xy_trigger 0, $7, $4, $0, ExplodingTrap3, $0, $0
	xy_trigger 0, $8, $1, $0, ExplodingTrap4, $0, $0
	xy_trigger 0, $8, $3, $0, ExplodingTrap5, $0, $0
	xy_trigger 0, $8, $5, $0, ExplodingTrap6, $0, $0
	xy_trigger 0, $9, $3, $0, ExplodingTrap7, $0, $0
	xy_trigger 0, $9, $4, $0, ExplodingTrap8, $0, $0
	xy_trigger 0, $a, $1, $0, ExplodingTrap9, $0, $0
	xy_trigger 0, $a, $2, $0, ExplodingTrap10, $0, $0
	xy_trigger 0, $a, $3, $0, ExplodingTrap11, $0, $0
	xy_trigger 0, $a, $5, $0, ExplodingTrap12, $0, $0
	xy_trigger 0, $b, $2, $0, ExplodingTrap13, $0, $0
	xy_trigger 0, $b, $4, $0, ExplodingTrap14, $0, $0
	xy_trigger 0, $c, $1, $0, ExplodingTrap15, $0, $0
	xy_trigger 0, $c, $2, $0, ExplodingTrap16, $0, $0
	xy_trigger 0, $c, $4, $0, ExplodingTrap17, $0, $0
	xy_trigger 0, $c, $5, $0, ExplodingTrap18, $0, $0
	xy_trigger 0, $d, $1, $0, ExplodingTrap19, $0, $0
	xy_trigger 0, $d, $3, $0, ExplodingTrap20, $0, $0
	xy_trigger 0, $d, $4, $0, ExplodingTrap21, $0, $0
	xy_trigger 0, $d, $5, $0, ExplodingTrap22, $0, $0

	; signposts
	db 9
	signpost 11, 19, $0, MapTeamRocketBaseB1FSignpost0Script
	signpost 1, 24, $1, MapTeamRocketBaseB1FSignpost5Script
	signpost 1, 6, $1, MapTeamRocketBaseB1FSignpost5Script
	signpost 15, 8, $1, MapTeamRocketBaseB1FSignpost5Script
	signpost 15, 22, $1, MapTeamRocketBaseB1FSignpost5Script
	signpost 5, 24, $1, MapTeamRocketBaseB1FSignpost5Script
	signpost 11, 20, $0, MapTeamRocketBaseB1FSignpost7Script
	signpost 11, 21, $0, MapTeamRocketBaseB1FSignpost7Script
	signpost 11, 3, $7, MapTeamRocketBaseB1FSignpostItem8

	; people-events
	db 6
	person_event SPRITE_ROCKET, 4, 4, $6, $0, 255, 255, $0, 0, ObjectEvent, $06d9
	person_event SPRITE_ROCKET, 8, 6, $9, $0, 255, 255, $2, 3, TrainerGruntM16, $06da
	person_event SPRITE_SCIENTIST, 16, 22, $8, $0, 255, 255, $92, 3, TrainerScientistJed, $06da
	person_event SPRITE_POKE_BALL, 10, 31, $1, $0, 255, 255, $1, 0, ItemFragment_0x6cac4, $0669
	person_event SPRITE_POKE_BALL, 19, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x6cac6, $066a
	person_event SPRITE_POKE_BALL, 16, 25, $1, $0, 255, 255, $1, 0, ItemFragment_0x6cac8, $066b
; 0x6cf70

