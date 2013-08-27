Route24_MapScriptHeader: ; 0x1adbf8
	; trigger count
	db 0

	; callback count
	db 0
; 0x1adbfa

RocketScript_0x1adbfa: ; 0x1adbfa
	faceplayer
	playmusic $0039
	loadfont
	2writetext UnknownText_0x1adc2e
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1add67, $ffff
	loadtrainer GRUNTM, 31
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic $0039
	loadfont
	2writetext UnknownText_0x1addc0
	keeptextopen
	special $006a
	2writetext UnknownText_0x1adee1
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $2
	pause 25
	special $0032
	playmapmusic
	end
; 0x1adc2e

UnknownText_0x1adc2e: ; 0x1adc2e
	db $0, "Hey, kid! Me am a", $4f
	db "TEAM ROCKET member", $55
	db "kind of guy!", $51
	db "Come from another", $4f
	db "country, a trainer", $55
	db "number one, me!", $51
	db "Think I did, if", $4f
	db "stop the energy,", $51
	db "be big panic for", $4f
	db "here people!", $51
	db "Secret it is my", $4f
	db "mission, so tell", $55
	db "you I not!", $51
	db "But! If win you do", $4f
	db "versus me, a man I", $51
	db "be and mine secret", $4f
	db "to you I tell.", $51
	db "Hey, kid! Battle", $4f
	db "begin we do!", $57
; 0x1add67

UnknownText_0x1add67: ; 0x1add67
	db $0, "Ayieeeh! No, no,", $4f
	db "no, believe it I", $55
	db "can't!", $51
	db "Strong very much", $4f
	db "be you! Match I am", $55
	db "not to you!", $57
; 0x1addc0

UnknownText_0x1addc0: ; 0x1addc0
	db $0, "OK. Tell you mine", $4f
	db "secret will I.", $51
	db "MACHINE PART steal", $4f
	db "by me, hide it I", $51
	db "did in GYM of the", $4f
	db "CERULEAN.", $51
	db "Inside water put", $4f
	db "it I did. Look for", $51
	db "in water center of", $4f
	db "GYM at.", $51
	db "But you forget me", $4f
	db "not!", $51
	db "Beat you for sure", $4f
	db "will TEAM ROCKET.", $51
	db "Come from JOHTO", $4f
	db "will they, mine", $51
	db "friends, yes. Will", $4f
	db "revenge they are.", $57
; 0x1adee1

UnknownText_0x1adee1: ; 0x1adee1
	db $0, "…", $51
	db "You say what? TEAM", $4f
	db "ROCKET bye-bye a", $51
	db "go-go? Broken it", $4f
	db "is says you?", $51
	db "Oh, no! Should I", $4f
	db "do what now on", $55
	db "from, me?", $57
; 0x1adf50

Route24_MapEventHeader: ; 0x1adf50
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_ROCKET, 11, 12, $3, $0, 255, 255, $0, 0, RocketScript_0x1adbfa, $076c
; 0x1adf63

