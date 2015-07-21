OlivineLighthouse5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperDenis:
	trainer EVENT_BEAT_BIRD_KEEPER_DENIS, BIRD_KEEPER, DENIS, Bird_keeperDenisSeenText, Bird_keeperDenisBeatenText, $0000, Bird_keeperDenisScript

Bird_keeperDenisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x60ac3
	closetext
	loadmovesprites
	end

TrainerSailorErnest:
	trainer EVENT_BEAT_SAILOR_ERNEST, SAILOR, ERNEST, SailorErnestSeenText, SailorErnestBeatenText, $0000, SailorErnestScript

SailorErnestScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x60a1f
	closetext
	loadmovesprites
	end

ItemFragment_0x609aa:
	db RARE_CANDY, 1

ItemFragment_0x609ac:
	db SUPER_REPEL, 1

ItemFragment_0x609ae:
	db TM_SWAGGER, 1

MapOlivineLighthouse5FSignpostItem0:
	dwb EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION, HYPER_POTION
	

SailorErnestSeenText:
	text "I wanted to battle"
	line "JASMINE, but she's"

	para "not up to it now."
	line "So, how about you?"
	done

SailorErnestBeatenText:
	text "Whoa, whoa. You're"
	line "overwhelming!"
	done

UnknownText_0x60a1f:
	text "A GYM LEADER isn't"
	line "just about being"

	para "strong. A LEADER"
	line "also needs to be"
	cont "compassionate."
	done

Bird_keeperDenisSeenText:
	text "We're pretty high"
	line "up here. My bird"

	para "#MON are in"
	line "prime form."
	done

Bird_keeperDenisBeatenText:
	text "Oops…They crashed…"
	done

UnknownText_0x60ac3:
	text "My #MON learned"
	line "how to use FLY in"
	cont "CIANWOOD."

	para "Well, since I'm a"
	line "loser, I'll FLY"
	cont "across the sea…"
	done

OlivineLighthouse5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 7
	warp_def $f, $9, 1, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
	warp_def $5, $3, 2, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $9, 3, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $10, 9, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $7, $11, 10, GROUP_OLIVINE_LIGHTHOUSE_4F, MAP_OLIVINE_LIGHTHOUSE_4F
	warp_def $5, $10, 2, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
	warp_def $5, $11, 3, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 13, 3, SIGNPOST_ITEM, MapOlivineLighthouse5FSignpostItem0

.PersonEvents:
	db 5
	person_event SPRITE_SAILOR, 15, 12, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSailorErnest, -1
	person_event SPRITE_YOUNGSTER, 7, 12, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerBird_keeperDenis, -1
	person_event SPRITE_POKE_BALL, 16, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x609aa, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	person_event SPRITE_POKE_BALL, 19, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x609ac, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	person_event SPRITE_POKE_BALL, 17, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x609ae, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
