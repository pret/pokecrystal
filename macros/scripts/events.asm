; ScriptCommandTable indexes (see engine/overworld/scripting.asm)
	const_def

	const scall_command ; $00
MACRO scall
	db scall_command
	dw \1 ; pointer
ENDM

	const farscall_command ; $01
MACRO farscall
	db farscall_command
	dba \1
ENDM

	const memcall_command ; $02
MACRO memcall
	db memcall_command
	dw \1 ; pointer
ENDM

	const sjump_command ; $03
MACRO sjump
	db sjump_command
	dw \1 ; pointer
ENDM

	const farsjump_command ; $04
MACRO farsjump
	db farsjump_command
	dba \1
ENDM

	const memjump_command ; $05
MACRO memjump
	db memjump_command
	dw \1 ; pointer
ENDM

	const ifequal_command ; $06
MACRO ifequal
	db ifequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const ifnotequal_command ; $07
MACRO ifnotequal
	db ifnotequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const iffalse_command ; $08
MACRO iffalse
	db iffalse_command
	dw \1 ; pointer
ENDM

	const iftrue_command ; $09
MACRO iftrue
	db iftrue_command
	dw \1 ; pointer
ENDM

	const ifgreater_command ; $0a
MACRO ifgreater
	db ifgreater_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const ifless_command ; $0b
MACRO ifless
	db ifless_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const jumpstd_command ; $0c
MACRO jumpstd
	db jumpstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	const callstd_command ; $0d
MACRO callstd
	db callstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	const callasm_command ; $0e
MACRO callasm
	db callasm_command
	dba \1
ENDM

	const special_command ; $0f
MACRO special
	db special_command
	dw (\1Special - SpecialsPointers) / 3
ENDM

	const memcallasm_command ; $10
MACRO memcallasm
	db memcallasm_command
	dw \1 ; asm
ENDM

	const checkmapscene_command ; $11
MACRO checkmapscene
	db checkmapscene_command
	map_id \1 ; map
ENDM

	const setmapscene_command ; $12
MACRO setmapscene
	db setmapscene_command
	map_id \1 ; map
	db \2 ; scene_id
ENDM

	const checkscene_command ; $13
MACRO checkscene
	db checkscene_command
ENDM

	const setscene_command ; $14
MACRO setscene
	db setscene_command
	db \1 ; scene_id
ENDM

	const setval_command ; $15
MACRO setval
	db setval_command
	db \1 ; value
ENDM

	const addval_command ; $16
MACRO addval
	db addval_command
	db \1 ; value
ENDM

	const random_command ; $17
MACRO random
	db random_command
	db \1 ; input
ENDM

	const checkver_command ; $18
MACRO checkver
	db checkver_command
ENDM

	const readmem_command ; $19
MACRO readmem
	db readmem_command
	dw \1 ; address
ENDM

	const writemem_command ; $1a
MACRO writemem
	db writemem_command
	dw \1 ; address
ENDM

	const loadmem_command ; $1b
MACRO loadmem
	db loadmem_command
	dw \1 ; address
	db \2 ; value
ENDM

	const readvar_command ; $1c
MACRO readvar
	db readvar_command
	db \1 ; variable_id
ENDM

	const writevar_command ; $1d
MACRO writevar
	db writevar_command
	db \1 ; variable_id
ENDM

	const loadvar_command ; $1e
MACRO loadvar
	if STRIN("\1", "VAR_") != 1
	; LEGACY: Support for the old name of "loadmem"
		loadmem \1, \2
	else
		db loadvar_command
		db \1 ; variable_id
		db \2 ; value
	endc
ENDM

	const giveitem_command ; $1f
MACRO giveitem
	if _NARG == 1
		giveitem \1, 1
	else
		db giveitem_command
		db \1 ; item
		db \2 ; quantity
	endc
ENDM

	const takeitem_command ; $20
MACRO takeitem
	if _NARG == 1
		takeitem \1, 1
	else
		db takeitem_command
		db \1 ; item
		db \2 ; quantity
	endc
ENDM

	const checkitem_command ; $21
MACRO checkitem
	db checkitem_command
	db \1 ; item
ENDM

	const givemoney_command ; $22
