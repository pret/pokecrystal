Route14_MapScriptHeader: ; 0x1ad47d
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ad47f

TeacherScript_0x1ad47f: ; 0x1ad47f
	faceplayer
	loadfont
	trade $5
	closetext
	loadmovesprites
	end
; 0x1ad486

TrainerPokefanmCarter: ; 0x1ad486
	; bit/flag number
	dw $4d1

	; trainer group && trainer id
	db POKEFANM, CARTER

	; text when seen
	dw PokefanmCarterSeenText

	; text when trainer beaten
	dw PokefanmCarterBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmCarterScript
; 0x1ad492

PokefanmCarterScript: ; 0x1ad492
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad508
	closetext
	loadmovesprites
	end
; 0x1ad49a

TrainerBird_keeperRoy: ; 0x1ad49a
	; bit/flag number
	dw $403

	; trainer group && trainer id
	db BIRD_KEEPER, ROY

	; text when seen
	dw Bird_keeperRoySeenText

	; text when trainer beaten
	dw Bird_keeperRoyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperRoyScript
; 0x1ad4a6

Bird_keeperRoyScript: ; 0x1ad4a6
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad5a4
	closetext
	loadmovesprites
	end
; 0x1ad4ae

TrainerPokefanmTrevor: ; 0x1ad4ae
	; bit/flag number
	dw $4d2

	; trainer group && trainer id
	db POKEFANM, TREVOR

	; text when seen
	dw PokefanmTrevorSeenText

	; text when trainer beaten
	dw PokefanmTrevorBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmTrevorScript
; 0x1ad4ba

PokefanmTrevorScript: ; 0x1ad4ba
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad660
	closetext
	loadmovesprites
	end
; 0x1ad4c2

PokefanmCarterSeenText: ; 0x1ad4c2
	text "Let me tell you,"
	line "I had a hard time"

	para "catching my prized"
	line "#MON."
	done
; 0x1ad4ff

PokefanmCarterBeatenText: ; 0x1ad4ff
	text "Awaaah!"
	done
; 0x1ad508

UnknownText_0x1ad508: ; 0x1ad508
	text "SQUIRTLE, CHARMAN-"
	line "DER and BULBASAUR…"

	para "I think that's a"
	line "well-balanced mix."
	done
; 0x1ad552

Bird_keeperRoySeenText: ; 0x1ad552
	text "My dream is to fly"
	line "with my beloved"
	cont "bird #MON."
	done
; 0x1ad581

Bird_keeperRoyBeatenText: ; 0x1ad581
	text "I can dream, but I"
	line "can't ever fly…"
	done
; 0x1ad5a4

UnknownText_0x1ad5a4: ; 0x1ad5a4
	text "You have #MON"
	line "that know the HM"

	para "move FLY, don't"
	line "you? I envy you."
	done
; 0x1ad5e4

PokefanmTrevorSeenText: ; 0x1ad5e4
	text "Hi. Did you know…?"

	para "#MON get more"
	line "friendly if you"

	para "train them in a"
	line "place that they"
	cont "remember."
	done
; 0x1ad640

PokefanmTrevorBeatenText: ; 0x1ad640
	text "Where did I meet"
	line "this PSYDUCK?"
	done
; 0x1ad660

UnknownText_0x1ad660: ; 0x1ad660
	text "If only there were"
	line "an easy way to"

	para "identify where I"
	line "got my #MON…"
	done
; 0x1ad6a1

Route14_MapEventHeader: ; 0x1ad6a1
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_POKEFAN_M, 19, 15, $9, $0, 255, 255, $82, 3, TrainerPokefanmCarter, $ffff
	person_event SPRITE_YOUNGSTER, 31, 15, $a, $0, 255, 255, $92, 3, TrainerBird_keeperRoy, $ffff
	person_event SPRITE_POKEFAN_M, 15, 10, $a, $0, 255, 255, $82, 3, TrainerPokefanmTrevor, $ffff
	person_event SPRITE_TEACHER, 9, 11, $5, $1, 255, 255, $a0, 4, TeacherScript_0x1ad47f, $ffff
; 0x1ad6db

