BattleTowerBattleRoom_MapScriptHeader: ; 0x9f40f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9f419, $0000
	dw UnknownScript_0x9f420, $0000

	; callback count
	db 0
; 0x9f419

UnknownScript_0x9f419: ; 0x9f419
	disappear $2
	priorityjump UnknownScript_0x9f421
	dotrigger $1
; 0x9f420

UnknownScript_0x9f420: ; 0x9f420
	end
; 0x9f421

UnknownScript_0x9f421: ; 0x9f421
	applymovement $0, MovementData_0x9e58c
UnknownScript_0x9f425: ; 0x9f425
	writebyte $2
	special $007a
	appear $2
	warpsound
	waitbutton
	applymovement $2, MovementData_0x9e592
	loadfont
	storetext 1
	keeptextopen
	loadmovesprites
	special $0077
	special $002e
	reloadmap
	if_not_equal $0, UnknownScript_0x9f4c2
	copybytetovar $cf64
	if_equal $7, UnknownScript_0x9f4d9
	applymovement $2, MovementData_0x9e597
	warpsound
	disappear $2
	applymovement $3, MovementData_0x9e59c
	applymovement $0, MovementData_0x9e5a7
	loadfont
	2writetext UnknownText_0x9ee92
	closetext
	loadmovesprites
	playmusic $000d
	special $002e
	special $00a4
	pause 60
	special $0031
	special $003d
	loadfont
	2writetext UnknownText_0x9eebc
	yesorno
	iffalse UnknownScript_0x9f483
UnknownScript_0x9f477: ; 0x9f477
	loadmovesprites
	applymovement $0, MovementData_0x9e5a9
	applymovement $3, MovementData_0x9e5a1
	2jump UnknownScript_0x9f425
; 0x9f483

UnknownScript_0x9f483: ; 0x9f483
	2writetext UnknownText_0x9ef5e
	yesorno
	iffalse UnknownScript_0x9f4a3
	writebyte $7
	special $0086
	writebyte $1f
	special $0086
	writebyte $3
	special $0086
	playsound $0025
	waitbutton
	special $002e
	special $007e
UnknownScript_0x9f4a3: ; 0x9f4a3
	2writetext UnknownText_0x9efbf
	yesorno
	iffalse UnknownScript_0x9f477
	writebyte $4
	special $0086
	writebyte $6
	special $0086
	loadmovesprites
	special $002e
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	loadfont
	2jump UnknownScript_0x9e4b0
; 0x9f4c2

UnknownScript_0x9f4c2: ; 0x9f4c2
	pause 60
	special $002f
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	writebyte $4
	special $0086
	loadfont
	2writetext UnknownText_0x9ea49
	closetext
	loadmovesprites
	end
; 0x9f4d9

UnknownScript_0x9f4d9: ; 0x9f4d9
	pause 60
	special $002f
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4: ; 0x9f4e4
	loadfont
	2writetext UnknownText_0x9eaef
	2jump UnknownScript_0x9e47a
; 0x9f4eb

UnknownScript_0x9f4eb: ; 0x9f4eb
	writebyte $4
	special $0086
	loadfont
	2writetext UnknownText_0x9f0c1
	closetext
	loadmovesprites
	end
; 0x9f4f7

UnknownScript_0x9f4f7: ; 0x9f4f7
	writebyte $4
	special $0086
	writebyte $6
	special $0086
	loadfont
	2writetext UnknownText_0x9ea49
	2writetext UnknownText_0x9ec09
	closetext
	loadmovesprites
	end
; 0x9f50b


UnknownText_0x9f50b: ; 0x9f50b
	text "You'll be returned"
	line "after you SAVE."
	done
; 0x9f52e


BattleTowerBattleRoom_MapEventHeader: ; 0x9f52e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $7, $4, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_YOUNGSTER, 4, 8, $6, $0, 255, 255, $0, 0, ObjectEvent, $0791
	person_event SPRITE_RECEPTIONIST, 10, 5, $9, $0, 255, 255, $0, 0, ObjectEvent, $ffff
; 0x9f558

