WiseTriosRoom_MapScriptHeader: ; 0x98565
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x98572, $0000
	dw UnknownScript_0x98573, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x98574
; 0x98572

UnknownScript_0x98572: ; 0x98572
	end
; 0x98573

UnknownScript_0x98573: ; 0x98573
	end
; 0x98574

UnknownScript_0x98574: ; 0x98574
	checkbit1 $0335
	iftrue UnknownScript_0x98593
	checkbit1 $0334
	iftrue UnknownScript_0x9858c
	checkitem CLEAR_BELL
	iftrue UnknownScript_0x9858c
	clearbit1 $07ab
	setbit1 $07ac
	return
; 0x9858c

UnknownScript_0x9858c: ; 0x9858c
	setbit1 $07ab
	clearbit1 $07ac
	return
; 0x98593

UnknownScript_0x98593: ; 0x98593
	setbit1 $07ab
	setbit1 $07ac
	return
; 0x9859a

SageScript_0x9859a: ; 0x9859a
	jumptextfaceplayer UnknownText_0x9862b
; 0x9859d

SageScript_0x9859d: ; 0x9859d
	jumptextfaceplayer UnknownText_0x9868b
; 0x985a0

SageScript_0x985a0: ; 0x985a0
	jumptextfaceplayer UnknownText_0x987af
; 0x985a3

UnknownScript_0x985a3: ; 0x985a3
	spriteface $4, $1
	spriteface $0, $0
	showemote $0, $4, 20
	follow $0, $4
	applymovement $0, MovementData_0x98622
	stopfollow
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x98712
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x98625
	spriteface $4, $2
	end
; 0x985c6

TrainerSageGaku: ; 0x985c6
	; bit/flag number
	dw $5c9

	; trainer group && trainer id
	db SAGE, GAKU

	; text when seen
	dw SageGakuSeenText

	; text when trainer beaten
	dw SageGakuBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageGakuScript
; 0x985d2

SageGakuScript: ; 0x985d2
	loadfont
	2writetext UnknownText_0x98938
	closetext
	loadmovesprites
	end
; 0x985d9

TrainerSageMasa: ; 0x985d9
	; bit/flag number
	dw $5ca

	; trainer group && trainer id
	db SAGE, MASA

	; text when seen
	dw SageMasaSeenText

	; text when trainer beaten
	dw SageMasaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageMasaScript
; 0x985e5

SageMasaScript: ; 0x985e5
	loadfont
	2writetext UnknownText_0x98a35
	closetext
	loadmovesprites
	end
; 0x985ec

TrainerSageKoji: ; 0x985ec
	; bit/flag number
	dw $5cb

	; trainer group && trainer id
	db SAGE, KOJI

	; text when seen
	dw SageKojiSeenText

	; text when trainer beaten
	dw SageKojiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageKojiScript
; 0x985f8

SageKojiScript: ; 0x985f8
	checkbit1 $0334
	iftrue UnknownScript_0x9861b
	pause 10
	showemote $0, $7, 20
	loadfont
	2writetext UnknownText_0x98c6c
	keeptextopen
	2writetext UnknownText_0x98cac
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x98628
	spriteface $7, $1
	setbit1 $0334
	dotrigger $1
	end
; 0x9861b

UnknownScript_0x9861b: ; 0x9861b
	loadfont
	2writetext UnknownText_0x98db5
	closetext
	loadmovesprites
	end
; 0x98622

MovementData_0x98622: ; 0x98622
	step_left
	step_left
	step_end
; 0x98625

MovementData_0x98625: ; 0x98625
	step_right
	step_down
	step_end
; 0x98628

MovementData_0x98628: ; 0x98628
	step_right
	step_down
	step_end
; 0x9862b

UnknownText_0x9862b: ; 0x9862b
	db $0, "Astounding…", $51
	db "SUICUNE, ENTEI and", $4f
	db "RAIKOU have arisen", $55
	db "from their sleep…", $51
	db "Is the legend", $4f
	db "coming true?", $57
; 0x9868b

UnknownText_0x9868b: ; 0x9868b
	db $0, "We train at the", $4f
	db "BURNED TOWER, but", $51
	db "we've never heard", $4f
	db "of a hole opening", $51
	db "up there before.", $4f
	db "It must have been", $51
	db "deliberately made", $4f
	db "by someone.", $57
; 0x98712

UnknownText_0x98712: ; 0x98712
	db $0, "TIN TOWER may be", $4f
	db "entered by those", $51
	db "bearing ECRUTEAK's", $4f
	db "GYM BADGE.", $51
	db "However, now that", $4f
	db "SUICUNE, RAIKOU", $51
	db "and ENTEI have", $4f
	db "arisen, I ask you", $51
	db "to refrain from", $4f
	db "entering!", $57
; 0x987af

UnknownText_0x987af: ; 0x987af
	db $0, "We, the WISE TRIO,", $4f
	db "are the protectors", $51
	db "of the legendary", $4f
	db "#MON.", $57
; 0x987ed

