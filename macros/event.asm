	enum_start

	command scall
	command_macro
	dw \1 ; pointer
	endm

	command farscall
	command_macro
	db BANK(\1)
	dw \1
	endm

	command ptcall
	command_macro
	dw \1 ; pointer
	endm

	command jump
	command_macro
	dw \1 ; pointer
	endm

	command farjump
	command_macro
	db BANK(\1)
	dw \1
	endm

	command ptjump
	command_macro
	dw \1 ; pointer
	endm

	command if_equal
	command_macro
	db \1 ; byte
	dw \2 ; pointer
	endm

	command if_not_equal
	command_macro
	db \1 ; byte
	dw \2 ; pointer
	endm

	command iffalse
	command_macro
	dw \1 ; pointer
	endm

	command iftrue
	command_macro
	dw \1 ; pointer
	endm

	command if_greater_than
	command_macro
	db \1 ; byte
	dw \2 ; pointer
	endm

	command if_less_than
	command_macro
	db \1 ; byte
	dw \2 ; pointer
	endm

	command jumpstd
	command_macro
	dw \1 ; predefined_script
	endm

	command callstd
	command_macro
	dw \1 ; predefined_script
	endm

	command callasm
	command_macro
	db BANK(\1)
	dw \1
	endm


	command special
	command_macro
	dw (\1Special - SpecialsPointers) / 3
	endm

add_special: MACRO
\1Special::
	db BANK(\1)
	dw \1
ENDM


	command ptcallasm
	command_macro
	dw \1 ; asm
	endm

	command checkmaptriggers
	command_macro
	map \1 ; map
	endm

	command domaptrigger
	command_macro
	map \1 ; map
	db \2 ; trigger_id
	endm

	command checktriggers
	command_macro
	endm

	command dotrigger
	command_macro
	db \1 ; trigger_id
	endm

	command writebyte
	command_macro
	db \1 ; value
	endm

	command addvar
	command_macro
	db \1 ; value
	endm

	command random
	command_macro
	db \1 ; input
	endm

	command checkver
	command_macro
	endm

	command copybytetovar
	command_macro
	dw \1 ; address
	endm

	command copyvartobyte
	command_macro
	dw \1 ; address
	endm

	command loadvar
	command_macro
	dw \1 ; address
	db \2 ; value
	endm

	command checkcode
	command_macro
	db \1 ; variable_id
	endm

	command writevarcode
	command_macro
	db \1 ; variable_id
	endm

	command writecode
	command_macro
	db \1 ; variable_id
	db \2 ; value
	endm

	command giveitem
	command_macro
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	command takeitem
	command_macro
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	command checkitem
	command_macro
	db \1 ; item
	endm

	command givemoney
	command_macro
	db \1 ; account
	dt \2 ; money
	endm

	command takemoney
	command_macro
	db \1 ; account
	dt \2 ; money
	endm

	command checkmoney
	command_macro
	db \1 ; account
	dt \2 ; money
	endm

	command givecoins
	command_macro
	dw \1 ; coins
	endm

	command takecoins
	command_macro
	dw \1 ; coins
	endm

	command checkcoins
	command_macro
	dw \1 ; coins
	endm

	command addcellnum
	command_macro
	db \1 ; person
	endm

	command delcellnum
	command_macro
	db \1 ; person
	endm

	command checkcellnum
	command_macro
	db \1 ; person
	endm

	command checktime
	command_macro
	db \1 ; time
	endm

