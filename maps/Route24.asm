const_value set 2
	const ROUTE24_ROCKET

Route24_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RocketScript_0x1adbfa:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext UnknownText_0x1adc2e
	waitbutton
	closetext
	winlosstext UnknownText_0x1add67, -1
	loadtrainer GRUNTM, 31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext UnknownText_0x1addc0
	buttonsound
	special Special_FadeOutMusic
	writetext UnknownText_0x1adee1
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special Special_FadeInQuickly
	playmapmusic
	end

UnknownText_0x1adc2e:
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

UnknownText_0x1add67:
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done

UnknownText_0x1addc0:
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

UnknownText_0x1adee1:
	text "…"

	para "You say what? TEAM"
	line "ROCKET bye-bye a"

	para "go-go? Broken it"
	line "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me?"
	done

Route24_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_ROCKET, 7, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x1adbfa, EVENT_ROUTE_24_ROCKET
