scall: macro
	db $00
	dw \1 ; pointer
	endm

farscall: macro
	db $01
	db BANK(\1)
	dw \1
	endm

ptcall: macro
	db $02
	dw \1 ; pointer
	endm

jump: macro
	db $03
	dw \1 ; pointer
	endm

farjump: macro
	db $04
	db BANK(\1)
	dw \1
	endm

ptjump: macro
	db $05
	dw \1 ; pointer
	endm

if_equal: macro
	db $06
	db \1 ; byte
	dw \2 ; pointer
	endm

if_not_equal: macro
	db $07
	db \1 ; byte
	dw \2 ; pointer
	endm

iffalse: macro
	db $08
	dw \1 ; pointer
	endm

iftrue: macro
	db $09
	dw \1 ; pointer
	endm

if_greater_than: macro
	db $0a
	db \1 ; byte
	dw \2 ; pointer
	endm

if_less_than: macro
	db $0b
	db \1 ; byte
	dw \2 ; pointer
	endm

jumpstd: macro
	db $0c
	dw \1 ; predefined_script
	endm

callstd: macro
	db $0d
	dw \1 ; predefined_script
	endm

callasm: macro
	db $0e
	db BANK(\1)
	dw \1
	endm


special: macro
	db $0f
	dw (\1Special - SpecialsPointers) / 3
	endm

add_special: MACRO
\1Special::
	db BANK(\1)
	dw \1
ENDM


ptcallasm: macro
	db $10
	dw \1 ; asm
	endm

checkmaptriggers: macro
	db $11
	db \1 ; map_group
	db \2 ; map_id
	endm

domaptrigger: macro
	db $12
	db \1 ; map_group
	db \2 ; map_id
	db \3 ; trigger_id
	endm

checktriggers: macro
	db $13
	endm

dotrigger: macro
	db $14
	db \1 ; trigger_id
	endm

writebyte: macro
	db $15
	db \1 ; value
	endm

addvar: macro
	db $16
	db \1 ; value
	endm

random: macro
	db $17
	db \1 ; input
	endm

checkver: macro
	db $18
	endm

copybytetovar: macro
	db $19
	dw \1 ; address
	endm

copyvartobyte: macro
	db $1a
	dw \1 ; address
	endm

loadvar: macro
	db $1b
	dw \1 ; address
	db \2 ; value
	endm

checkcode: macro
	db $1c
	db \1 ; variable_id
	endm

writevarcode: macro
	db $1d
	db \1 ; variable_id
	endm

writecode: macro
	db $1e
	db \1 ; variable_id
	db \2 ; value
	endm

giveitem: macro
	db $1f
	db \1 ; item
	db \2 ; quantity
	endm

takeitem: macro
	db $20
	db \1 ; item
	db \2 ; quantity
	endm

checkitem: macro
	db $21
	db \1 ; item
	endm

givemoney: macro
	db $22
	db \1 ; account
	dt \2 ; money
	endm

takemoney: macro
	db $23
	db \1 ; account
	dt \2 ; money
	endm

checkmoney: macro
	db $24
	db \1 ; account
	dt \2 ; money
	endm

givecoins: macro
	db $25
	dw \1 ; coins
	endm

takecoins: macro
	db $26
	dw \1 ; coins
	endm

checkcoins: macro
	db $27
	dw \1 ; coins
	endm

addcellnum: macro
	db $28
	db \1 ; person
	endm

delcellnum: macro
	db $29
	db \1 ; person
	endm

checkcellnum: macro
	db $2a
	db \1 ; person
	endm

checktime: macro
	db $2b
	db \1 ; time
	endm

checkpoke: macro
	db $2c
	db \1 ; pkmn
	endm

givepoke: macro
	db $2d
	db \1 ; pokemon
	db \2 ; level
	db \3 ; item
	db \4 ; trainer
	if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
	endc
	endm

giveegg: macro
	db $2e
	db \1 ; pkmn
	db \2 ; level
	endm

givepokeitem: macro
	db $2f
	dw \1 ; pointer
	endm

checkpokeitem: macro
	db $30
	dw \1 ; pointer
	endm

checkevent: macro
	db $31
	dw \1 ; event_flag
	endm

clearevent: macro
	db $32
	dw \1 ; event_flag
	endm