checkmorn EQUS "checktime 1 << MORN"
checkday  EQUS "checktime 1 << DAY"
checknite EQUS "checktime 1 << NITE"

	command checkpoke
	command_macro
	db \1 ; pkmn
	endm

	command givepoke
	command_macro
	db \1 ; pokemon
	db \2 ; level
	if _NARG >= 3
	db \3 ; item
	if _NARG >= 4
	db \4 ; trainer
	if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
	endc
	else
	db 0
	endc
	else
	db 0, 0
	endc
	endm

	command giveegg
	command_macro
	db \1 ; pkmn
	db \2 ; level
	endm

	command givepokeitem
	command_macro
	dw \1 ; pointer
	endm

	command checkpokeitem
	command_macro
	dw \1 ; pointer
	endm

	command checkevent
	command_macro
	dw \1 ; event_flag
	endm

	command clearevent
	command_macro
	dw \1 ; event_flag
	endm

	command setevent
	command_macro
	dw \1 ; event_flag
	endm

	command checkflag
	command_macro
	dw \1 ; engine_flag
	endm

	command clearflag
	command_macro
	dw \1 ; engine_flag
	endm

	command setflag
	command_macro
	dw \1 ; engine_flag
	endm

	command wildon
	command_macro
	endm

	command wildoff
	command_macro
	endm

	command xycompare
	command_macro
	dw \1 ; pointer
	endm

	command warpmod
	command_macro
	db \1 ; warp_id
	map \2 ; map
	endm

	command blackoutmod
	command_macro
	map \1 ; map
	endm

	command warp
	command_macro
	map \1 ; map
	db \2 ; x
	db \3 ; y
	endm

	command readmoney
	command_macro
	db \1 ; account
	db \2 ; memory
	endm

	command readcoins
	command_macro
	db \1 ; memory
	endm

	command RAM2MEM
	command_macro
	db \1 ; memory
	endm

	command pokenamemem
	command_macro
	db \1 ; pokemon
	db \2 ; memory
	endm

	command itemtotext
	command_macro
	db \1 ; item
	db \2 ; memory
	endm

	command mapnametotext
	command_macro
	db \1 ; memory
	endm

	command trainertotext
	command_macro
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	endm

	command stringtotext
	command_macro
	dw \1 ; text_pointer
	db \2 ; memory
	endm

	command itemnotify
	command_macro
	endm

	command pocketisfull
	command_macro
	endm

	command loadfont
	command_macro
	endm

	command refreshscreen
	command_macro
	db \1 ; dummy
	endm

	command loadmovesprites
	command_macro
	endm

	command loadbytec2cf
	command_macro
	db \1 ; byte
	endm

	command farwritetext
	command_macro
	db BANK(\1)
	dw \1
	endm

	command writetext
	command_macro
	dw \1 ; text_pointer
	endm

	command repeattext
	command_macro
	db \1 ; byte
	db \2 ; byte
	endm

	command yesorno
	command_macro
	endm

	command loadmenudata
	command_macro
	dw \1 ; data
	endm

	command writebackup
	command_macro
	endm

	command jumptextfaceplayer
	command_macro
	dw \1 ; text_pointer
	endm

; IF _CRYSTAL
	command farjumptext
	command_macro
	db BANK(\1)
	dw \1
	endm