MACRO givemoney
	db givemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const takemoney_command ; $23
MACRO takemoney
	db takemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const checkmoney_command ; $24
MACRO checkmoney
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const givecoins_command ; $25
MACRO givecoins
	db givecoins_command
	dw \1 ; coins
ENDM

	const takecoins_command ; $26
MACRO takecoins
	db takecoins_command
	dw \1 ; coins
ENDM

	const checkcoins_command ; $27
MACRO checkcoins
	db checkcoins_command
	dw \1 ; coins
ENDM

	const addcellnum_command ; $28
MACRO addcellnum
	db addcellnum_command
	db \1 ; person
ENDM

	const delcellnum_command ; $29
MACRO delcellnum
	db delcellnum_command
	db \1 ; person
ENDM

	const checkcellnum_command ; $2a
MACRO checkcellnum
	db checkcellnum_command
	db \1 ; person
ENDM

	const checktime_command ; $2b
MACRO checktime
	db checktime_command
	db \1 ; time
ENDM

	const checkpoke_command ; $2c
MACRO checkpoke
	db checkpoke_command
	db \1 ; pkmn
ENDM

	const givepoke_command ; $2d
MACRO givepoke
	if _NARG == 2
		givepoke \1, \2, NO_ITEM, FALSE
	elif _NARG == 3
		givepoke \1, \2, \3, FALSE
	elif _NARG == 5
		givepoke \1, \2, \3, TRUE, \4, \5
	else
		db givepoke_command
		db \1 ; pokemon
		db \2 ; level
		db \3 ; item
		db \4 ; trainer
		if \4
			dw \5 ; nickname_pointer
			dw \6 ; ot_name_pointer
		endc
	endc
ENDM

	const giveegg_command ; $2e
MACRO giveegg
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

	const givepokemail_command ; $2f
MACRO givepokemail
	db givepokemail_command
	dw \1 ; pointer
ENDM

	const checkpokemail_command ; $30
MACRO checkpokemail
	db checkpokemail_command
	dw \1 ; pointer
ENDM

	const checkevent_command ; $31
MACRO checkevent
	db checkevent_command
	dw \1 ; event_flag
ENDM

	const clearevent_command ; $32
MACRO clearevent
	db clearevent_command
	dw \1 ; event_flag
ENDM

	const setevent_command ; $33
MACRO setevent
	db setevent_command
	dw \1 ; event_flag
ENDM

	const checkflag_command ; $34
MACRO checkflag
	db checkflag_command
	dw \1 ; engine_flag
ENDM

	const clearflag_command ; $35
MACRO clearflag
	db clearflag_command
	dw \1 ; engine_flag
ENDM

	const setflag_command ; $36
MACRO setflag
	db setflag_command
	dw \1 ; engine_flag
ENDM

	const wildon_command ; $37
MACRO wildon
	db wildon_command
ENDM

	const wildoff_command ; $38
MACRO wildoff
	db wildoff_command
ENDM

	const xycompare_command ; $39
MACRO xycompare
	db xycompare_command
	dw \1 ; pointer
ENDM

	const warpmod_command ; $3a
MACRO warpmod
	db warpmod_command
	db \1 ; warp_id
	map_id \2 ; map
ENDM

	const blackoutmod_command ; $3b
MACRO blackoutmod
	db blackoutmod_command
	map_id \1 ; map
ENDM

	const warp_command ; $3c
MACRO warp
	db warp_command
	map_id \1 ; map
	db \2 ; x
	db \3 ; y
ENDM

	const getmoney_command ; $3d
MACRO getmoney
	db getmoney_command
	db \2 ; account
	db \1 ; string_buffer
ENDM

	const getcoins_command ; $3e
MACRO getcoins
	db getcoins_command
	db \1 ; string_buffer
ENDM

	const getnum_command ; $3f
MACRO getnum
	db getnum_command
	db \1 ; string_buffer
ENDM

	const getmonname_command ; $40
MACRO getmonname
	db getmonname_command
	db \2 ; pokemon
	db \1 ; string_buffer
ENDM

	const getitemname_command ; $41
MACRO getitemname
	db getitemname_command
	db \2 ; item
	db \1 ; string_buffer
