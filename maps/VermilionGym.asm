VermilionGym_MapScriptHeader: ; 0x1920a3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1920a5

SurgeScript_0x1920a5: ; 0x1920a5
	faceplayer
	loadfont
	checkflag $0025
	iftrue UnknownScript_0x1920d9
	writetext UnknownText_0x192142
	closetext
	loadmovesprites
	winlosstext UnknownText_0x192238, $0000
	loadtrainer LT_SURGE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	loadfont
	writetext UnknownText_0x192277
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0025
	writetext UnknownText_0x192291
	closetext
	loadmovesprites
	end
; 0x1920d9

UnknownScript_0x1920d9: ; 0x1920d9
	writetext UnknownText_0x192303
	closetext
	loadmovesprites
	end
; 0x1920df

TrainerGentlemanGregory: ; 0x1920df
	; bit/flag number
	dw $49c

	; trainer group && trainer id
	db GENTLEMAN, GREGORY

	; text when seen
	dw GentlemanGregorySeenText

	; text when trainer beaten
	dw GentlemanGregoryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanGregoryScript
; 0x1920eb

GentlemanGregoryScript: ; 0x1920eb
	talkaftercancel
	loadfont
	writetext UnknownText_0x1923b0
	closetext
	loadmovesprites
	end
; 0x1920f3

TrainerGuitaristVincent: ; 0x1920f3
	; bit/flag number
	dw $494

	; trainer group && trainer id
	db GUITARIST, VINCENT

	; text when seen
	dw GuitaristVincentSeenText

	; text when trainer beaten
	dw GuitaristVincentBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GuitaristVincentScript
; 0x1920ff

GuitaristVincentScript: ; 0x1920ff
	talkaftercancel
	loadfont
	writetext UnknownText_0x19244b
	closetext
	loadmovesprites
	end
; 0x192107

TrainerJugglerHorton: ; 0x192107
	; bit/flag number
	dw $497

	; trainer group && trainer id
	db JUGGLER, HORTON

	; text when seen
	dw JugglerHortonSeenText

	; text when trainer beaten
	dw JugglerHortonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw JugglerHortonScript
; 0x192113

JugglerHortonScript: ; 0x192113
	talkaftercancel
	loadfont
	writetext UnknownText_0x1924d6
	closetext
	loadmovesprites
	end
; 0x19211b

VermilionGymGuyScript: ; 0x19211b
	faceplayer
	loadfont
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	closetext
	loadmovesprites
	end

.VermilionGymGuyWinScript
	writetext VermilionGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x19212f

MapVermilionGymSignpost14Script: ; 0x19212f
	jumptext UnknownText_0x19261e
; 0x192132

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2

UnknownText_0x192142: ; 0x192142
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done
; 0x192238

UnknownText_0x192238: ; 0x192238
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done
; 0x192277

UnknownText_0x192277: ; 0x192277
	text $52, " received"
	line "THUNDERBADGE."
	done
; 0x192291

UnknownText_0x192291: ; 0x192291
	text "SURGE: THUNDER-"
	line "BADGE increases"
	cont "#MON's speed. "

	para "Consider it proof"
	line "that you defeated"

	para "me. You wear it"
	line "proudly, hear?"
	done
; 0x192303

UnknownText_0x192303: ; 0x192303
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done
; 0x192356

GentlemanGregorySeenText: ; 0x192356
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done
; 0x19238c

GentlemanGregoryBeatenText: ; 0x19238c
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done
; 0x1923b0

UnknownText_0x1923b0: ; 0x1923b0
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done
; 0x1923e8

GuitaristVincentSeenText: ; 0x1923e8
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done
; 0x192437

GuitaristVincentBeatenText: ; 0x192437
	text "Ooh, how shocking!"
	done
; 0x19244b

UnknownText_0x19244b: ; 0x19244b
	text "If the GYM's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done
; 0x192487

JugglerHortonSeenText: ; 0x192487
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done
; 0x1924ba

JugglerHortonBeatenText: ; 0x1924ba
	text "Gwaaah!"
	line "I was overpowered…"
	done
; 0x1924d6

UnknownText_0x1924d6: ; 0x1924d6
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "LT.SURGE is tough."
	done
; 0x192517

VermilionGymGuyText: ; 0x192517
	text "Yo! CHAMP in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "LT.SURGE is very"
	line "cautious. He has"

	para "traps set all over"
	line "the GYM."

	para "But--he-heh--the"
	line "traps aren't"
	cont "active right now."

	para "You'll have no"
	line "problem getting to"
	cont "LT.SURGE."
	done
; 0x1925df

VermilionGymGuyWinText: ; 0x1925df
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done
; 0x19261e

UnknownText_0x19261e: ; 0x19261e
	text "Nope! Nothing here"
	line "but trash."
	done
; 0x19263d

VermilionGym_MapEventHeader: ; 0x19263d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $11, $5, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 17
	signpost 7, 1, $0, MapVermilionGymSignpost14Script
	signpost 7, 3, $0, MapVermilionGymSignpost14Script
	signpost 7, 5, $0, MapVermilionGymSignpost14Script
	signpost 7, 7, $0, MapVermilionGymSignpost14Script
	signpost 7, 9, $0, MapVermilionGymSignpost14Script
	signpost 9, 1, $0, MapVermilionGymSignpost14Script
	signpost 9, 3, $0, MapVermilionGymSignpost14Script
	signpost 9, 5, $0, MapVermilionGymSignpost14Script
	signpost 9, 7, $0, MapVermilionGymSignpost14Script
	signpost 9, 9, $0, MapVermilionGymSignpost14Script
	signpost 11, 1, $0, MapVermilionGymSignpost14Script
	signpost 11, 3, $0, MapVermilionGymSignpost14Script
	signpost 11, 5, $0, MapVermilionGymSignpost14Script
	signpost 11, 7, $0, MapVermilionGymSignpost14Script
	signpost 11, 9, $0, MapVermilionGymSignpost14Script
	signpost 15, 3, $0, VermilionGymStatue
	signpost 15, 6, $0, VermilionGymStatue

	; people-events
	db 5
	person_event SPRITE_SURGE, 6, 9, $6, $0, 255, 255, $b0, 0, SurgeScript_0x1920a5, $ffff
	person_event SPRITE_GENTLEMAN, 12, 12, $8, $0, 255, 255, $92, 4, TrainerGentlemanGregory, $ffff
	person_event SPRITE_ROCKER, 11, 8, $6, $3, 255, 255, $82, 3, TrainerGuitaristVincent, $ffff
	person_event SPRITE_SUPER_NERD, 14, 4, $9, $0, 255, 255, $92, 4, TrainerJugglerHorton, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $90, 1, VermilionGymGuyScript, $ffff
; 0x1926e3
