const_value set 2
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_MONSTER
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

JasmineScript_0x60b91:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue UnknownScript_0x60bab
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue UnknownScript_0x60ba5
	writetext UnknownText_0x60c81
	buttonsound
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
UnknownScript_0x60ba5:
	writetext UnknownText_0x60d64
	waitbutton
	closetext
	end

UnknownScript_0x60bab:
	writetext UnknownText_0x60d99
	yesorno
	iffalse UnknownScript_0x60c25
	writetext UnknownText_0x60dc3
	buttonsound
	takeitem SECRETPOTION
	writetext UnknownText_0x60dea
	waitbutton
	closetext
	spriteface OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext UnknownText_0x60e44
	pause 60
	buttonsound
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	pause 10
	special FadeInPalettes
	opentext
	writetext UnknownText_0x60f3d
	waitbutton
	closetext
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	faceplayer
	opentext
	writetext UnknownText_0x60e6c
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	checkcode VAR_FACING
	if_equal DOWN, UnknownScript_0x60c17
	if_equal RIGHT, UnknownScript_0x60c1e
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c68
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

UnknownScript_0x60c17:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c70
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

UnknownScript_0x60c1e:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, MovementData_0x60c79
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

UnknownScript_0x60c25:
	writetext UnknownText_0x60edf
	waitbutton
	closetext
	spriteface OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	spriteface OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	writetext UnknownText_0x60ef1
	waitbutton
	closetext
	end

UnknownScript_0x60c39:
	end

MonsterScript_0x60c3a:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0x60c51
	writetext UnknownText_0x60f03
	writebyte AMPHAROS
	special PlaySlowCry
	buttonsound
	writetext UnknownText_0x60f19
	waitbutton
	closetext
	end

UnknownScript_0x60c51:
	writetext UnknownText_0x60f3d
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

MovementData_0x60c68:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

MovementData_0x60c70:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x60c79:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

UnknownText_0x60c81:
	text "JASMINE: … This"
	line "#MON always"

	para "kept the sea lit"
	line "at night."

	para "…But it suddenly"
	line "got sick… It's"
	cont "gasping for air…"

	para "…I understand"
	line "that there is a"

	para "wonderful PHARMACY"
	line "in CIANWOOD…"

	para "But that's across"
	line "the sea…"

	para "And I can't leave"
	line "AMPHY unattended…"
	done

UnknownText_0x60d64:
	text "…May I ask you to"
	line "get some medicine"
	cont "for me? Please?"
	done

UnknownText_0x60d99:
	text "JASMINE: …Will"
	line "that medicine cure"
	cont "AMPHY?"
	done

UnknownText_0x60dc3:
	text "<PLAYER> handed the"
	line "SECRETPOTION to"
	cont "JASMINE."
	done

UnknownText_0x60dea:
	text "JASMINE: …Um,"
	line "please don't be"
	cont "offended…"

	para "…AMPHY will not"
	line "take anything from"
	cont "anyone but me…"
	done

UnknownText_0x60e44:
	text "JASMINE: …"

	para "AMPHY, how are you"
	line "feeling?"
	done

UnknownText_0x60e6c:
	text "JASMINE: …Oh, I'm"
	line "so relieved…"

	para "This is just so"
	line "wonderful…"

	para "Thank you so very,"
	line "very much."

	para "…I will return to"
	line "the GYM…"
	done

UnknownText_0x60edf:
	text "JASMINE: …I see…"
	done

UnknownText_0x60ef1:
	text "…AMPHY, hang on!"
	done

UnknownText_0x60f03:
	text "AMPHY: …"
	line "…Pa… paloo…"
	done

UnknownText_0x60f19:
	text "Its breathing is"
	line "terribly labored…"
	done

UnknownText_0x60f3d:
	text "AMPHY: Palu!"
	line "Palulu!"
	done

OlivineLighthouse6F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $f, $9, 1, OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $10, 6, OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $11, 7, OLIVINE_LIGHTHOUSE_5F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_JASMINE, 8, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JasmineScript_0x60b91, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	person_event SPRITE_MONSTER, 8, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MonsterScript_0x60c3a, -1
	person_event SPRITE_POKE_BALL, 4, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
