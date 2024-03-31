	object_const_def
	const CELADONMANSIONROOF_TEAM_ROCKET

CeladonMansionRoof_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonArcherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CELADON_ARCHER
	iftrue .FightDone
	writetext ArcherIntroText
	waitbutton
	closetext
	winlosstext ArcherWinLossText, 0
	loadtrainer TEAM_ROCKET, ARCHER2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CELADON_ARCHER
    opentext
    writetext ArcherMatchAfterText
    waitbutton
    closetext
    end
	
.FightDone: 
    writetext ArcherMatchText
    yesorno
    iftrue .DoMatch
    ; keep going if false 

.DontDoMatch:
    writetext ArcherMatchRefuseText
    waitbutton
    closetext
    end 

.DoMatch:
    checkevent EVENT_BEAT_RED
	iftrue .DoMatch2
; player hasn't beaten Red yet
    writetext ArcherMatchAcceptText
    waitbutton
    closetext
	winlosstext ArcherWinLossText, 0
	loadtrainer TEAM_ROCKET, ARCHER2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	opentext
	writetext ArcherMatch2AfterText
    waitbutton
    closetext
    end

.DoMatch2:
    writetext ArcherMatchAcceptText
    waitbutton
    closetext
    winlosstext ArcherWinLossText, 0
    loadtrainer TEAM_ROCKET, ARCHER3
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
    startbattle
    reloadmapafterbattle
    opentext
    writetext ArcherMatch2AfterText
    waitbutton
    closetext
    end  	

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

ArcherIntroText:
    text "ARCHER: So we"
	line "meet again,"
	cont "<PLAY_G>."
	
	para "I had a feeling"
	line "that you'd find"
	cont "me even here…"
	
	para "3 years ago"
	line "TEAM ROCKET's"
	cont "HIDEOUT used"
	cont "to be here, in"
	cont "this very city."
	
	para "That was until"
	line "a boy named RED"
	cont "defeated us and"
	cont "ruined our plans…"
	
	para "Just like you did"
	line "in JOHTO."
	
	para "After all these"
	line "these years for"
	cont "our efforts to"
	cont "come to nothing…"
	
	para "It's not my style"
	line "to be emotional,"
	cont "but I wanted to"
	cont "give you a"
	cont "glimpse of how"
	cont "I've felt."
	done 
	
ArcherWinLossText:
    text "What a blunder…"
    done 
	
ArcherMatchAfterText:
    text "I knew it would"
	line "end this way…"
	
	para "It takes a special"
    line "trainer to" 
	cont "singlehandedly"
	cont "foil our plans."
	
	para "I've heard no word"
	line "about the other"
	cont "TEAM ROCKET"
	cont "members."
	
	para "Our dream has come"
	line "to an end and the"
	cont "organization is"
	cont "done for, this"
	cont "time for good."
	
	para "There are rumors"
	line "that BOSS has been"
	cont "seen around TOHJO"
	cont "FALLS, but…"
	
	para "I haven't been"
	line "able to find him."
	
	para "Humph. …Take care."
	done

ArcherMatchText:
    text "It's you again…"
	
	para "I can only think"
	line "of one reason as"
	cont "to why you'd speak"
	cont "to me again."
    
    para "Is it a battle"
    line "that you want?"
	done 
	
ArcherMatchAcceptText:
    text "Fine. I'll accept"
	line "your challenge."
	done 
	
ArcherMatchRefuseText:
    text "Is that so?"
	done 
	
ArcherMatch2AfterText:
    text "You are indeed"
	line "powerful."
	
	para "It's a shame that"
	line "you didn't share"
	cont "our vision."
	done 
	
CeladonMansionRoofGraffitiText:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, CeladonMansionRoofGraffiti

	def_object_events
	object_event  7,  8, SPRITE_TEAM_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonArcherScript, -1
