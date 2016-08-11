; Event scripting commands.


EnableScriptMode:: ; 96c56
	push af
	ld a, SCRIPT_READ
	ld [ScriptMode], a
	pop af
	ret
; 96c5e

ScriptEvents:: ; 96c5e
	call StartScript
.loop
	ld a, [ScriptMode]
	ld hl, .modes
	rst JumpTable
	call CheckScript
	jr nz, .loop
	ret
; 96c6e

.modes ; 96c6e
	dw EndScript
	dw RunScriptCommand
	dw WaitScriptMovement
	dw WaitScript

EndScript: ; 96c76
	call StopScript
	ret
; 96c7a

WaitScript: ; 96c7a
	call StopScript

	ld hl, ScriptDelay
	dec [hl]
	ret nz

	callba Function58b9

	ld a, SCRIPT_READ
	ld [ScriptMode], a
	call StartScript
	ret
; 96c91

WaitScriptMovement: ; 96c91
	call StopScript

	ld hl, VramState
	bit 7, [hl]
	ret nz

	callba Function58b9

	ld a, SCRIPT_READ
	ld [ScriptMode], a
	call StartScript
	ret
; 96ca9

RunScriptCommand: ; 96ca9
	call GetScriptByte
	ld hl, ScriptCommandTable
	rst JumpTable
	ret
; 96cb1


ScriptCommandTable: ; 96cb1
	dw Script_scall                      ; 00
	dw Script_farscall                   ; 01
	dw Script_ptcall                     ; 02
	dw Script_jump                       ; 03
	dw Script_farjump                    ; 04
	dw Script_ptjump                     ; 05
	dw Script_if_equal                   ; 06
	dw Script_if_not_equal               ; 07
	dw Script_iffalse                    ; 08
	dw Script_iftrue                     ; 09
	dw Script_if_greater_than            ; 0a
	dw Script_if_less_than               ; 0b
	dw Script_jumpstd                    ; 0c
	dw Script_callstd                    ; 0d
	dw Script_callasm                    ; 0e
	dw Script_special                    ; 0f
	dw Script_ptcallasm                  ; 10
	dw Script_checkmaptriggers           ; 11
	dw Script_domaptrigger               ; 12
	dw Script_checktriggers              ; 13
	dw Script_dotrigger                  ; 14
	dw Script_writebyte                  ; 15
	dw Script_addvar                     ; 16
	dw Script_random                     ; 17
	dw Script_checkver                   ; 18
	dw Script_copybytetovar              ; 19
	dw Script_copyvartobyte              ; 1a
	dw Script_loadvar                    ; 1b
	dw Script_checkcode                  ; 1c
	dw Script_writevarcode               ; 1d
	dw Script_writecode                  ; 1e
	dw Script_giveitem                   ; 1f
	dw Script_takeitem                   ; 20
	dw Script_checkitem                  ; 21
	dw Script_givemoney                  ; 22
	dw Script_takemoney                  ; 23
	dw Script_checkmoney                 ; 24
	dw Script_givecoins                  ; 25
	dw Script_takecoins                  ; 26
	dw Script_checkcoins                 ; 27
	dw Script_addcellnum                 ; 28
	dw Script_delcellnum                 ; 29
	dw Script_checkcellnum               ; 2a
	dw Script_checktime                  ; 2b
	dw Script_checkpoke                  ; 2c
	dw Script_givepoke                   ; 2d
	dw Script_giveegg                    ; 2e
	dw Script_givepokeitem               ; 2f
	dw Script_checkpokeitem              ; 30
	dw Script_checkevent                 ; 31
	dw Script_clearevent                 ; 32
	dw Script_setevent                   ; 33
	dw Script_checkflag                  ; 34
	dw Script_clearflag                  ; 35
	dw Script_setflag                    ; 36
	dw Script_wildon                     ; 37
	dw Script_wildoff                    ; 38
	dw Script_xycompare                  ; 39
	dw Script_warpmod                    ; 3a
	dw Script_blackoutmod                ; 3b
	dw Script_warp                       ; 3c
	dw Script_readmoney                  ; 3d
	dw Script_readcoins                  ; 3e
	dw Script_RAM2MEM                    ; 3f
	dw Script_pokenamemem                ; 40
	dw Script_itemtotext                 ; 41
	dw Script_mapnametotext              ; 42
	dw Script_trainertotext              ; 43
	dw Script_stringtotext               ; 44
	dw Script_itemnotify                 ; 45
	dw Script_pocketisfull               ; 46
	dw Script_textbox                    ; 47
	dw Script_refreshscreen              ; 48
	dw Script_closetext                  ; 49
	dw Script_loadbytec2cf               ; 4a
	dw Script_farwritetext               ; 4b
	dw Script_writetext                  ; 4c
	dw Script_repeattext                 ; 4d
	dw Script_yesorno                    ; 4e
	dw Script_loadmenudata               ; 4f
	dw Script_closewindow                ; 50
	dw Script_jumptextfaceplayer         ; 51
IF _CRYSTAL
	dw Script_farjumptext                ; 52
ENDC
	dw Script_jumptext                   ; 53
	dw Script_waitbutton                 ; 54
	dw Script_buttonsound                ; 55
	dw Script_pokepic                    ; 56
	dw Script_closepokepic               ; 57
	dw Script__2dmenu                    ; 58
	dw Script_verticalmenu               ; 59
	dw Script_loadpikachudata            ; 5a
	dw Script_randomwildmon              ; 5b
	dw Script_loadmemtrainer             ; 5c
	dw Script_loadwildmon                ; 5d
	dw Script_loadtrainer                ; 5e
	dw Script_startbattle                ; 5f
	dw Script_reloadmapafterbattle       ; 60
	dw Script_catchtutorial              ; 61
	dw Script_trainertext                ; 62
	dw Script_trainerflagaction          ; 63
	dw Script_winlosstext                ; 64
	dw Script_scripttalkafter            ; 65
	dw Script_end_if_just_battled        ; 66
	dw Script_check_just_battled         ; 67
	dw Script_setlasttalked              ; 68
	dw Script_applymovement              ; 69
	dw Script_applymovement2             ; 6a
	dw Script_faceplayer                 ; 6b
	dw Script_faceperson                 ; 6c
	dw Script_variablesprite             ; 6d
	dw Script_disappear                  ; 6e
	dw Script_appear                     ; 6f
	dw Script_follow                     ; 70
	dw Script_stopfollow                 ; 71
	dw Script_moveperson                 ; 72
	dw Script_writepersonxy              ; 73
	dw Script_loademote                  ; 74
	dw Script_showemote                  ; 75
	dw Script_spriteface                 ; 76
	dw Script_follownotexact             ; 77
	dw Script_earthquake                 ; 78
	dw Script_changemap                  ; 79
	dw Script_changeblock                ; 7a
	dw Script_reloadmap                  ; 7b
	dw Script_reloadmappart              ; 7c
	dw Script_writecmdqueue              ; 7d
	dw Script_delcmdqueue                ; 7e
	dw Script_playmusic                  ; 7f
	dw Script_encountermusic             ; 80
	dw Script_musicfadeout               ; 81
	dw Script_playmapmusic               ; 82
	dw Script_dontrestartmapmusic        ; 83
	dw Script_cry                        ; 84
	dw Script_playsound                  ; 85
	dw Script_waitsfx                    ; 86
	dw Script_warpsound                  ; 87
	dw Script_specialsound               ; 88
	dw Script_passtoengine               ; 89
	dw Script_newloadmap                 ; 8a
	dw Script_pause                      ; 8b
	dw Script_deactivatefacing           ; 8c
	dw Script_priorityjump               ; 8d
	dw Script_warpcheck                  ; 8e
	dw Script_ptpriorityjump             ; 8f
	dw Script_return                     ; 90
	dw Script_end                        ; 91
	dw Script_reloadandreturn            ; 92
	dw Script_end_all                    ; 93
	dw Script_pokemart                   ; 94
	dw Script_elevator                   ; 95
	dw Script_trade                      ; 96
	dw Script_askforphonenumber          ; 97
	dw Script_phonecall                  ; 98
	dw Script_hangup                     ; 99
	dw Script_describedecoration         ; 9a
	dw Script_fruittree                  ; 9b
	dw Script_specialphonecall           ; 9c
	dw Script_checkphonecall             ; 9d
	dw Script_verbosegiveitem            ; 9e
	dw Script_verbosegiveitem2           ; 9f
	dw Script_swarm                      ; a0
	dw Script_halloffame                 ; a1
	dw Script_credits                    ; a2
	dw Script_warpfacing                 ; a3
	dw Script_battletowertext            ; a4
	dw Script_landmarktotext             ; a5
	dw Script_trainerclassname           ; a6
	dw Script_name                       ; a7
	dw Script_wait                       ; a8
	dw Script_check_save                 ; a9
