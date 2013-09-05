MountMortarB1F_MapScriptHeader: ; 0x7e1f4
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e1f6

BlackBeltScript_0x7e1f6: ; 0x7e1f6
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue UnknownScript_0x7e231
	checkbit1 $04a9
	iftrue UnknownScript_0x7e217
	2writetext UnknownText_0x7e24d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x7e2a9, $0000
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	returnafterbattle
	setbit1 $04a9
	loadfont
UnknownScript_0x7e217: ; 0x7e217
	2writetext UnknownText_0x7e2c0
	keeptextopen
	waitbutton
	checkcode $1
	if_equal $6, UnknownScript_0x7e237
	2writetext UnknownText_0x7e355
	playsound $0002
	waitbutton
	givepoke TYROGUE, 10, 0, 0
	setbit1 EVENT_GOT_TYROGUE_FROM_KIYO
UnknownScript_0x7e231: ; 0x7e231
	2writetext UnknownText_0x7e36a
	closetext
	loadmovesprites
	end
; 0x7e237

UnknownScript_0x7e237: ; 0x7e237
	2writetext UnknownText_0x7e3df
	closetext
	loadmovesprites
	end
; 0x7e23d

BoulderScript_0x7e23d: ; 0x7e23d
	jumpstd $000e
; 0x7e240

ItemFragment_0x7e240: ; 0x7e240
	db HYPER_POTION, 1
; 0x7e242

ItemFragment_0x7e242: ; 0x7e242
	db CARBOS, 1
; 0x7e244

ItemFragment_0x7e244: ; 0x7e244
	db FULL_RESTORE, 1
; 0x7e246

ItemFragment_0x7e246: ; 0x7e246
	db MAX_ETHER, 1
; 0x7e248

ItemFragment_0x7e248: ; 0x7e248
	db PP_UP, 1
; 0x7e24a

MapMountMortarB1FSignpostItem0: ; 0x7e24a
	dw $0093
	db MAX_REVIVE
	
; 0x7e24d

UnknownText_0x7e24d: ; 0x7e24d
	db $0, "Hey!", $51
	db "I am the KARATE", $4f
	db "KING!", $51
	db "I train alone here", $4f
	db "in the dark!", $51
	db "You!", $4f
	db "Battle with me!", $51
	db "Hwaaarggh!", $57
; 0x7e2a9

UnknownText_0x7e2a9: ; 0x7e2a9
	db $0, "Waaaarggh!", $4f
	db "I'm beaten!", $57
; 0x7e2c0

UnknownText_0x7e2c0: ; 0x7e2c0
	db $0, "I… I'm crushed…", $51
	db "My training is", $4f
	db "still not enough…", $51
	db "But a loss is a", $4f
	db "loss. I admit it.", $51
	db "As proof that you", $4f
	db "defeated me, I'll", $51
	db "give you a rare", $4f
	db "fighting #MON.", $57
; 0x7e355

UnknownText_0x7e355: ; 0x7e355
	db $0, $52, " received", $4f
	db "TYROGUE.", $57
; 0x7e36a

UnknownText_0x7e36a: ; 0x7e36a
	db $0, "TYROGUE is a", $4f
	db "fighting-type.", $51
	db "It evolves into a", $4f
	db "tougher #MON.", $51
	db "Keep up the hard", $4f
	db "work. I'll keep", $55
	db "training too.", $51
	db "Farewell!", $57
; 0x7e3df

UnknownText_0x7e3df: ; 0x7e3df
	db $0, "You have no room", $4f
	db "in your party!", $57
; 0x7e400

MountMortarB1F_MapEventHeader: ; 0x7e400
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $3, 5, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	warp_def $1d, $13, 7, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 6, 4, $7, MapMountMortarB1FSignpostItem0

	; people-events
	db 7
	person_event SPRITE_POKE_BALL, 16, 33, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e240, $0686
	person_event SPRITE_POKE_BALL, 20, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e242, $0687
	person_event SPRITE_BOULDER, 14, 13, $19, $0, 255, 255, $0, 0, BoulderScript_0x7e23d, $ffff
	person_event SPRITE_BLACK_BELT, 8, 20, $6, $0, 255, 255, $b0, 0, BlackBeltScript_0x7e1f6, $ffff
	person_event SPRITE_POKE_BALL, 28, 38, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e244, $07ca
	person_event SPRITE_POKE_BALL, 7, 36, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e246, $07cb
	person_event SPRITE_POKE_BALL, 30, 25, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e248, $07cc
; 0x7e470

