MountMortar2FInside_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerSupernerdHugh:
	; bit/flag number
	dw EVENT_BEAT_SUPER_NERD_HUGH

	; trainer group && trainer id
	db SUPER_NERD, HUGH

	; text when seen
	dw SupernerdHughSeenText

	; text when trainer beaten
	dw SupernerdHughBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdHughScript

SupernerdHughScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7e10e
	closetext
	loadmovesprites
	end

ItemFragment_0x7e0de:
	db MAX_POTION, 1

ItemFragment_0x7e0e0:
	db RARE_CANDY, 1

ItemFragment_0x7e0e2:
	db TM_DEFENSE_CURL, 1

ItemFragment_0x7e0e4:
	db DRAGON_SCALE, 1

ItemFragment_0x7e0e6:
	db ELIXER, 1

ItemFragment_0x7e0e8:
	db ESCAPE_ROPE, 1

MapMountMortar2FInsideSignpostItem0:
	dw $0092
	db FULL_RESTORE
	

SupernerdHughSeenText:
	text "Yo! MARKUS!"
	done

SupernerdHughBeatenText:
	text "Sorry, my mistake."
	done

UnknownText_0x7e10e:
	text "I'm investigating"
	line "MT.MORTAR, but my"
	cont "pal's gone AWOL."

	para "Have you seen a"
	line "trainer who has a"

	para "SLOWPOKE that can"
	line "use STRENGTH?"
	done

MountMortar2FInside_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $21, $11, 4, GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	warp_def $5, $3, 6, GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 8, 24, $7, MapMountMortar2FInsideSignpostItem0

	; people-events
	db 7
	person_event SPRITE_POKE_BALL, 26, 32, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0de, $0680
	person_event SPRITE_POKE_BALL, 37, 6, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e0, $0681
	person_event SPRITE_POKE_BALL, 21, 23, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e2, $0682
	person_event SPRITE_POKE_BALL, 9, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e4, $0683
	person_event SPRITE_POKE_BALL, 15, 13, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e6, $0684
	person_event SPRITE_POKE_BALL, 9, 32, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e0e8, $0685
	person_event SPRITE_SUPER_NERD, 30, 17, $a, $0, 255, 255, $b2, 2, TrainerSupernerdHugh, $ffff
