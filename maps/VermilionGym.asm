VermilionGym_MapScriptHeader: ; 0x1920a3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1920a5

SurgeScript_0x1920a5: ; 0x1920a5
	faceplayer
	loadfont
	checkbit2 $0025
	iftrue UnknownScript_0x1920d9
	2writetext UnknownText_0x192142
	closetext
	loadmovesprites
	winlosstext UnknownText_0x192238, $0000
	loadtrainer LT_SURGE, 1
	startbattle
	returnafterbattle
	setbit1 EVENT_BEAT_LTSURGE
	setbit1 EVENT_BEAT_GENTLEMAN_GREGORY
	setbit1 EVENT_BEAT_GUITARIST_VINCENT
	setbit1 EVENT_BEAT_JUGGLER_HORTON
	loadfont
	2writetext UnknownText_0x192277
	playsound $009c
	waitbutton
	setbit2 $0025
	2writetext UnknownText_0x192291
	closetext
	loadmovesprites
	end
; 0x1920d9

UnknownScript_0x1920d9: ; 0x1920d9
	2writetext UnknownText_0x192303
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
	2writetext UnknownText_0x1923b0
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
	2writetext UnknownText_0x19244b
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
	2writetext UnknownText_0x1924d6
	closetext
	loadmovesprites
	end
; 0x19211b

VermilionGymGuyScript: ; 0x19211b
	faceplayer
	loadfont
	checkbit1 EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	2writetext VermilionGymGuyText
	closetext
	loadmovesprites
	end

.VermilionGymGuyWinScript
	2writetext VermilionGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x19212f

MapVermilionGymSignpost14Script: ; 0x19212f
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost16Script: ; 0x192132
	checkbit2 $0025
	iftrue UnknownScript_0x19213b
	jumpstd $002d
; 0x19213b

UnknownScript_0x19213b: ; 0x19213b
	trainertotext LT_SURGE, 1, $1
	jumpstd $002e
; 0x192142

UnknownText_0x192142: ; 0x192142
	db $0, "SURGE: Hey, you", $4f
	db "little tyke!", $51
	db "I have to hand it", $4f
	db "to you. It may not", $51
	db "be very smart to", $4f
	db "challenge me, but", $55
	db "it takes guts!", $51
	db "When it comes to", $4f
	db "electric #MON,", $55
	db "I'm number one!", $51
	db "I've never lost on", $4f
	db "the battlefield.", $51
	db "I'll zap you just", $4f
	db "like I did my", $55
	db "enemies in war!", $57
; 0x192238

UnknownText_0x192238: ; 0x192238
	db $0, "SURGE: Arrrgh!", $4f
	db "You are strong!", $51
	db "OK, kid. You get", $4f
	db "THUNDERBADGE!", $57
; 0x192277

UnknownText_0x192277: ; 0x192277
	db $0, $52, " received", $4f
	db "THUNDERBADGE.", $57
; 0x192291

UnknownText_0x192291: ; 0x192291
	db $0, "SURGE: THUNDER-", $4f
	db "BADGE increases", $55
	db "#MON's speed. ", $51
	db "Consider it proof", $4f
	db "that you defeated", $51
	db "me. You wear it", $4f
	db "proudly, hear?", $57
; 0x192303

UnknownText_0x192303: ; 0x192303
	db $0, "SURGE: Hey, kid!", $4f
	db "Still slugging and", $55
	db "chugging away?", $51
	db "My #MON and I", $4f
	db "are still at it!", $57
; 0x192356

GentlemanGregorySeenText: ; 0x192356
	db $0, "You're here to", $4f
	db "defeat LT.SURGE?", $51
	db "Not if I can help", $4f
	db "it!", $57
; 0x19238c

GentlemanGregoryBeatenText: ; 0x19238c
	db $0, "Sorry I failed", $4f
	db "you, LT.SURGE,", $55
	db "sir!", $57
; 0x1923b0

UnknownText_0x1923b0: ; 0x1923b0
	db $0, "When I was still", $4f
	db "in the army, LT.", $51
	db "SURGE saved my", $4f
	db "life.", $57
; 0x1923e8

GuitaristVincentSeenText: ; 0x1923e8
	db $0, "LT.SURGE recog-", $4f
	db "nized my potential", $51
	db "with electric", $4f
	db "#MON.", $51
	db "Think you can beat", $4f
	db "me?", $57
; 0x192437

GuitaristVincentBeatenText: ; 0x192437
	db $0, "Ooh, how shocking!", $57
; 0x19244b

UnknownText_0x19244b: ; 0x19244b
	db $0, "If the GYM's traps", $4f
	db "were working, you", $51
	db "would have been", $4f
	db "toast…", $57
; 0x192487

JugglerHortonSeenText: ; 0x192487
	db $0, "I'm going to take", $4f
	db "you down! Prepare", $55
	db "to be shocked!", $57
; 0x1924ba

JugglerHortonBeatenText: ; 0x1924ba
	db $0, "Gwaaah!", $4f
	db "I was overpowered…", $57
; 0x1924d6

UnknownText_0x1924d6: ; 0x1924d6
	db $0, "Don't get too com-", $4f
	db "fortable about", $51
	db "beating me…", $4f
	db "LT.SURGE is tough.", $57
; 0x192517

VermilionGymGuyText: ; 0x192517
	db $0, "Yo! CHAMP in", $4f
	db "making!", $51
	db "You lucked out", $4f
	db "this time.", $51
	db "LT.SURGE is very", $4f
	db "cautious. He has", $51
	db "traps set all over", $4f
	db "the GYM.", $51
	db "But--he-heh--the", $4f
	db "traps aren't", $55
	db "active right now.", $51
	db "You'll have no", $4f
	db "problem getting to", $55
	db "LT.SURGE.", $57
; 0x1925df

VermilionGymGuyWinText: ; 0x1925df
	db $0, "Whew! That was an", $4f
	db "electrifying bout!", $51
	db "It sure made me", $4f
	db "nervous.", $57
; 0x19261e

UnknownText_0x19261e: ; 0x19261e
	db $0, "Nope! Nothing here", $4f
	db "but trash.", $57
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
	signpost 15, 3, $0, MapVermilionGymSignpost16Script
	signpost 15, 6, $0, MapVermilionGymSignpost16Script

	; people-events
	db 5
	person_event SPRITE_SURGE, 6, 9, $6, $0, 255, 255, $b0, 0, SurgeScript_0x1920a5, $ffff
	person_event SPRITE_GENTLEMAN, 12, 12, $8, $0, 255, 255, $92, 4, TrainerGentlemanGregory, $ffff
	person_event SPRITE_ROCKER, 11, 8, $6, $3, 255, 255, $82, 3, TrainerGuitaristVincent, $ffff
	person_event SPRITE_SUPER_NERD, 14, 4, $9, $0, 255, 255, $92, 4, TrainerJugglerHorton, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $90, 1, VermilionGymGuyScript, $ffff
; 0x1926e3