setevent: macro
	db $33
	dw \1 ; event_flag
	endm

checkflag: macro
	db $34
	dw \1 ; engine_flag
	endm

clearflag: macro
	db $35
	dw \1 ; engine_flag
	endm

setflag: macro
	db $36
	dw \1 ; engine_flag
	endm

wildon: macro
	db $37
	endm

wildoff: macro
	db $38
	endm

xycompare: macro
	db $39
	dw \1 ; pointer
	endm

warpmod: macro
	db $3a
	db \1 ; warp_id
	db \2 ; map_group
	db \3 ; map_id
	endm

blackoutmod: macro
	db $3b
	db \1 ; map_group
	db \2 ; map_id
	endm

warp: macro
	db $3c
	db \1 ; map_group
	db \2 ; map_id
	db \3 ; x
	db \4 ; y
	endm

readmoney: macro
	db $3d
	db \1 ; account
	db \2 ; memory
	endm

readcoins: macro
	db $3e
	db \1 ; memory
	endm

RAM2MEM: macro
	db $3f
	db \1 ; memory
	endm

pokenamemem: macro
	db $40
	db \1 ; pokemon
	db \2 ; memory
	endm

itemtotext: macro
	db $41
	db \1 ; item
	db \2 ; memory
	endm

mapnametotext: macro
	db $42
	db \1 ; memory
	endm

trainertotext: macro
	db $43
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	endm

stringtotext: macro
	db $44
	dw \1 ; text_pointer
	db \2 ; memory
	endm

itemnotify: macro
	db $45
	endm

pocketisfull: macro
	db $46
	endm

loadfont: macro
	db $47
	endm

refreshscreen: macro
	db $48
	db \1 ; dummy
	endm

loadmovesprites: macro
	db $49
	endm

loadbytec1ce: macro
	db $4a
	db \1 ; byte
	endm

farwritetext: macro
	db $4b
	db BANK(\1)
	dw \1
	endm

writetext: macro
	db $4c
	dw \1 ; text_pointer
	endm

repeattext: macro
	db $4d
	db \1 ; byte
	db \2 ; byte
	endm

yesorno: macro
	db $4e
	endm

loadmenudata: macro
	db $4f
	dw \1 ; data
	endm

writebackup: macro
	db $50
	endm

jumptextfaceplayer: macro
	db $51
	dw \1 ; text_pointer
	endm

farjumptext: macro
	db $52
	db BANK(\1)
	dw \1
	endm

jumptext: macro
	db $53
	dw \1 ; text_pointer
	endm

closetext: macro
	db $54
	endm

keeptextopen: macro
	db $55
	endm

pokepic: macro
	db $56
	db \1 ; pokemon
	endm

pokepicyesorno: macro
	db $57
	endm

interpretmenu: macro
	db $58
	endm

interpretmenu2: macro
	db $59
	endm

loadpikachudata: macro
	db $5a
	endm

battlecheck: macro
	db $5b
	endm

loadtrainerdata: macro
	db $5c
	endm

loadpokedata: macro
	db $5d
	db \1 ; pokemon
	db \2 ; level
	endm

loadtrainer: macro
	db $5e
	db \1 ; trainer_group
	db \2 ; trainer_id
	endm

startbattle: macro
	db $5f
	endm

returnafterbattle: macro
	db $60
	endm

catchtutorial: macro
	db $61
	db \1 ; byte
	endm

trainertext: macro
	db $62
	db \1 ; which_text
	endm

trainerstatus: macro
	db $63
	db \1 ; action
	endm

winlosstext: macro
	db $64
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	endm

scripttalkafter: macro
	db $65
	endm

talkaftercancel: macro
	db $66
	endm

talkaftercheck: macro
	db $67
	endm

setlasttalked: macro
	db $68
	db \1 ; person
	endm

applymovement: macro
	db $69
	db \1 ; person
	dw \2 ; data
	endm

applymovement2: macro
	db $6a
	dw \1 ; data
	endm

faceplayer: macro
	db $6b
	endm

faceperson: macro
	db $6c
	db \1 ; person1
	db \2 ; person2
	endm

variablesprite: macro
	db $6d
	db \1 ; byte
	db \2 ; sprite
	endm

disappear: macro
	db $6e
	db \1 ; person
	endm

appear: macro
	db $6f
	db \1 ; person
	endm