SageGakuSeenText: ; 0x987ed
	db $0, "Legend has it that", $4f
	db "upon the emergence", $51
	db "of a trainer who", $4f
	db "has the ability to", $51
	db "touch the souls of", $4f
	db "#MON, a #MON", $51
	db "will come forth to", $4f
	db "put that trainer", $51
	db "to test at the TIN", $4f
	db "TOWER.", $51
	db "The legend has", $4f
	db "come true!", $51
	db "The legendary", $4f
	db "#MON SUICUNE", $55
	db "has arrived!", $51
	db "We, the WISE TRIO,", $4f
	db "shall test your", $51
	db "worthiness to go", $4f
	db "inside!", $57
; 0x98914

SageGakuBeatenText: ; 0x98914
	db $0, "Stronger than we", $4f
	db "thought? Perhaps…", $57
; 0x98938

UnknownText_0x98938: ; 0x98938
	db $0, "Ah, so it is you", $4f
	db "who claim to have", $51
	db "seen SUICUNE,", $4f
	db "ENTEI and RAIKOU", $55
	db "while they slept?", $51
	db "Unbelievable!", $51
	db "Legend has it that", $4f
	db "they can't be seen", $55
	db "while they sleep…", $57
; 0x989d2

SageMasaSeenText: ; 0x989d2
	db $0, "Can you be trusted", $4f
	db "with the truth?", $51
	db "I must ascertain", $4f
	db "your worthiness.", $57
; 0x98a18

SageMasaBeatenText: ; 0x98a18
	db $0, "…I will tell you", $4f
	db "the truth…", $57
; 0x98a35

UnknownText_0x98a35: ; 0x98a35
	db $0, "In the past, there", $4f
	db "were two nine-tier", $55
	db "towers here.", $51
	db "The BRASS TOWER,", $4f
	db "which was said to", $51
	db "awaken #MON,", $4f
	db "and the TIN TOWER,", $51
	db "where #MON were", $4f
	db "said to rest.", $51
	db "The view from the", $4f
	db "tops of the TOWERS", $51
	db "must have been", $4f
	db "magnificent.", $51
	db "At the time, an", $4f
	db "immense, silver-", $51
	db "colored #MON", $4f
	db "was said to make", $51
	db "its roost atop the", $4f
	db "BRASS TOWER.", $51
	db "However…", $51
	db "About 150 years", $4f
	db "ago, a lightning", $51
	db "bolt struck one of", $4f
	db "the TOWERS.", $51
	db "It was engulfed in", $4f
	db "flames that raged", $55
	db "for three days.", $51
	db "A sudden downpour", $4f
	db "finally put out", $55
	db "the blaze.", $51
	db "And that is how", $4f
	db "the BURNED TOWER", $55
	db "came to be.", $57
; 0x98c42

SageKojiSeenText: ; 0x98c42
	db $0, "Let me see your", $4f
	db "power!", $57
; 0x98c5a

SageKojiBeatenText: ; 0x98c5a
	db $0, "Too strong!", $4f
	db "Why?", $57
; 0x98c6c

UnknownText_0x98c6c: ; 0x98c6c
	db $0, "You… Are you the", $4f
	db "trainer who is", $51
	db "awaited by the", $4f
	db "legendary #MON?", $57
; 0x98cac

UnknownText_0x98cac: ; 0x98cac
	db $0, "I see…", $51
	db "We, the WISE TRIO,", $4f
	db "have been given ", $51
	db "the responsibility", $4f
	db "of protecting the", $51
	db "legendary #MON.", $4f
	db "We are to allow", $51
	db "passage only to", $4f
	db "those people who", $51
	db "possess the power", $4f
	db "and soul of truth.", $51
	db "Please, do go on", $4f
	db "and enter the TIN", $55
	db "TOWER ahead.", $51
	db "SUICUNE will put", $4f
	db "you to the test.", $57
; 0x98db5

UnknownText_0x98db5: ; 0x98db5
	db $0, "Please, do go on.", $51
	db "SUICUNE will put", $4f
	db "you to the test.", $57
; 0x98dea

WiseTriosRoom_MapEventHeader: ; 0x98dea
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $4, $7, 4, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $7, 5, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $4, $1, 5, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE

	; xy triggers
	db 1
	xy_trigger 0, $4, $7, $0, UnknownScript_0x985a3, $0, $0

	; signposts
	db 0

	; people-events
	db 6
	person_event SPRITE_SAGE, 6, 10, $3, $0, 255, 255, $0, 0, SageScript_0x9859a, $07ab
	person_event SPRITE_SAGE, 11, 10, $5, $1, 255, 255, $0, 0, SageScript_0x9859d, $07ab
	person_event SPRITE_SAGE, 9, 11, $8, $0, 255, 255, $0, 0, SageScript_0x985a0, $07ab
	person_event SPRITE_SAGE, 6, 8, $6, $0, 255, 255, $2, 2, TrainerSageGaku, $07ac
	person_event SPRITE_SAGE, 10, 8, $7, $0, 255, 255, $2, 2, TrainerSageMasa, $07ac
	person_event SPRITE_SAGE, 8, 10, $8, $0, 255, 255, $2, 2, TrainerSageKoji, $07ac
; 0x98e55