ENDM

	const getcurlandmarkname_command ; $42
MACRO getcurlandmarkname
	db getcurlandmarkname_command
	db \1 ; string_buffer
ENDM

	const gettrainername_command ; $43
MACRO gettrainername
	db gettrainername_command
	db \2 ; trainer_group
	db \3 ; trainer_id
	db \1 ; string_buffer
ENDM

	const getstring_command ; $44
MACRO getstring
	db getstring_command
	dw \2 ; text_pointer
	db \1 ; string_buffer
ENDM

	const itemnotify_command ; $45
MACRO itemnotify
	db itemnotify_command
ENDM

	const pocketisfull_command ; $46
MACRO pocketisfull
	db pocketisfull_command
ENDM

	const opentext_command ; $47
MACRO opentext
	db opentext_command
ENDM

	const refreshscreen_command ; $48
MACRO refreshscreen
	if _NARG == 0
		refreshscreen 0
	else
		db refreshscreen_command
		db \1 ; dummy
	endc
ENDM

	const closetext_command ; $49
MACRO closetext
	db closetext_command
ENDM

	const writeunusedbyte_command ; $4a
MACRO writeunusedbyte
	db writeunusedbyte_command
	db \1 ; byte
ENDM

	const farwritetext_command ; $4b
MACRO farwritetext
	db farwritetext_command
	dba \1
ENDM

	const writetext_command ; $4c
MACRO writetext
	db writetext_command
	dw \1 ; text_pointer
ENDM

	const repeattext_command ; $4d
MACRO repeattext
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
ENDM

	const yesorno_command ; $4e
MACRO yesorno
	db yesorno_command
ENDM

	const loadmenu_command ; $4f
MACRO loadmenu
	db loadmenu_command
	dw \1 ; menu_header
ENDM

	const closewindow_command ; $50
MACRO closewindow
	db closewindow_command
ENDM

	const jumptextfaceplayer_command ; $51
MACRO jumptextfaceplayer
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
ENDM

	const farjumptext_command ; $52
MACRO farjumptext
	db farjumptext_command
	dba \1
ENDM

	const jumptext_command ; $53
MACRO jumptext
	db jumptext_command
	dw \1 ; text_pointer
ENDM

	const waitbutton_command ; $54
MACRO waitbutton
	db waitbutton_command
ENDM

	const promptbutton_command ; $55
MACRO promptbutton
	db promptbutton_command
ENDM

	const pokepic_command ; $56
MACRO pokepic
	db pokepic_command
	db \1 ; pokemon
ENDM

	const closepokepic_command ; $57
MACRO closepokepic
	db closepokepic_command
ENDM

	const _2dmenu_command ; $58
MACRO _2dmenu
	db _2dmenu_command
ENDM

	const verticalmenu_command ; $59
MACRO verticalmenu
	db verticalmenu_command
ENDM

	const loadpikachudata_command ; $5a
MACRO loadpikachudata
	db loadpikachudata_command
ENDM

	const randomwildmon_command ; $5b
MACRO randomwildmon
	db randomwildmon_command
ENDM

	const loadtemptrainer_command ; $5c
MACRO loadtemptrainer
	db loadtemptrainer_command
ENDM

	const loadwildmon_command ; $5d
MACRO loadwildmon
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
ENDM

	const loadtrainer_command ; $5e
MACRO loadtrainer
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
ENDM

	const startbattle_command ; $5f
MACRO startbattle
	db startbattle_command
ENDM

	const reloadmapafterbattle_command ; $60
MACRO reloadmapafterbattle
	db reloadmapafterbattle_command
ENDM

	const catchtutorial_command ; $61
MACRO catchtutorial
	db catchtutorial_command
	db \1 ; byte
ENDM

	const trainertext_command ; $62
MACRO trainertext
	db trainertext_command
	db \1 ; text_id
ENDM

	const trainerflagaction_command ; $63
MACRO trainerflagaction
	db trainerflagaction_command
	db \1 ; action
ENDM

	const winlosstext_command ; $64
MACRO winlosstext
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
ENDM

	const scripttalkafter_command ; $65
