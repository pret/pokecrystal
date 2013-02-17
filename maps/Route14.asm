Route14_MapScriptHeader: ; 0x1ad47d
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ad47f

UnknownScript_0x1ad47f: ; 0x1ad47f
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
	2writetext UnknownText_0x1ad508
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
	2writetext UnknownText_0x1ad5a4
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
	2writetext UnknownText_0x1ad660
	closetext
	loadmovesprites
	end
; 0x1ad4c2

PokefanmCarterSeenText: ; 0x1ad4c2
	db $0, "Let me tell you,", $4f
	db "I had a hard time", $51
	db "catching my prized", $4f
	db "#MON.", $57
; 0x1ad4ff

PokefanmCarterBeatenText: ; 0x1ad4ff
	db $0, "Awaaah!", $57
; 0x1ad508

UnknownText_0x1ad508: ; 0x1ad508
	db $0, "SQUIRTLE, CHARMAN-", $4f
	db "DER and BULBASAUR…", $51
	db "I think that's a", $4f
	db "well-balanced mix.", $57
; 0x1ad552

Bird_keeperRoySeenText: ; 0x1ad552
	db $0, "My dream is to fly", $4f
	db "with my beloved", $55
	db "bird #MON.", $57
; 0x1ad581

Bird_keeperRoyBeatenText: ; 0x1ad581
	db $0, "I can dream, but I", $4f
	db "can't ever fly…", $57
; 0x1ad5a4

UnknownText_0x1ad5a4: ; 0x1ad5a4
	db $0, "You have #MON", $4f
	db "that know the HM", $51
	db "move FLY, don't", $4f
	db "you? I envy you.", $57
; 0x1ad5e4

PokefanmTrevorSeenText: ; 0x1ad5e4
	db $0, "Hi. Did you know…?", $51
	db "#MON get more", $4f
	db "friendly if you", $51
	db "train them in a", $4f
	db "place that they", $55
	db "remember.", $57
; 0x1ad640

PokefanmTrevorBeatenText: ; 0x1ad640
	db $0, "Where did I meet", $4f
	db "this PSYDUCK?", $57
; 0x1ad660

UnknownText_0x1ad660: ; 0x1ad660
	db $0, "If only there were", $4f
	db "an easy way to", $51
	db "identify where I", $4f
	db "got my #MON…", $57
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
	person_event $2d, 19, 15, $9, $0, 255, 255, $82, 3, TrainerPokefanmCarter, $ffff
	person_event $27, 31, 15, $a, $0, 255, 255, $92, 3, TrainerBird_keeperRoy, $ffff
	person_event $2d, 15, 10, $a, $0, 255, 255, $82, 3, TrainerPokefanmTrevor, $ffff
	person_event $29, 9, 11, $5, $1, 255, 255, $a0, 4, UnknownScript_0x1ad47f, $ffff
; 0x1ad6db