; ENDC

	command jumptext
	command_macro
	dw \1 ; text_pointer
	endm

	command closetext
	command_macro
	endm

	command keeptextopen
	command_macro
	endm

	command pokepic
	command_macro
	db \1 ; pokemon
	endm

	command pokepicyesorno
	command_macro
	endm

	command interpretmenu
	command_macro
	endm

	command interpretmenu2
	command_macro
	endm

	command loadpikachudata
	command_macro
	endm

	command battlecheck
	command_macro
	endm

	command loadtrainerdata
	command_macro
	endm

	command loadpokedata
	command_macro
	db \1 ; pokemon
	db \2 ; level
	endm

	command loadtrainer
	command_macro
	db \1 ; trainer_group
	db \2 ; trainer_id
	endm

	command startbattle
	command_macro
	endm

	command returnafterbattle
	command_macro
	endm

	command catchtutorial
	command_macro
	db \1 ; byte
	endm

	command trainertext
	command_macro
	db \1 ; which_text
	endm

	command trainerstatus
	command_macro
	db \1 ; action
	endm

	command winlosstext
	command_macro
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	endm

	command scripttalkafter
	command_macro
	endm

	command talkaftercancel
	command_macro
	endm

	command talkaftercheck
	command_macro
	endm

	command setlasttalked
	command_macro
	db \1 ; person
	endm

	command applymovement
	command_macro
	db \1 ; person
	dw \2 ; data
	endm

	command applymovement2
	command_macro
	dw \1 ; data
	endm

	command faceplayer
	command_macro
	endm

	command faceperson
	command_macro
	db \1 ; person1
	db \2 ; person2
	endm

	command variablesprite
	command_macro
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
	endm

	command disappear
	command_macro
	db \1 ; person
	endm

	command appear
	command_macro
	db \1 ; person
	endm

	command follow
	command_macro
	db \1 ; person2
	db \2 ; person1
	endm

	command stopfollow
	command_macro
	endm

	command moveperson
	command_macro
	db \1 ; person
	db \2 ; x
	db \3 ; y
	endm

	command writepersonxy
	command_macro
	db \1 ; person
	endm

	command loademote
	command_macro
	db \1 ; bubble
	endm

	command showemote
	command_macro
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
	endm

	command spriteface
	command_macro
	db \1 ; person
	db \2 ; facing
	endm

	command follownotexact
	command_macro
	db \1 ; person2
	db \2 ; person1
	endm

	command earthquake
	command_macro
	db \1 ; param
	endm

	command changemap
	command_macro
	db \1 ; map_bank
	dw \2 ; map_data_pointer
	endm

	command changeblock
	command_macro
	db \1 ; x
	db \2 ; y
	db \3 ; block
	endm

	command reloadmap
	command_macro
	endm

	command reloadmappart
	command_macro
	endm

	command writecmdqueue
	command_macro
	dw \1 ; queue_pointer
	endm

	command delcmdqueue
	command_macro
	db \1 ; byte
	endm

	command playmusic
	command_macro
	dw \1 ; music_pointer
	endm

	command playrammusic
	command_macro
	endm

	command musicfadeout
	command_macro
	dw \1 ; music
	db \2 ; fadetime
	endm

	command playmapmusic
	command_macro
	endm

	command reloadmapmusic
	command_macro
	endm

	command cry
	command_macro
	dw \1 ; cry_id
	endm

	command playsound
	command_macro
	dw \1 ; sound_pointer
	endm

	command waitbutton
	command_macro
	endm

	command warpsound
	command_macro
	endm

	command specialsound
	command_macro
	endm

	command passtoengine
	command_macro
	db \1 ; data_pointer
	endm

	command newloadmap
	command_macro
	db \1 ; which_method
	endm

	command pause
	command_macro
	db \1 ; length
	endm

	command deactivatefacing
	command_macro
	db \1 ; time
	endm

	command priorityjump
	command_macro
	dw \1 ; pointer
	endm

	command warpcheck
	command_macro
	endm

	command ptpriorityjump
	command_macro
	dw \1 ; pointer
	endm

	command return
	command_macro
	endm

	command end
	command_macro
	endm

	command reloadandreturn
	command_macro
	db \1 ; which_method
	endm

	command resetfuncs
	command_macro
	endm

	command pokemart
	command_macro
	db \1 ; dialog_id
	dw \2 ; mart_id
	endm

	command elevator
	command_macro
	dw \1 ; floor_list_pointer
	endm

	command trade
	command_macro
	db \1 ; trade_id
	endm

	command askforphonenumber
	command_macro
	db \1 ; number
	endm

	command phonecall
	command_macro
	dw \1 ; caller_name
	endm

	command hangup
	command_macro
	endm

	command describedecoration
	command_macro
	db \1 ; byte
	endm

	command fruittree
	command_macro
	db \1 ; tree_id
	endm

	command specialphonecall
	command_macro
	dw \1 ; call_id
	endm

	command checkphonecall
	command_macro
	endm

	command verbosegiveitem
	command_macro
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	command verbosegiveitem2
	command_macro
	db \1 ; item
	db \2 ; var
	endm

	command loadwilddata
	command_macro
	db \1 ; flag
	map \2 ; map
	endm

	command halloffame
	command_macro
	endm

	command credits
	command_macro
	endm

	command warpfacing
	command_macro
	db \1 ; facing
	map \2 ; map
	db \3 ; x
	db \4 ; y
	endm

	command battletowertext
	command_macro
	db \1 ; memory
	endm

	command displaylocation
	command_macro
	db \1 ; id
	db \2 ; memory
	endm

	command trainerclassname
	command_macro
	db \1 ; id
	db \2 ; memory
	endm

	command name
	command_macro
	db \1 ; type
	db \2 ; id
	db \3 ; memory
	endm

	command wait
	command_macro
	db \1 ; duration
	endm

	command check_save
	command_macro
	endm