follow: macro
	db $70
	db \1 ; person2
	db \2 ; person1
	endm

stopfollow: macro
	db $71
	endm

moveperson: macro
	db $72
	db \1 ; person
	db \2 ; x
	db \3 ; y
	endm

writepersonxy: macro
	db $73
	db \1 ; person
	endm

loademote: macro
	db $74
	db \1 ; bubble
	endm

showemote: macro
	db $75
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
	endm

spriteface: macro
	db $76
	db \1 ; person
	db \2 ; facing
	endm

follownotexact: macro
	db $77
	db \1 ; person2
	db \2 ; person1
	endm

earthquake: macro
	db $78
	db \1 ; param
	endm

changemap: macro
	db $79
	dw \1 ; map_data_pointer
	endm

changeblock: macro
	db $7a
	db \1 ; x
	db \2 ; y
	db \3 ; block
	endm

reloadmap: macro
	db $7b
	endm

reloadmappart: macro
	db $7c
	endm

writecmdqueue: macro
	db $7d
	dw \1 ; queue_pointer
	endm

delcmdqueue: macro
	db $7e
	db \1 ; byte
	endm

playmusic: macro
	db $7f
	dw \1 ; music_pointer
	endm

playrammusic: macro
	db $80
	endm

musicfadeout: macro
	db $81
	dw \1 ; music
	db \2 ; fadetime
	endm

playmapmusic: macro
	db $82
	endm

reloadmapmusic: macro
	db $83
	endm

cry: macro
	db $84
	dw \1 ; cry_id
	endm

playsound: macro
	db $85
	dw \1 ; sound_pointer
	endm

waitbutton: macro
	db $86
	endm

warpsound: macro
	db $87
	endm

specialsound: macro
	db $88
	endm

passtoengine: macro
	db $89
	db \1 ; data_pointer
	endm

newloadmap: macro
	db $8a
	db \1 ; which_method
	endm

pause: macro
	db $8b
	db \1 ; length
	endm

deactivatefacing: macro
	db $8c
	db \1 ; time
	endm

priorityjump: macro
	db $8d
	dw \1 ; pointer
	endm

warpcheck: macro
	db $8e
	endm

ptpriorityjump: macro
	db $8f
	dw \1 ; pointer
	endm

return: macro
	db $90
	endm

end: macro
	db $91
	endm

reloadandreturn: macro
	db $92
	db \1 ; which_method
	endm

resetfuncs: macro
	db $93
	endm

pokemart: macro
	db $94
	db \1 ; dialog_id
	dw \2 ; mart_id
	endm

elevator: macro
	db $95
	dw \1 ; floor_list_pointer
	endm

trade: macro
	db $96
	db \1 ; trade_id
	endm

askforphonenumber: macro
	db $97
	db \1 ; number
	endm

phonecall: macro
	db $98
	dw \1 ; caller_name
	endm

hangup: macro
	db $99
	endm

describedecoration: macro
	db $9a
	db \1 ; byte
	endm

fruittree: macro
	db $9b
	db \1 ; tree_id
	endm

specialphonecall: macro
	db $9c
	dw \1 ; call_id
	endm

checkphonecall: macro
	db $9d
	endm

verbosegiveitem: macro
	db $9e
	db \1 ; item
	db \2 ; quantity
	endm

verbosegiveitem2: macro
	db $9f
	db \1 ; item
	db \2 ; var
	endm

loadwilddata: macro
	db $a0
	db \1 ; flag
	db \2 ; map_group
	db \3 ; map_id
	endm

halloffame: macro
	db $a1
	endm

credits: macro
	db $a2
	endm

warpfacing: macro
	db $a3
	db \1 ; facing
	db \2 ; map_group
	db \3 ; map_id
	db \4 ; x
	db \5 ; y
	endm

storetext: macro
	db $a4
	db \1 ; memory
	endm

displaylocation: macro
	db $a5
	db \1 ; id
	db \2 ; memory
	endm

trainerclassname: macro
	db $a6
	db \1 ; id
	db \2 ; memory
	endm

name: macro
	db $a7
	db \1 ; type
	db \2 ; id
	db \3 ; mempry
	endm

wait: macro
	db $a8
	db \1 ; duration
	endm

unknown0xa9: macro
	db $a9
	endm
