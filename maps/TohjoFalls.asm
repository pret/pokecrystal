	object_const_def
	const TOHJOFALLS_POKE_BALL
	const TOHJOFALLS_GIOVANNI

TohjoFalls_MapScripts:
	def_scene_scripts
	scene_script TohjoFallsNoop1Scene, SCENE_TOHJO_FALLS_NOOP
	scene_script TohjoFallsNoop2Scene, SCENE_TOHJO_FALLS_GIOVANNI_BATTLE
	scene_script TohjoFallsNoop3Scene, SCENE_TOHJO_FALLS_NOOP_2

	def_callbacks
	
TohjoFallsNoop1Scene:
	end

TohjoFallsNoop2Scene:
	end
	
TohjoFallsNoop3Scene:
    end 

TohjoFallsMoonStone:
	itemball MOON_STONE
	
TohjoFallsGiovanni:
    moveobject TOHJOFALLS_GIOVANNI, 8, 14
	appear TOHJOFALLS_GIOVANNI
    applymovement PLAYER, TohjoFallsPlayerOneStepUpTwoStepsLeft
	turnobject PLAYER, LEFT 
	opentext
	writetext TohjoFallsGiovanniThinking
	waitbutton
	closetext
	turnobject TOHJOFALLS_GIOVANNI, RIGHT
	special FadeOutMusic
	opentext
	writetext TohjoFallsGiovanniBeforeText
	waitbutton
	closetext
	winlosstext TohjoFallsGiovanniWinText, TohjoFallsGiovanniLossText
	loadtrainer GIOVANNI, GIOVANNI2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	opentext
	writetext TohjoFallsGiovanniAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_EXIT_BUILDING
	disappear TOHJOFALLS_GIOVANNI
	pause 20
	special FadeInQuickly
	setscene SCENE_TOHJO_FALLS_NOOP_2
	setevent EVENT_PEWTER_CITY_FISHER_BLOCKS_HOUSE
	setevent EVENT_BEAT_GIOVANNI_IN_TOHJO_FALLS
	playmapmusic
	end 
	
TohjoFallsGiovanni2:
    moveobject TOHJOFALLS_GIOVANNI, 8, 14
	appear TOHJOFALLS_GIOVANNI
    applymovement PLAYER, TohjoFallsPlayerFourStepsLeft
	turnobject PLAYER, LEFT 
	opentext
	writetext TohjoFallsGiovanniThinking
	waitbutton
	closetext
	turnobject TOHJOFALLS_GIOVANNI, RIGHT
	special FadeOutMusic
	opentext
	writetext TohjoFallsGiovanniBeforeText
	waitbutton
	closetext
	winlosstext TohjoFallsGiovanniWinText, TohjoFallsGiovanniLossText
	loadtrainer GIOVANNI, GIOVANNI2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	reloadmapafterbattle
	opentext
	writetext TohjoFallsGiovanniAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_EXIT_BUILDING
	disappear TOHJOFALLS_GIOVANNI
	pause 20
	special FadeInQuickly
	setscene SCENE_TOHJO_FALLS_NOOP_2
	setevent EVENT_PEWTER_CITY_FISHER_BLOCKS_HOUSE
	setevent EVENT_BEAT_GIOVANNI_IN_TOHJO_FALLS
	playmapmusic
	end
	
TohjoFallsPlayerOneStepUpTwoStepsLeft:
    step LEFT
	step LEFT
	step LEFT
	step UP 
	step_end 
	
TohjoFallsPlayerFourStepsLeft:
    step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end 
	
TohjoFallsGiovanniThinking:
    text "…"
	done 
	
TohjoFallsGiovanniBeforeText:
    text "GIOVANNI: I must"
	line "say, I'm impressed"
	cont "you knew where to"
	cont "find me."
	
	para "I failed to make"
	line "use full use of"
	cont "my subordiantes'"
	cont "potential…"
	
	para "…And failed to"
	line "bring out the"
	cont "best out of my"
	cont "#MON."
	
	para "One must"
	line "acknowledge"
	cont "one's defeat"
	cont "before he can"
	cont "move on."
	
	para "Thus, I have"
	line "dedicated myself"
	cont "to the study of"
	cont "#MON."
	
	para "And such endeavor"
	line "has produced"
	cont "results."
	
	para "I now have my old"
	line "creation and the"
	cont "strongest #MON"
	cont "at my disposal!"
	
	para "Once more, you"
	line "shall face"
	cont "GIOVANNI, the"
	cont "greatest trainer!"
	done

TohjoFallsGiovanniWinText:
    text "Ha! That was a"
    line "truly intense"
    cont "fight."
    done 

TohjoFallsGiovanniAfterText:
    text "I see that you've"
    line "raised your"
    cont "#MON with"
    cont "utmost care."

    para "Your skill is"
    line "most impressive."

    para "It seems I still"
    line "have more to"
    cont "learn."
    
    para "I hope we get"
    line "to battle again"
    cont "someday."
   
    para "Farewell."
    done 

TohjoFallsGiovanniLossText:
    text "Mark my words."

    para "Not being able"
    line "to measure your"
    cont "own strength"
    cont "shows that you"
    cont "are still but a"
    cont "child."
    done 	

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	def_coord_events
	coord_event 12, 15, SCENE_TOHJO_FALLS_GIOVANNI_BATTLE, TohjoFallsGiovanni
	coord_event 13, 14, SCENE_TOHJO_FALLS_GIOVANNI_BATTLE, TohjoFallsGiovanni2

	def_bg_events

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
	object_event -5, 13, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TOHJO_FALLS_GIOVANNI