; 96e05

StartScript: ; 96e05
	ld hl, ScriptFlags
	set SCRIPT_RUNNING, [hl]
	ret
; 96e0b

CheckScript: ; 96e0b
	ld hl, ScriptFlags
	bit SCRIPT_RUNNING, [hl]
	ret
; 96e11

StopScript: ; 96e11
	ld hl, ScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret
; 96e17

Script_callasm: ; 96e17
; script command 0xe
; parameters:
;     asm (AsmPointerParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, b
	rst FarCall
	ret
; 96e26

Script_special: ; 96e26
; script command 0xf
; parameters:
;     predefined_script (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	callba Special
	ret
; 96e35

Script_ptcallasm: ; 96e35
; script command 0x10
; parameters:
;     asm (PointerToAsmPointerParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; 96e45

Script_jumptextfaceplayer: ; 96e45
; script command 0x51
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	ld a, [ScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextFacePlayerScript)
	ld hl, JumpTextFacePlayerScript
	jp ScriptJump
; 96e5f

Script_jumptext: ; 96e5f
; script command 0x53
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	ld a, [ScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 96e79

JumpTextFacePlayerScript: ; 96e79
	faceplayer
JumpTextScript: ; 96e7a
	opentext
	repeattext -1, -1
	waitbutton
	closetext
	end
; 96e81


IF _CRYSTAL

Script_farjumptext: ; 96e81
; script command 0x52
; parameters:
;     text_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 96e9b

ENDC


Script_writetext: ; 96e9b
; script command 0x4c
; parameters:
;     text_pointer (RawTextPointerLabelParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	call MapTextbox
	ret
; 96eab

Script_farwritetext: ; 96eab
; script command 0x4b
; parameters:
;     text_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call MapTextbox
	ret
; 96ebb

Script_repeattext: ; 96ebb
; script command 0x4d
; parameters:
;     byte (SingleByteParam)
;     byte (SingleByteParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	cp -1
	jr nz, .done
	ld a, l
	cp -1
	jr nz, .done
	ld hl, wScriptTextBank
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call MapTextbox
	ret

.done
	ret
; 96ed9

Script_waitbutton: ; 96ed9
; script command 0x54

	jp WaitButton
; 96edc

Script_buttonsound: ; 96edc
; script command 0x55

	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	call ButtonSound
	pop af
	ld [hOAMUpdate], a
	ret
; 96eed

Script_yesorno: ; 96eed
; script command 0x4e

	call YesNoBox
	ld a, FALSE
	jr c, .no
	ld a, TRUE
.no
	ld [ScriptVar], a
	ret
; 96efa

Script_loadmenudata: ; 96efa
; script command 0x4f
; parameters:
;     data (MenuDataPointerParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld de, LoadMenuDataHeader
	ld a, [ScriptBank]
	call Call_a_de
	call UpdateSprites
	ret
; 96f0f

Script_closewindow: ; 96f0f
; script command 0x50

	call CloseWindow
	call UpdateSprites
	ret
; 96f16

Script_pokepic: ; 96f16
; script command 0x56
; parameters:
;     pokemon (PokemonParam)

	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [CurPartySpecies], a
	callba Pokepic
	ret
; 96f29

Script_closepokepic: ; 96f29
; script command 0x57

	callba ClosePokepic
	ret
; 96f30

Script_verticalmenu: ; 96f30
; script command 0x59

	ld a, [ScriptBank]
	ld hl, VerticalMenu
	rst FarCall
	ld a, [wMenuCursorY]
	jr nc, .ok
	xor a
.ok
	ld [ScriptVar], a
	ret
; 96f41

Script__2dmenu: ; 96f41
; script command 0x58

	ld a, [ScriptBank]
	ld hl, _2DMenu
	rst FarCall
	ld a, [wMenuCursorBuffer]
	jr nc, .ok
	xor a
.ok
	ld [ScriptVar], a
	ret
; 96f52

Script_battletowertext: ; 96f52
; script command 0xa4
; parameters:
;     pointer (PointerLabelBeforeBank)
;     memory (SingleByteParam)

	call SetUpTextBox
	call GetScriptByte
	ld c, a
	callba BattleTowerText
	ret
; 96f60

Script_verbosegiveitem: ; 96f60
; script command 0x9e
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)

	call Script_giveitem
	call CurItemName
	ld de, StringBuffer1
	ld a, 1
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 96f76


ret_96f76: ; 96f76
	ret
; 96f77

GiveItemScript: ; 96f77
	callasm ret_96f76
	writetext ReceivedItemText
	iffalse .Full
	waitsfx
	specialsound
	waitbutton
	itemnotify
	end

.Full:
	buttonsound
	pocketisfull
	end
; 96f89

ReceivedItemText: ; 96f89
	text_jump UnknownText_0x1c4719
	db "@"
; 96f8e


Script_verbosegiveitem2: ; 96f8e
; script command 0x9f
; parameters:
;     item (ItemLabelByte)
;     var (SingleByteParam)

	call GetScriptByte
	cp -1
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [CurItem], a
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	ld a, TRUE
	jr c, .ok2
	xor a
.ok2
	ld [ScriptVar], a
	call CurItemName
	ld de, StringBuffer1
	ld a, 1
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 96fc6

Script_itemnotify: ; 96fc6
; script command 0x45

	call GetPocketName
	call CurItemName
	ld b, BANK(PutItemInPocketText)
	ld hl, PutItemInPocketText
	call MapTextbox
	ret
; 96fd5

Script_pocketisfull: ; 96fd5
; script command 0x46

	call GetPocketName
	call CurItemName
	ld b, BANK(PocketIsFullText)
	ld hl, PocketIsFullText
	call MapTextbox
	ret
; 96fe4

Script_specialsound: ; 96fe4
; script command 0x88

	callba CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp TM_HM
	ld de, SFX_GET_TM
	jr z, .play
	ld de, SFX_ITEM
.play
	call PlaySFX
	call WaitSFX
	ret
; 96ffe


GetPocketName: ; 96ffe
	callba CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	and 3
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, StringBuffer3
	call CopyName2
	ret

.Pockets:
	dw .Item
	dw .Key
	dw .Ball
	dw .TM

.Item:
	db "ITEM POCKET@"
.Key:
	db "KEY POCKET@"
.Ball:
	db "BALL POCKET@"
.TM:
	db "TM POCKET@"
; 97051

CurItemName: ; 97051
	ld a, [CurItem]
	ld [wd265], a
	call GetItemName
	ret
; 9705b


PutItemInPocketText: ; 9705b
	text_jump UnknownText_0x1c472c
	db "@"
; 97060

PocketIsFullText: ; 97060
	text_jump UnknownText_0x1c474b
	db "@"
; 97065


Script_pokemart: ; 97065
; script command 0x94
; parameters:
;     dialog_id (SingleByteParam)
;     mart_id (MultiByteParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba OpenMartDialog
	ret
; 9707c

Script_elevator: ; 9707c
; script command 0x95
; parameters:
;     floor_list_pointer (PointerLabelParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba Elevator
	ret c
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97099

Script_trade: ; 97099
; script command 0x96
; parameters:
;     trade_id (SingleByteParam)

	call GetScriptByte
	ld e, a
	callba NPCTrade
	ret
; 970a4

Script_phonecall: ; 970a4
; script command 0x98
; parameters:
;     caller_name (RawTextPointerLabelParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba PhoneCall
	ret
; 970b7

Script_hangup: ; 970b7
; script command 0x99

	callba HangUp
	ret
; 970be

Script_askforphonenumber: ; 970be
; script command 0x97
; parameters:
;     number (SingleByteParam)

	call YesNoBox
	jr c, .refused
	call GetScriptByte
	ld c, a
	callba AddPhoneNumber
	jr c, .phonefull
	xor a
	jr .done
.phonefull
	ld a, 1
	jr .done
.refused
	call GetScriptByte
	ld a, 2
.done
	ld [ScriptVar], a
	ret
; 970df

Script_describedecoration: ; 970df
; script command 0x9a
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld b, a
	callba DescribeDecoration
	ld h, d
	ld l, e
	jp ScriptJump
; 970ee

Script_fruittree: ; 970ee
; script command 0x9b
; parameters:
;     tree_id (SingleByteParam)

	call GetScriptByte
	ld [CurFruitTree], a
	ld b, BANK(FruitTreeScript)
	ld hl, FruitTreeScript
	jp ScriptJump
; 970fc

Script_swarm: ; 970fc
; script command 0xa0
; parameters:
;     flag (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld d, a
	call GetScriptByte
	ld e, a
	callba StoreSwarmMapIndices
	ret
; 9710f

Script_trainertext: ; 9710f
; script command 0x62
; parameters:
;     which_text (SingleByteParam)

	call GetScriptByte
	ld c, a
	ld b, 0
	ld hl, WalkingX
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	ld b, a
	call MapTextbox
	ret
; 97125

Script_scripttalkafter: ; 97125
; script command 0x65

	ld hl, wScriptAfterPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	ld b, a
	jp ScriptJump
; 97132

Script_trainerflagaction: ; 97132
; script command 0x63
; parameters:
;     action (SingleByteParam)

	xor a
	ld [ScriptVar], a
	ld hl, wd041
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	ld b, a
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 9714c

Script_winlosstext: ; 9714c
; script command 0x64
; parameters:
;     win_text_pointer (TextPointerLabelParam)
;     loss_text_pointer (TextPointerLabelParam)

	ld hl, wWinTextPointer ; d047
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ld hl, wLossTextPointer ; d049; this is unnecessary
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ret
; 97163

Script_end_if_just_battled: ; 97163
; script command 0x66

	ld a, [wRunningTrainerBattleScript]
	and a
	ret z
	jp Script_end
; 9716b

Script_check_just_battled: ; 9716b
; script command 0x67

	ld a, TRUE
	ld [ScriptVar], a
	ld a, [wRunningTrainerBattleScript]
	and a
	ret nz
	xor a
	ld [ScriptVar], a
	ret
; 9717a

Script_encountermusic: ; 9717a
; script command 0x80

	ld a, [OtherTrainerClass]
	ld e, a
	callba PlayTrainerEncounterMusic
	ret
; 97185

Script_playmapmusic: ; 97185
; script command 0x82

	call PlayMapMusic
	ret
; 97189

Script_playmusic: ; 97189
; script command 0x7f
; parameters:
;     music_pointer (MultiByteParam)

	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [MusicFade], a
	call MaxVolume
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlayMusic
	ret
; 971a2

Script_musicfadeout: ; 971a2
; script command 0x81
; parameters:
;     music (MultiByteParam)
;     fadetime (SingleByteParam)

	call GetScriptByte
	ld [MusicFadeID], a
	call GetScriptByte
	ld [MusicFadeID + 1], a
	call GetScriptByte
	and $7f
	ld [MusicFade], a
	ret
; 971b7

Script_playsound: ; 971b7
; script command 0x85
; parameters:
;     sound_pointer (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlaySFX
	ret
; 971c3

Script_waitsfx: ; 971c3
; script command 0x86

	call WaitSFX
	ret
; 971c7

Script_warpsound: ; 971c7
; script command 0x87

	callba Function14a07
	call PlaySFX
	ret
; 971d1

Script_cry: ; 971d1
; script command 0x84
; parameters:
;     cry_id (MultiByteParam)

	call GetScriptByte
	push af
	call GetScriptByte
	pop af
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	call PlayCry
	ret
; 971e3

GetScriptPerson: ; 971e3
	and a
	ret z
	cp LAST_TALKED
	ret z
	dec a
	ret
; 971ea

Script_setlasttalked: ; 971ea
; script command 0x68
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	ld [hLastTalked], a
	ret
; 971f3

Script_applymovement: ; 971f3
; script command 0x69
; parameters:
;     person (SingleByteParam)
;     data (MovementPointerLabelParam)

	call GetScriptByte
	call GetScriptPerson
	ld c, a
; 971fa

ApplyMovement: ; 971fa
	push bc
	ld a, c
	callba SetFlagsForMovement_1
	pop bc

	push bc
	call SetFlagsForMovement_2
	pop bc

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	call GetMovementData
	ret c

	ld a, SCRIPT_WAIT_MOVEMENT
	ld [ScriptMode], a
	call StopScript
	ret
; 97221

SetFlagsForMovement_2: ; 97221
	callba _SetFlagsForMovement_2
	ret
; 97228

Script_applymovement2: ; 97228
; apply movement to last talked
; script command 0x6a
; parameters:
;     data (MovementPointerLabelParam)

	ld a, [hLastTalked]
	ld c, a
	jp ApplyMovement
; 9722e

Script_faceplayer: ; 9722e
; script command 0x6b

	ld a, [hLastTalked]
	and a
	ret z
	ld d, $0
	ld a, [hLastTalked]
	ld e, a
	callba GetRelativeFacing
	ld a, d
	add a
	add a
	ld e, a
	ld a, [hLastTalked]
	ld d, a
	call ApplyPersonFacing
	ret
; 97248

Script_faceperson: ; 97248
; script command 0x6c
; parameters:
;     person1 (SingleByteParam)
;     person2 (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr c, .ok
	ld a, [hLastTalked]
.ok
	ld e, a
	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr nz, .ok2
	ld a, [hLastTalked]
.ok2
	ld d, a
	push de
	callba GetRelativeFacing
	pop bc
	ret c
	ld a, d
	add a
	add a
	ld e, a
	ld d, c
	call ApplyPersonFacing
	ret
; 97274

Script_spriteface: ; 97274
; script command 0x76
; parameters:
;     person (SingleByteParam)
;     facing (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	ld d, a
	call GetScriptByte
	add a
	add a
	ld e, a
	call ApplyPersonFacing
	ret
; 9728b

ApplyPersonFacing: ; 9728b
	ld a, d
	push de
	call CheckObjectVisibility
	jr c, .not_visible
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	push bc
	call DoesSpriteHaveFacings
	pop bc
	jr c, .not_visible ; STILL_SPRITE
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING, [hl]
	jr nz, .not_visible
	pop de
	ld a, e
	call SetSpriteDirection
	ld hl, VramState
	bit 6, [hl]
	jr nz, .text_state
	call .DisableTextTiles
.text_state
	call UpdateSprites
	ret

.not_visible
	pop de
	scf
	ret
; 972bc

.DisableTextTiles: ; 972bc
	call LoadMapPart
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	res 7, [hl]
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; 972ce

Script_variablesprite: ; 972ce
; script command 0x6d
; parameters:
;     byte (SingleByteParam)
;     sprite (SingleByteParam)

	call GetScriptByte
	ld e, a
	ld d, $0
	ld hl, VariableSprites
	add hl, de
	call GetScriptByte
	ld [hl], a
	ret
; 972dd

Script_appear: ; 972dd
; script command 0x6f
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	call _CopyObjectStruct
	ld a, [hMapObjectIndexBuffer]
	ld b, 0 ; clear
	call ApplyEventActionAppearDisappear
	ret
; 972ee

Script_disappear: ; 972ee
; script command 0x6e
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	call DeleteObjectStruct
	ld a, [hMapObjectIndexBuffer]
	ld b, 1 ; set
	call ApplyEventActionAppearDisappear
	callba _UpdateSprites
	ret
; 9730b

ApplyEventActionAppearDisappear: ; 9730b
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	pop bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, -1
	cp e
	jr nz, .okay
	cp d
	jr nz, .okay
	xor a
	ret
.okay
	call EventFlagAction
	ret
; 97325

Script_follow: ; 97325
; script command 0x70
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	ld b, a
	call GetScriptByte
	call GetScriptPerson
	ld c, a
	callba StartFollow
	ret
; 9733a

Script_stopfollow: ; 9733a
; script command 0x71

	callba StopFollow
	ret
; 97341

Script_moveperson: ; 97341
; script command 0x72
; parameters:
;     person (SingleByteParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	ld b, a
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	callba CopyDECoordsToMapObject
	ret
; 9735b

Script_writepersonxy: ; 9735b
; script command 0x73
; parameters:
;     person (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	ld b, a
	callba WritePersonXY
	ret
; 9736f

Script_follownotexact: ; 9736f
; script command 0x77
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)

	call GetScriptByte
	call GetScriptPerson
	ld b, a
	call GetScriptByte
	call GetScriptPerson
	ld c, a
	callba FollowNotExact
	ret
; 97384

Script_loademote: ; 97384
; script command 0x74
; parameters:
;     bubble (SingleByteParam)

	call GetScriptByte
	cp -1
	jr nz, .not_var_emote
	ld a, [ScriptVar]
.not_var_emote
	ld c, a
	callba LoadEmote
	ret
; 97396

Script_showemote: ; 97396
; script command 0x75
; parameters:
;     bubble (SingleByteParam)
;     person (SingleByteParam)
;     time (DecimalParam)

	call GetScriptByte
	ld [ScriptVar], a
	call GetScriptByte
	call GetScriptPerson
	cp LAST_TALKED
	jr z, .ok
	ld [hLastTalked], a
.ok
	call GetScriptByte
	ld [ScriptDelay], a
	ld b, BANK(ShowEmoteScript)
	ld de, ShowEmoteScript
	jp ScriptCall
; 973b6

ShowEmoteScript: ; 973b6
	loademote EMOTE_MEM
	applymovement2 .Show
	pause 0
	applymovement2 .Hide
	end

.Show:
	show_emote
	step_sleep 1
	step_end

.Hide:
	hide_emote
	step_sleep 1
	step_end
; 973c7


Script_earthquake: ; 973c7
; script command 0x78
; parameters:
;     param (DecimalParam)

	ld hl, EarthquakeMovement
	ld de, wd002
	ld bc, EarthquakeMovementEnd - EarthquakeMovement
	call CopyBytes
	call GetScriptByte
	ld [wd003], a
	and (1 << 6) - 1
	ld [wd005], a
	ld b, BANK(.script)
	ld de, .script
	jp ScriptCall
; 973e6

.script ; 973e6
	applymovement PLAYER, wd002
	end
; 973eb

EarthquakeMovement: ; 973eb
	step_shake 16 ; the 16 gets overwritten with the script byte
	step_sleep 16 ; the 16 gets overwritten with the lower 6 bits of the script byte
	step_end
EarthquakeMovementEnd
; 973f0


Script_loadpikachudata: ; 973f0
; script command 0x5a

	ld a, PIKACHU
	ld [TempWildMonSpecies], a
	ld a, 5
	ld [CurPartyLevel], a
	ret
; 973fb

Script_randomwildmon: ; 973fb
; script command 0x5b

	xor a
	ld [wBattleScriptFlags], a
	ret
; 97400

Script_loadmemtrainer: ; 97400
; script command 0x5c

	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	ld a, [wTempTrainerClass]
	ld [OtherTrainerClass], a
	ld a, [wTempTrainerID]
	ld [OtherTrainerID], a
	ret
; 97412

Script_loadwildmon: ; 97412
; script command 0x5d
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)

	ld a, (1 << 7)
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [TempWildMonSpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	ret
; 97424

Script_loadtrainer: ; 97424
; script command 0x5e
; parameters:
;     trainer_group (TrainerGroupParam)
;     trainer_id (TrainerIdParam)

	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [OtherTrainerClass], a
	call GetScriptByte
	ld [OtherTrainerID], a
	ret
; 97436

Script_startbattle: ; 97436
; script command 0x5f

	call BufferScreen
	predef StartBattle
	ld a, [wBattleResult]
	and $3f
	ld [ScriptVar], a
	ret
; 97447

Script_catchtutorial: ; 97447
; script command 0x61
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld [BattleType], a
	call BufferScreen
	callba CatchTutorial
	jp Script_reloadmap
; 97459

Script_reloadmapafterbattle: ; 97459
; script command 0x60

	ld hl, wBattleScriptFlags
	ld d, [hl]
	ld [hl], $0
	ld a, [wBattleResult]
	and $3f
	cp $1
	jr nz, .notblackedout
	ld b, BANK(Script_BattleWhiteout)
	ld hl, Script_BattleWhiteout
	jp ScriptJump

.notblackedout
	bit 0, d
	jr z, .was_wild
	callba MomTriesToBuySomething
	jr .done

.was_wild
	ld a, [wBattleResult]
	bit 7, a
	jr z, .done
	ld b, BANK(Script_SpecialBillCall)
	ld de, Script_SpecialBillCall
	callba LoadScriptBDE
.done
	jp Script_reloadmap
; 97491

Script_reloadmap: ; 97491
; script command 0x7b

	xor a
	ld [wBattleScriptFlags], a
	ld a, MAPSETUP_RELOADMAP
	ld [hMapEntryMethod], a
	ld a, $1
	call LoadMapStatus
	call StopScript
	ret
; 974a2

Script_scall: ; 974a2
; script command 0x0
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptBank]
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 974b0

Script_farscall: ; 974b0
; script command 0x1
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 974be

Script_ptcall: ; 974be
; script command 0x2
; parameters:
;     pointer (PointerLabelToScriptPointer)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	; fallthrough

ScriptCall: ; 974cb
; Bug: The script stack has a capacity of 5 scripts, yet there is
; nothing to stop you from pushing a sixth script.  The high part
; of the script address can then be overwritten by modifications
; to ScriptDelay, causing the script to return to the rst/interrupt
; space.

	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [ScriptBank]
	ld [hli], a
	ld a, [ScriptPos]
	ld [hli], a
	ld a, [ScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [ScriptBank], a
	ld a, e
	ld [ScriptPos], a
	ld a, d
	ld [ScriptPos + 1], a
	ret
; 974f3

CallCallback:: ; 974f3
	ld a, [ScriptBank]
	or $80
	ld [ScriptBank], a
	jp ScriptCall
; 974fe

Script_jump: ; 974fe
; script command 0x3
; parameters:
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	jp ScriptJump
; 9750d

Script_farjump: ; 9750d
; script command 0x4
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jp ScriptJump
; 9751c

Script_ptjump: ; 9751c
; script command 0x5
; parameters:
;     pointer (PointerLabelToScriptPointer)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp ScriptJump
; 9752c

Script_iffalse: ; 9752c
; script command 0x8
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptVar]
	and a
	jp nz, SkipTwoScriptBytes
	jp Script_jump
; 97536

Script_iftrue: ; 97536
; script command 0x9
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptVar]
	and a
	jp nz, Script_jump
	jp SkipTwoScriptBytes
; 97540

Script_if_equal: ; 97540
; script command 0x6
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld hl, ScriptVar
	cp [hl]
	jr z, Script_jump
	jr SkipTwoScriptBytes
; 9754b

Script_if_not_equal: ; 9754b
; script command 0x7
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld hl, ScriptVar
	cp [hl]
	jr nz, Script_jump
	jr SkipTwoScriptBytes
; 97556

Script_if_greater_than: ; 97556
; script command 0xa
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptVar]
	ld b, a
	call GetScriptByte
	cp b
	jr c, Script_jump
	jr SkipTwoScriptBytes
; 97562

Script_if_less_than: ; 97562
; script command 0xb
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)

	call GetScriptByte
	ld b, a
	ld a, [ScriptVar]
	cp b
	jr c, Script_jump
	jr SkipTwoScriptBytes
; 9756e

Script_jumpstd: ; 9756e
; script command 0xc
; parameters:
;     predefined_script (MultiByteParam)

	call StdScript
	jr ScriptJump
; 97573

Script_callstd: ; 97573
; script command 0xd
; parameters:
;     predefined_script (MultiByteParam)

	call StdScript
	ld d, h
	ld e, l
	jp ScriptCall
; 9757b

StdScript: ; 9757b
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld hl, StdScripts
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(StdScripts)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(StdScripts)
	call GetFarHalfword
	ret
; 97596

SkipTwoScriptBytes: ; 97596
	call GetScriptByte
	call GetScriptByte
	ret
; 9759d

ScriptJump: ; 9759d
	ld a, b
	ld [ScriptBank], a
	ld a, l
	ld [ScriptPos], a
	ld a, h
	ld [ScriptPos + 1], a
	ret
; 975aa

Script_priorityjump: ; 975aa
; script command 0x8d
; parameters:
;     pointer (ScriptPointerLabelParam)

	ld a, [ScriptBank]
	ld [wPriorityScriptBank], a
	call GetScriptByte
	ld [wPriorityScriptAddr], a
	call GetScriptByte
	ld [wPriorityScriptAddr + 1], a
	ld hl, ScriptFlags
	set 3, [hl]
	ret
; 975c2

Script_checktriggers: ; 975c2
; script command 0x13

	call CheckTriggers
	jr z, .no_triggers
	ld [ScriptVar], a
	ret

.no_triggers
	ld a, $ff
	ld [ScriptVar], a
	ret
; 975d1

Script_checkmaptriggers: ; 975d1
; script command 0x11
; parameters:
;     map_group (SingleByteParam)
;     map_id (SingleByteParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .no_triggers
	ld a, [de]
	ld [ScriptVar], a
	ret

.no_triggers
	ld a, $ff
	ld [ScriptVar], a
	ret
; 975eb

Script_dotrigger: ; 975eb
; script command 0x14
; parameters:
;     trigger_id (SingleByteParam)

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	jr DoTrigger
; 975f5

Script_domaptrigger: ; 975f5
; script command 0x12
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     trigger_id (SingleByteParam)

	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
DoTrigger: ; 975fd
	call GetMapTrigger
	ld a, d
	or e
	jr z, .no_trigger
	call GetScriptByte
	ld [de], a
.no_trigger
	ret
; 97609

Script_copybytetovar: ; 97609
; script command 0x19
; parameters:
;     address (RAMAddressParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [hl]
	ld [ScriptVar], a
	ret
; 97616

Script_copyvartobyte: ; 97616
; script command 0x1a
; parameters:
;     address (RAMAddressParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptVar]
	ld [hl], a
	ret
; 97623

Script_loadvar: ; 97623
; script command 0x1b
; parameters:
;     address (RAMAddressParam)
;     value (SingleByteParam)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call GetScriptByte
	ld [hl], a
	ret
; 97630

Script_writebyte: ; 97630
; script command 0x15
; parameters:
;     value (SingleByteParam)

	call GetScriptByte
	ld [ScriptVar], a
	ret
; 97637

Script_addvar: ; 97637
; script command 0x16
; parameters:
;     value (SingleByteParam)

	call GetScriptByte
	ld hl, ScriptVar
	add [hl]
	ld [hl], a
	ret
; 97640

Script_random: ; 97640
; script command 0x17
; parameters:
;     input (SingleByteParam)

	call GetScriptByte
	ld [ScriptVar], a
	and a
	ret z

	ld c, a
	call .Divide256byC
	and a
	jr z, .no_restriction ; 256 % b == 0
	ld b, a
	xor a
	sub b
	ld b, a
.loop
	push bc
	call Random
	pop bc
	ld a, [hRandomAdd]
	cp b
	jr nc, .loop
	jr .finish

.no_restriction
	push bc
	call Random
	pop bc
	ld a, [hRandomAdd]

.finish
	push af
	ld a, [ScriptVar]
	ld c, a
	pop af
	call SimpleDivide
	ld [ScriptVar], a
	ret
; 97673

.Divide256byC: ; 97673
	xor a
	ld b, a
	sub c
.mod_loop
	inc b
	sub c
	jr nc, .mod_loop
	dec b
	add c
	ret
; 9767d

Script_checkcode: ; 9767d
; script command 0x1c
; parameters:
;     variable_id (SingleByteParam)

	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [ScriptVar], a
	ret
; 97688

Script_writevarcode: ; 97688
; script command 0x1d
; parameters:
;     variable_id (SingleByteParam)

	call GetScriptByte
	call GetVarAction
	ld a, [ScriptVar]
	ld [de], a
	ret
; 97693

Script_writecode: ; 97693
; script command 0x1e
; parameters:
;     variable_id (SingleByteParam)
;     value (SingleByteParam)

	call GetScriptByte
	call GetVarAction
	call GetScriptByte
	ld [de], a
	ret
; 9769e

GetVarAction: ; 9769e
	ld c, a
	callba _GetVarAction
	ret
; 976a6

Script_checkver: ; 976a6
; script command 0x18

	ld a, [Version]
	ld [ScriptVar], a
	ret
; 976ad

Version: ; 976ad
	db VERSION
; 976ae

Script_pokenamemem: ; 976ae
; script command 0x40
; parameters:
;     pokemon (PokemonParam); leave $0 to draw from script var
;     memory (SingleByteParam)

	call GetScriptByte
	and a
	jr nz, .gotit
	ld a, [ScriptVar]
.gotit
	ld [wd265], a
	call GetPokemonName
	ld de, StringBuffer1

ConvertMemToText: ; 976c0
	call GetScriptByte
	cp 3
	jr c, .ok
	xor a
.ok

CopyConvertedText: ; 976c8
	ld hl, StringBuffer3
	ld bc, StringBuffer4 - StringBuffer3
	call AddNTimes
	call CopyName2
	ret
; 976d5

Script_itemtotext: ; 976d5
; script command 0x41
; parameters:
;     item (ItemLabelByte); use 0 to draw from ScriptVar
;     memory (SingleByteParam)

	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [wd265], a
	call GetItemName
	ld de, StringBuffer1
	jr ConvertMemToText
; 976e9

Script_mapnametotext: ; 976e9
; script command 0x42
; parameters:
;     memory (SingleByteParam)

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

ConvertLandmarkToText: ; 976f4
	ld e, a
	callba GetLandmarkName
	ld de, StringBuffer1
	jp ConvertMemToText
; 97701

Script_landmarktotext: ; 97701
; script command 0xa5
; parameters:
;     id (SingleByteParam)
;     memory (SingleByteParam)

	call GetScriptByte
	jr ConvertLandmarkToText
; 97706

Script_trainertotext: ; 97706
; script command 0x43
; parameters:
;     trainer_id (TrainerGroupParam)
;     trainer_group (TrainerIdParam)
;     memory (SingleByteParam)

	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld b, a
	callba GetTrainerName
	jr ConvertMemToText
; 97716

Script_name: ; 97716
; script command 0xa7
; parameters:
;     type (SingleByteParam)
;     id (SingleByteParam)
;     memory (SingleByteParam)

	call GetScriptByte
	ld [wNamedObjectTypeBuffer], a

ContinueToGetName: ; 9771c
	call GetScriptByte
	ld [CurSpecies], a
	call GetName
	ld de, StringBuffer1
	jp ConvertMemToText
; 9772b

Script_trainerclassname: ; 9772b
; script command 0xa6
; parameters:
;     id (SingleByteParam)
;     memory (SingleByteParam)

	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	jr ContinueToGetName
; 97732

Script_readmoney: ; 97732
; script command 0x3d
; parameters:
;     account (SingleByteParam)
;     memory (SingleByteParam)

	call ResetStringBuffer1
	call GetMoneyAccount
	ld hl, StringBuffer1
	lb bc, PRINTNUM_RIGHTALIGN | 3, 6
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 97747

Script_readcoins: ; 97747
; script command 0x3e
; parameters:
;     memory (SingleByteParam)

	call ResetStringBuffer1
	ld hl, StringBuffer1
	ld de, Coins
	lb bc, PRINTNUM_RIGHTALIGN | 2, 6
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 9775c

Script_RAM2MEM: ; 9775c
; script command 0x3f
; parameters:
;     memory (SingleByteParam)

	call ResetStringBuffer1
	ld de, ScriptVar
	ld hl, StringBuffer1
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 97771

ResetStringBuffer1: ; 97771
	ld hl, StringBuffer1
	ld bc, NAME_LENGTH
	ld a, "@"
	call ByteFill
	ret
; 9777d

Script_stringtotext: ; 9777d
; script command 0x44
; parameters:
;     text_pointer (EncodedTextLabelParam)
;     memory (SingleByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld hl, CopyName1
	rst FarCall
	ld de, StringBuffer2
	jp ConvertMemToText
; 97792

Script_givepokeitem: ; 97792
; script command 0x2f
; parameters:
;     pointer (PointerParamToItemAndLetter)

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	inc hl
	ld bc, MAIL_MAX_LENGTH
	ld de, wd002
	ld a, [ScriptBank]
	call FarCopyBytes
	pop bc
	callba GivePokeItem
	ret
; 977b7

Script_checkpokeitem: ; 977b7
; script command 0x30
; parameters:
;     pointer (PointerParamToItemAndLetter)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba CheckPokeItem
	ret
; 977ca

Script_giveitem: ; 977ca
; script command 0x1f
; parameters:
;     item (ItemLabelByte)
;     quantity (SingleByteParam)

	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [CurItem], a
	call GetScriptByte
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .full
	ld a, TRUE
	ld [ScriptVar], a
	ret
.full
	xor a
	ld [ScriptVar], a
	ret
; 977f0

Script_takeitem: ; 977f0
; script command 0x20
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld [CurItem], a
	call GetScriptByte
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [CurItemQuantity], a
	ld hl, NumItems
	call TossItem
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97812

Script_checkitem: ; 97812
; script command 0x21
; parameters:
;     item (ItemLabelByte)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97829

Script_givemoney: ; 97829
; script command 0x22
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call GetMoneyAccount
	call LoadMoneyAmountToMem
	callba GiveMoney
	ret
; 97836

Script_takemoney: ; 97836
; script command 0x23
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call GetMoneyAccount
	call LoadMoneyAmountToMem
	callba TakeMoney
	ret
; 97843

Script_checkmoney: ; 97843
; script command 0x24
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)

	call GetMoneyAccount
	call LoadMoneyAmountToMem
	callba CompareMoney
; 9784f

CompareMoneyAction: ; 9784f
	jr c, .two
	jr z, .one
	ld a, 0
	jr .done
.one
	ld a, 1
	jr .done
.two
	ld a, 2
.done
	ld [ScriptVar], a
	ret
; 97861

GetMoneyAccount: ; 97861
	call GetScriptByte
	and a
	ld de, Money
	ret z
	ld de, wMomsMoney
	ret
; 9786d

LoadMoneyAmountToMem: ; 9786d
	ld bc, hMoneyTemp
	push bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	pop bc
	ret
; 97881

Script_givecoins: ; 97881
; script command 0x25
; parameters:
;     coins (CoinByteParam)

	call LoadCoinAmountToMem
	callba GiveCoins
	ret
; 9788b

Script_takecoins: ; 9788b
; script command 0x26
; parameters:
;     coins (CoinByteParam)

	call LoadCoinAmountToMem
	callba TakeCoins
	ret
; 97895

Script_checkcoins: ; 97895
; script command 0x27
; parameters:
;     coins (CoinByteParam)

	call LoadCoinAmountToMem
	callba CheckCoins
	jr CompareMoneyAction
; 978a0

LoadCoinAmountToMem: ; 978a0
	call GetScriptByte
	ld [hMoneyTemp + 1], a
	call GetScriptByte
	ld [hMoneyTemp], a
	ld bc, hMoneyTemp
	ret
; 978ae

Script_checktime: ; 978ae
; script command 0x2b
; parameters:
;     time (SingleByteParam)

	xor a
	ld [ScriptVar], a
	callba CheckTime
	call GetScriptByte
	and c
	ret z
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 978c3

Script_checkpoke: ; 978c3
; script command 0x2c
; parameters:
;     pkmn (PokemonParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld hl, PartySpecies
	ld de, 1
	call IsInArray
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 978da

Script_addcellnum: ; 978da
; script command 0x28
; parameters:
;     person (SingleByteParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld c, a
	callba AddPhoneNumber
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 978ef

Script_delcellnum: ; 978ef
; script command 0x29
; parameters:
;     person (SingleByteParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld c, a
	callba DelCellNum
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97904

Script_checkcellnum: ; 97904
; script command 0x2a
; parameters:
;     person (SingleByteParam)
; returns false if the cell number is not in your phone

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld c, a
	callba CheckCellNum
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97919

Script_specialphonecall: ; 97919
; script command 0x9c
; parameters:
;     call_id (MultiByteParam)

	call GetScriptByte
	ld [wSpecialPhoneCallID], a
	call GetScriptByte
	ld [wSpecialPhoneCallID + 1], a
	ret
; 97926

Script_checkphonecall: ; 97926
; script command 0x9d
; returns false if no special phone call is stored

	ld a, [wSpecialPhoneCallID]
	and a
	jr z, .ok
	ld a, TRUE
.ok
	ld [ScriptVar], a
	ret
; 97932

Script_givepoke: ; 97932
; script command 0x2d
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)
;     item (ItemLabelByte)
;     trainer (DecimalParam)
;     trainer_name_pointer (MultiByteParam)
;     pkmn_nickname (MultiByteParam)

	call GetScriptByte
	ld [CurPartySpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	call GetScriptByte
	ld [CurItem], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .ok
	ld hl, ScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.ok
	callba GivePoke
	ld a, b
	ld [ScriptVar], a
	ret
; 97968

Script_giveegg: ; 97968
; script command 0x2e
; parameters:
;     pkmn (PokemonParam)
;     level (DecimalParam)
; if no room in the party, return 0 in ScriptVar; else, return 2

	xor a ; PARTYMON
	ld [ScriptVar], a
	ld [MonType], a
	call GetScriptByte
	ld [CurPartySpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	callba GiveEgg
	ret nc
	ld a, 2
	ld [ScriptVar], a
	ret
; 97988

Script_setevent: ; 97988
; script command 0x33
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	call EventFlagAction
	ret
; 97996

Script_clearevent: ; 97996
; script command 0x32
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	call EventFlagAction
	ret
; 979a4

Script_checkevent: ; 979a4
; script command 0x31
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [ScriptVar], a
	ret
; 979bb

Script_setflag: ; 979bb
; script command 0x36
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	call _EngineFlagAction
	ret
; 979c9

Script_clearflag: ; 979c9
; script command 0x35
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	call _EngineFlagAction
	ret
; 979d7

Script_checkflag: ; 979d7
; script command 0x34
; parameters:
;     bit_number (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, 2 ; check
	call _EngineFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [ScriptVar], a
	ret
; 979ee

_EngineFlagAction: ; 979ee
	callba EngineFlagAction
	ret
; 979f5

Script_wildoff: ; 979f5
; script command 0x38

	ld hl, StatusFlags
	set 5, [hl]
	ret
; 979fb

Script_wildon: ; 979fb
; script command 0x37

	ld hl, StatusFlags
	res 5, [hl]
	ret
; 97a01

Script_xycompare: ; 97a01
; script command 0x39
; parameters:
;     pointer (MultiByteParam)

	call GetScriptByte
	ld [wXYComparePointer], a
	call GetScriptByte
	ld [wXYComparePointer + 1], a
	ret
; 97a0e

Script_warpfacing: ; 97a0e
; script command 0xa3
; parameters:
;     facing (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

	call GetScriptByte
	and $3
	ld c, a
	ld a, [wPlayerSpriteSetupFlags]
	set 5, a
	or c
	ld [wPlayerSpriteSetupFlags], a
; fall through

Script_warp: ; 97a1d
; script command 0x3c
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)

; This seems to be some sort of error handling case.
	call GetScriptByte
	and a
	jr z, .not_ok
	ld [MapGroup], a
	call GetScriptByte
	ld [MapNumber], a
	call GetScriptByte
	ld [XCoord], a
	call GetScriptByte
	ld [YCoord], a
	ld a, -1
	ld [wd001], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	call StopScript
	ret

.not_ok
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, -1
	ld [wd001], a
	ld a, MAPSETUP_BADWARP
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	call StopScript
	ret
; 97a65

Script_warpmod: ; 97a65
; script command 0x3a
; parameters:
;     warp_id (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld [BackupWarpNumber], a
	call GetScriptByte
	ld [BackupMapGroup], a
	call GetScriptByte
	ld [BackupMapNumber], a
	ret
; 97a78

Script_blackoutmod: ; 97a78
; script command 0x3b
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)

	call GetScriptByte
	ld [wLastSpawnMapGroup], a
	call GetScriptByte
	ld [wLastSpawnMapNumber], a
	ret
; 97a85

Script_dontrestartmapmusic: ; 97a85
; script command 0x83

	ld a, 1
	ld [wDontPlayMapMusicOnReload], a
	ret
; 97a8b

Script_writecmdqueue: ; 97a8b
; script command 0x7d
; parameters:
;     queue_pointer (MultiByteParam)

	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	callba WriteCmdQueue ; no need to farcall
	ret
; 97a9e

Script_delcmdqueue: ; 97a9e
; script command 0x7e
; parameters:
;     byte (SingleByteParam)

	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld b, a
	callba DelCmdQueue ; no need to farcall
	ret c
	ld a, 1
	ld [ScriptVar], a
	ret
; 97ab3

Script_changemap: ; 97ab3
; script command 0x79
; parameters:
;     map_data_pointer (MapDataPointerParam)

	call GetScriptByte
	ld [MapBlockDataBank], a
	call GetScriptByte
	ld [MapBlockDataPointer], a
	call GetScriptByte
	ld [MapBlockDataPointer + 1], a
	call ChangeMap
	call BufferScreen
	ret
; 97acc

Script_changeblock: ; 97acc
; script command 0x7a
; parameters:
;     x (SingleByteParam)
;     y (SingleByteParam)
;     block (SingleByteParam)

	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	call GetBlockLocation
	call GetScriptByte
	ld [hl], a
	call BufferScreen
	ret
; 97ae3

Script_reloadmappart:: ; 97ae3
; script command 0x7c

	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call GetMovementPermissions
	callba ReloadMapPart
	call UpdateSprites
	ret
; 97af6

Script_warpcheck: ; 97af6
; script command 0x8e

	call WarpCheck
	ret nc
	callba EnableEvents
	ret
; 97b01

Script_enableevents: ; unreferenced
	callba EnableEvents
	ret
; 97b08

Script_newloadmap: ; 97b08
; script command 0x8a
; parameters:
;     which_method (SingleByteParam)

	call GetScriptByte
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	call StopScript
	ret
; 97b16

Script_reloadandreturn: ; 97b16
; script command 0x92

	call Script_newloadmap
	jp Script_end
; 97b1c

Script_textbox: ; 97b1c
; script command 0x47

	call OpenText
	ret
; 97b20

Script_refreshscreen: ; 97b20
; script command 0x48
; parameters:
;     dummy (SingleByteParam)

	call RefreshScreen
	call GetScriptByte
	ret
; 97b27

Script_loadbytec2cf: ; 97b27
; script command 0x4a
; parameters:
;     byte (SingleByteParam)

	call GetScriptByte
	ld [wc2cf], a
	ret
; 97b2e

	ld c, c ; XXX

Script_closetext: ; 97b2f
; script command 0x49

	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call CloseText
	ret
; 97b36


Script_passtoengine: ; 97b36
; script command 0x89
; parameters:
;     data_pointer (PointerLabelBeforeBank)

	call GetScriptByte
	push af
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	pop af
	call StartAutoInput
	ret
; 97b47

Script_pause: ; 97b47
; script command 0x8b
; parameters:
;     length (DecimalParam)

	call GetScriptByte
	and a
	jr z, .loop
	ld [ScriptDelay], a
.loop
	ld c, 2
	call DelayFrames
	ld hl, ScriptDelay
	dec [hl]
	jr nz, .loop
	ret
; 97b5c

Script_deactivatefacing: ; 97b5c
; script command 0x8c
; parameters:
;     time (SingleByteParam)

	call GetScriptByte
	and a
	jr z, .no_time
	ld [ScriptDelay], a
.no_time
	ld a, SCRIPT_WAIT
	ld [ScriptMode], a
	call StopScript
	ret
; 97b6e

Script_ptpriorityjump: ; 97b6e
; script command 0x8f
; parameters:
;     pointer (ScriptPointerLabelParam)

	call StopScript
	jp Script_jump
; 97b74

Script_end: ; 97b74
; script command 0x91

	call ExitScriptSubroutine
	jr c, .resume
	ret

.resume
	xor a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 97b8c

Script_return: ; 97b8c
; script command 0x90

	call ExitScriptSubroutine
	jr c, .dummy
.dummy
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 97b9a

ExitScriptSubroutine: ; 97b9a
; Return carry if there's no parent to return to.

	ld hl, wScriptStackSize
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld e, [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl,de
	add hl,de
	add hl,de
	ld a, [hli]
	ld b, a
	and " "
	ld [ScriptBank], a
	ld a, [hli]
	ld e, a
	ld [ScriptPos], a
	ld a, [hl]
	ld d, a
	ld [ScriptPos + 1], a
	and a
	ret
.done
	scf
	ret
; 97bc0

Script_end_all: ; 97bc0
; script command 0x93

	xor a
	ld [wScriptStackSize], a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	call StopScript
	ret
; 97bd5

Script_halloffame: ; 97bd5
; script command 0xa1

	ld hl, GameTimerPause
	res 0, [hl]
	callba Mobile_HallOfFame
	callba Mobile_HallOfFame2
	callba HallOfFame
	ld hl, GameTimerPause
	set 0, [hl]
	jr ReturnFromCredits
; 97bf3

Script_credits: ; 97bf3
; script command 0xa2

	callba RedCredits
ReturnFromCredits:
	call Script_end_all
	ld a, $3
	call LoadMapStatus
	call StopScript
	ret
; 97c051

Script_wait: ; 97c05
; script command 0xa8
; parameters:
;     unknown (SingleByteParam)

	push bc
	call GetScriptByte
.loop
	push af
	ld c, 6
	call DelayFrames
	pop af
	dec a
	jr nz, .loop
	pop bc
	ret
; 97c15

Script_check_save: ; 97c15
; script command 0xa9

	callba CheckSave
	ld a, c
	ld [ScriptVar], a
	ret
; 97c20


; 97c20 unreferenced
	ld a, [.byte]
	ld [ScriptVar], a
	ret

.byte
	db 0
; 97c28