MACRO scripttalkafter
	db scripttalkafter_command
ENDM

	const endifjustbattled_command ; $66
MACRO endifjustbattled
	db endifjustbattled_command
ENDM

	const checkjustbattled_command ; $67
MACRO checkjustbattled
	db checkjustbattled_command
ENDM

	const setlasttalked_command ; $68
MACRO setlasttalked
	db setlasttalked_command
	db \1 ; object id
ENDM

	const applymovement_command ; $69
MACRO applymovement
	db applymovement_command
	db \1 ; object id
	dw \2 ; data
ENDM

	const applymovementlasttalked_command ; $6a
MACRO applymovementlasttalked
	db applymovementlasttalked_command
	dw \1 ; data
ENDM

	const faceplayer_command ; $6b
MACRO faceplayer
	db faceplayer_command
ENDM

	const faceobject_command ; $6c
MACRO faceobject
	db faceobject_command
	db \1 ; object1
	db \2 ; object2
ENDM

	const variablesprite_command ; $6d
MACRO variablesprite
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
ENDM

	const disappear_command ; $6e
MACRO disappear
	db disappear_command
	db \1 ; object id
ENDM

	const appear_command ; $6f
MACRO appear
	db appear_command
	db \1 ; object id
ENDM

	const follow_command ; $70
MACRO follow
	db follow_command
	db \1 ; object2
	db \2 ; object1
ENDM

	const stopfollow_command ; $71
MACRO stopfollow
	db stopfollow_command
ENDM

	const moveobject_command ; $72
MACRO moveobject
	db moveobject_command
	db \1 ; object id
	db \2 ; x
	db \3 ; y
ENDM

	const writeobjectxy_command ; $73
MACRO writeobjectxy
	db writeobjectxy_command
	db \1 ; object id
ENDM

	const loademote_command ; $74
MACRO loademote
	db loademote_command
	db \1 ; bubble
ENDM

	const showemote_command ; $75
MACRO showemote
	db showemote_command
	db \1 ; bubble
	db \2 ; object id
	db \3 ; time
ENDM

	const turnobject_command ; $76
MACRO turnobject
	db turnobject_command
	db \1 ; object id
	db \2 ; facing
ENDM

	const follownotexact_command ; $77
MACRO follownotexact
	db follownotexact_command
	db \1 ; object2
	db \2 ; object1
ENDM

	const earthquake_command ; $78
MACRO earthquake
	db earthquake_command
	db \1 ; param
ENDM

	const changemapblocks_command ; $79
MACRO changemapblocks
	db changemapblocks_command
	dba \1 ; map_data_pointer
ENDM

	const changeblock_command ; $7a
MACRO changeblock
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
ENDM

	const reloadmap_command ; $7b
MACRO reloadmap
	db reloadmap_command
ENDM

	const reloadmappart_command ; $7c
MACRO reloadmappart
	db reloadmappart_command
ENDM

	const writecmdqueue_command ; $7d
MACRO writecmdqueue
	db writecmdqueue_command
	dw \1 ; queue_pointer
ENDM

	const delcmdqueue_command ; $7e
MACRO delcmdqueue
	db delcmdqueue_command
	db \1 ; byte
ENDM

	const playmusic_command ; $7f
MACRO playmusic
	db playmusic_command
	dw \1 ; music_pointer
ENDM

	const encountermusic_command ; $80
MACRO encountermusic
	db encountermusic_command
ENDM

	const musicfadeout_command ; $81
MACRO musicfadeout
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
ENDM

	const playmapmusic_command ; $82
MACRO playmapmusic
	db playmapmusic_command
ENDM

	const dontrestartmapmusic_command ; $83
MACRO dontrestartmapmusic
	db dontrestartmapmusic_command
ENDM

	const cry_command ; $84
MACRO cry
	db cry_command
	dw \1 ; cry_id
ENDM

	const playsound_command ; $85
MACRO playsound
	db playsound_command
	dw \1 ; sound_pointer
ENDM

	const waitsfx_command ; $86
MACRO waitsfx
	db waitsfx_command
ENDM

	const warpsound_command ; $87
MACRO warpsound
	db warpsound_command
ENDM

	const specialsound_command ; $88
