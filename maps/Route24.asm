Route24_MapScriptHeader: ; 0x1adbf8
	; trigger count
	db 0

	; callback count
	db 0
; 0x1adbfa

RocketScript_0x1adbfa: ; 0x1adbfa
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x1adc2e
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1add67, $ffff
	loadtrainer GRUNTM, 31
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x1addc0
	keeptextopen
	special $006a
	writetext UnknownText_0x1adee1
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
	text "Hey, kid! Me am a"
	line "TEAM ROCKET member"
	cont "kind of guy!"

	para "Come from another"
	line "country, a trainer"
	cont "number one, me!"

	para "Think I did, if"
	line "stop the energy,"

	para "be big panic for"
	line "here people!"

	para "Secret it is my"
	line "mission, so tell"
	cont "you I not!"

	para "But! If win you do"
	line "versus me, a man I"

	para "be and mine secret"
	line "to you I tell."

	para "Hey, kid! Battle"
	line "begin we do!"
	done
; 0x1add67

UnknownText_0x1add67: ; 0x1add67
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done
; 0x1addc0

UnknownText_0x1addc0: ; 0x1addc0
	text "OK. Tell you mine"
	line "secret will I."

	para "MACHINE PART steal"
	line "by me, hide it I"

	para "did in GYM of the"
	line "CERULEAN."

	para "Inside water put"
	line "it I did. Look for"

	para "in water center of"
	line "GYM at."

	para "But you forget me"
	line "not!"

	para "Beat you for sure"
	line "will TEAM ROCKET."

	para "Come from JOHTO"
	line "will they, mine"

	para "friends, yes. Will"
	line "revenge they are."
	done
; 0x1adee1

UnknownText_0x1adee1: ; 0x1adee1
	text "…"

	para "You say what? TEAM"
	line "ROCKET bye-bye a"

	para "go-go? Broken it"
	line "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me?"
	done
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