MACRO specialsound
	db specialsound_command
ENDM

	const autoinput_command ; $89
MACRO autoinput
	db autoinput_command
	dba \1
ENDM

	const newloadmap_command ; $8a
MACRO newloadmap
	db newloadmap_command
	db \1 ; which_method
ENDM

	const pause_command ; $8b
MACRO pause
	db pause_command
	db \1 ; length
ENDM

	const deactivatefacing_command ; $8c
MACRO deactivatefacing
	db deactivatefacing_command
	db \1 ; time
ENDM

	const sdefer_command ; $8d
MACRO sdefer
	db sdefer_command
	dw \1 ; pointer
ENDM

	const warpcheck_command ; $8e
MACRO warpcheck
	db warpcheck_command
ENDM

	const stopandsjump_command ; $8f
MACRO stopandsjump
	db stopandsjump_command
	dw \1 ; pointer
ENDM

	const endcallback_command ; $90
MACRO endcallback
	db endcallback_command
ENDM

	const end_command ; $91
MACRO end
	db end_command
ENDM

	const reloadend_command ; $92
MACRO reloadend
	db reloadend_command
	db \1 ; which_method
ENDM

	const endall_command ; $93
MACRO endall
	db endall_command
ENDM

	const pokemart_command ; $94
MACRO pokemart
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
ENDM

	const elevator_command ; $95
MACRO elevator
	db elevator_command
	dw \1 ; floor_list_pointer
ENDM

	const trade_command ; $96
MACRO trade
	db trade_command
	db \1 ; trade_id
ENDM

	const askforphonenumber_command ; $97
MACRO askforphonenumber
	db askforphonenumber_command
	db \1 ; number
ENDM

	const phonecall_command ; $98
MACRO phonecall
	db phonecall_command
	dw \1 ; caller_name
ENDM

	const hangup_command ; $99
MACRO hangup
	db hangup_command
ENDM

	const describedecoration_command ; $9a
MACRO describedecoration
	db describedecoration_command
	db \1 ; byte
ENDM

	const fruittree_command ; $9b
MACRO fruittree
	db fruittree_command
	db \1 ; tree_id
ENDM

	const specialphonecall_command ; $9c
MACRO specialphonecall
	db specialphonecall_command
	dw \1 ; call_id
ENDM

	const checkphonecall_command ; $9d
MACRO checkphonecall
	db checkphonecall_command
ENDM

	const verbosegiveitem_command ; $9e
MACRO verbosegiveitem
	if _NARG == 1
		verbosegiveitem \1, 1
	else
		db verbosegiveitem_command
		db \1 ; item
		db \2 ; quantity
	endc
ENDM

	const verbosegiveitemvar_command ; $9f
MACRO verbosegiveitemvar
	db verbosegiveitemvar_command
	db \1 ; item
	db \2 ; var
ENDM

	const swarm_command ; $a0
MACRO swarm
	db swarm_command
	db \1 ; flag
	map_id \2 ; map
ENDM

	const halloffame_command ; $a1
MACRO halloffame
	db halloffame_command
ENDM

	const credits_command ; $a2
MACRO credits
	db credits_command
ENDM

	const warpfacing_command ; $a3
MACRO warpfacing
	db warpfacing_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
ENDM

	const battletowertext_command ; $a4
MACRO battletowertext
	db battletowertext_command
	db \1 ; bttext_id
ENDM

	const getlandmarkname_command ; $a5
MACRO getlandmarkname
	db getlandmarkname_command
	db \2 ; landmark_id
	db \1 ; string_buffer
ENDM

	const gettrainerclassname_command ; $a6
MACRO gettrainerclassname
	db gettrainerclassname_command
	db \2 ; trainer_group
	db \1 ; string_buffer
ENDM

	const getname_command ; $a7
MACRO getname
	db getname_command
	db \2 ; type
	db \3 ; id
	db \1 ; memory
ENDM

	const wait_command ; $a8
MACRO wait
	db wait_command
	db \1 ; duration
ENDM

	const checksave_command ; $a9
MACRO checksave
	db checksave_command
ENDM

DEF NUM_EVENT_COMMANDS EQU const_value
