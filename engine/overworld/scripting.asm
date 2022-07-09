; Event scripting commands.

EnableScriptMode::
	push af
	ld a, SCRIPT_READ
	ld [wScriptMode], a
	pop af
	ret

ScriptEvents::
	call StartScript
.loop
	ld a, [wScriptMode]
	ld hl, .modes
	rst JumpTable
	call CheckScript
	jr nz, .loop
	ret

.modes
	dw EndScript
	dw RunScriptCommand
	dw WaitScriptMovement
	dw WaitScript

EndScript:
	call StopScript
	ret

WaitScript:
	call StopScript

	ld hl, wScriptDelay
	dec [hl]
	ret nz

	farcall UnfreezeAllObjects

	ld a, SCRIPT_READ
	ld [wScriptMode], a
	call StartScript
	ret

WaitScriptMovement:
	call StopScript

	ld hl, wVramState
	bit 7, [hl]
	ret nz

	farcall UnfreezeAllObjects

	ld a, SCRIPT_READ
	ld [wScriptMode], a
	call StartScript
	ret

RunScriptCommand:
	call GetScriptByte
	ld hl, ScriptCommandTable
	rst JumpTable
	ret

ScriptCommandTable:
; entries correspond to *_command constants (see macros/scripts/events.asm)
	table_width 2, ScriptCommandTable
	dw Script_scall                      ; 00
	dw Script_farscall                   ; 01
	dw Script_memcall                    ; 02
	dw Script_sjump                      ; 03
	dw Script_farsjump                   ; 04
	dw Script_memjump                    ; 05
	dw Script_ifequal                    ; 06
	dw Script_ifnotequal                 ; 07
	dw Script_iffalse                    ; 08
	dw Script_iftrue                     ; 09
	dw Script_ifgreater                  ; 0a
	dw Script_ifless                     ; 0b
	dw Script_jumpstd                    ; 0c
	dw Script_callstd                    ; 0d
	dw Script_callasm                    ; 0e
	dw Script_special                    ; 0f
	dw Script_memcallasm                 ; 10
	dw Script_checkmapscene              ; 11
	dw Script_setmapscene                ; 12
	dw Script_checkscene                 ; 13
	dw Script_setscene                   ; 14
	dw Script_setval                     ; 15
	dw Script_addval                     ; 16
	dw Script_random                     ; 17
	dw Script_checkver                   ; 18
	dw Script_readmem                    ; 19
	dw Script_writemem                   ; 1a
	dw Script_loadmem                    ; 1b
	dw Script_readvar                    ; 1c
	dw Script_writevar                   ; 1d
	dw Script_loadvar                    ; 1e
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
	dw Script_givepokemail               ; 2f
	dw Script_checkpokemail              ; 30
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
	dw Script_getmoney                   ; 3d
	dw Script_getcoins                   ; 3e
	dw Script_getnum                     ; 3f
	dw Script_getmonname                 ; 40
	dw Script_getitemname                ; 41
	dw Script_getcurlandmarkname         ; 42
	dw Script_gettrainername             ; 43
	dw Script_getstring                  ; 44
	dw Script_itemnotify                 ; 45
	dw Script_pocketisfull               ; 46
	dw Script_opentext                   ; 47
	dw Script_refreshscreen              ; 48
	dw Script_closetext                  ; 49
	dw Script_writeunusedbyte            ; 4a
	dw Script_farwritetext               ; 4b
	dw Script_writetext                  ; 4c
	dw Script_repeattext                 ; 4d
	dw Script_yesorno                    ; 4e
	dw Script_loadmenu                   ; 4f
	dw Script_closewindow                ; 50
	dw Script_jumptextfaceplayer         ; 51
	dw Script_farjumptext                ; 52
	dw Script_jumptext                   ; 53
	dw Script_waitbutton                 ; 54
	dw Script_promptbutton               ; 55
	dw Script_pokepic                    ; 56
	dw Script_closepokepic               ; 57
	dw Script__2dmenu                    ; 58
	dw Script_verticalmenu               ; 59
	dw Script_loadpikachudata            ; 5a
	dw Script_randomwildmon              ; 5b
	dw Script_loadtemptrainer            ; 5c
	dw Script_loadwildmon                ; 5d
	dw Script_loadtrainer                ; 5e
	dw Script_startbattle                ; 5f
	dw Script_reloadmapafterbattle       ; 60
	dw Script_catchtutorial              ; 61
	dw Script_trainertext                ; 62
	dw Script_trainerflagaction          ; 63
	dw Script_winlosstext                ; 64
	dw Script_scripttalkafter            ; 65
	dw Script_endifjustbattled           ; 66
	dw Script_checkjustbattled           ; 67
	dw Script_setlasttalked              ; 68
	dw Script_applymovement              ; 69
	dw Script_applymovementlasttalked    ; 6a
	dw Script_faceplayer                 ; 6b
	dw Script_faceobject                 ; 6c
	dw Script_variablesprite             ; 6d
	dw Script_disappear                  ; 6e
	dw Script_appear                     ; 6f
	dw Script_follow                     ; 70
	dw Script_stopfollow                 ; 71
	dw Script_moveobject                 ; 72
	dw Script_writeobjectxy              ; 73
	dw Script_loademote                  ; 74
	dw Script_showemote                  ; 75
	dw Script_turnobject                 ; 76
	dw Script_follownotexact             ; 77
	dw Script_earthquake                 ; 78
	dw Script_changemapblocks            ; 79
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
	dw Script_autoinput                  ; 89
	dw Script_newloadmap                 ; 8a
	dw Script_pause                      ; 8b
	dw Script_deactivatefacing           ; 8c
	dw Script_sdefer                     ; 8d
	dw Script_warpcheck                  ; 8e
	dw Script_stopandsjump               ; 8f
	dw Script_endcallback                ; 90
	dw Script_end                        ; 91
	dw Script_reloadend                  ; 92
	dw Script_endall                     ; 93
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
	dw Script_verbosegiveitemvar         ; 9f
	dw Script_swarm                      ; a0
	dw Script_halloffame                 ; a1
	dw Script_credits                    ; a2
	dw Script_warpfacing                 ; a3
	dw Script_battletowertext            ; a4
	dw Script_getlandmarkname            ; a5
	dw Script_gettrainerclassname        ; a6
	dw Script_getname                    ; a7
	dw Script_wait                       ; a8
	dw Script_checksave                  ; a9
	assert_table_length NUM_EVENT_COMMANDS

StartScript:
	ld hl, wScriptFlags
	set SCRIPT_RUNNING, [hl]
	ret

CheckScript:
	ld hl, wScriptFlags
	bit SCRIPT_RUNNING, [hl]
	ret

StopScript:
	ld hl, wScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret

Script_callasm:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, b
	rst FarCall
	ret

Script_special:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	farcall Special
	ret

Script_memcallasm:
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

Script_jumptextfaceplayer:
	ld a, [wScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextFacePlayerScript)
	ld hl, JumpTextFacePlayerScript
	jp ScriptJump

Script_jumptext:
	ld a, [wScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump

JumpTextFacePlayerScript:
	faceplayer
JumpTextScript:
	opentext
	repeattext -1, -1
	waitbutton
	closetext
	end

Script_farjumptext:
	call GetScriptByte
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump

Script_writetext:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
	call MapTextbox
	ret

Script_farwritetext:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call MapTextbox
	ret

Script_repeattext:
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

Script_waitbutton:
	jp WaitButton

Script_promptbutton:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call PromptButton
	pop af
	ldh [hOAMUpdate], a
	ret

Script_yesorno:
	call YesNoBox
	ld a, FALSE
	jr c, .no
	ld a, TRUE
.no
	ld [wScriptVar], a
	vc_hook Unknown_yesorno_ret
	ret

Script_loadmenu:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld de, LoadMenuHeader
	ld a, [wScriptBank]
	call Call_a_de
	call UpdateSprites
	ret

Script_closewindow:
	call CloseWindow
	call UpdateSprites
	ret

Script_pokepic:
	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurPartySpecies], a
	farcall Pokepic
	ret

Script_closepokepic:
	farcall ClosePokepic
	ret

Script_verticalmenu:
	ld a, [wScriptBank]
	ld hl, VerticalMenu
	rst FarCall
	ld a, [wMenuCursorY]
	jr nc, .ok
	xor a
.ok
	ld [wScriptVar], a
	ret

Script__2dmenu:
	ld a, [wScriptBank]
	ld hl, _2DMenu
	rst FarCall
	ld a, [wMenuCursorPosition]
	jr nc, .ok
	xor a
.ok
	ld [wScriptVar], a
	ret

Script_battletowertext:
	call SetUpTextbox
	call GetScriptByte
	ld c, a
	farcall BattleTowerText
	ret

Script_verbosegiveitem:
	call Script_giveitem
	call CurItemName
	ld de, wStringBuffer1
	ld a, STRING_BUFFER_4
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall

GiveItemScript_DummyFunction:
	ret

GiveItemScript:
	callasm GiveItemScript_DummyFunction
	writetext .ReceivedItemText
	iffalse .Full
	waitsfx
	specialsound
	waitbutton
	itemnotify
	end

.Full:
	promptbutton
	pocketisfull
	end

.ReceivedItemText:
	text_far _ReceivedItemText
	text_end

Script_verbosegiveitemvar:
	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ld a, TRUE
	jr c, .ok2
	xor a
.ok2
	ld [wScriptVar], a
	call CurItemName
	ld de, wStringBuffer1
	ld a, STRING_BUFFER_4
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall

Script_itemnotify:
	call GetPocketName
	call CurItemName
	ld b, BANK(PutItemInPocketText)
	ld hl, PutItemInPocketText
	call MapTextbox
	ret

Script_pocketisfull:
	call GetPocketName
	call CurItemName
	ld b, BANK(PocketIsFullText)
	ld hl, PocketIsFullText
	call MapTextbox
	ret

Script_specialsound:
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	cp TM_HM
	ld de, SFX_GET_TM
	jr z, .play
	ld de, SFX_ITEM
.play
	call PlaySFX
	call WaitSFX
	ret

GetPocketName:
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	dec a
	ld hl, ItemPocketNames
	maskbits NUM_POCKETS
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wStringBuffer3
	call CopyName2
	ret

INCLUDE "data/items/pocket_names.asm"

CurItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ret

PutItemInPocketText:
	text_far _PutItemInPocketText
	text_end

PocketIsFullText:
	text_far _PocketIsFullText
	text_end

Script_pokemart:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret

Script_elevator:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall Elevator
	ret c
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_trade:
	call GetScriptByte
	ld e, a
	farcall NPCTrade
	ret

Script_phonecall:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall PhoneCall
	ret

Script_hangup:
	farcall HangUp
	ret

Script_askforphonenumber:
	call YesNoBox
	jr c, .refused
	call GetScriptByte
	ld c, a
	farcall AddPhoneNumber
	jr c, .phonefull
	xor a ; PHONE_CONTACT_GOT
	jr .done
.phonefull
	ld a, PHONE_CONTACTS_FULL
	jr .done
.refused
	call GetScriptByte
	ld a, PHONE_CONTACT_REFUSED
.done
	ld [wScriptVar], a
	ret

Script_describedecoration:
	call GetScriptByte
	ld b, a
	farcall DescribeDecoration
	ld h, d
	ld l, e
	jp ScriptJump

Script_fruittree:
	call GetScriptByte
	ld [wCurFruitTree], a
	ld b, BANK(FruitTreeScript)
	ld hl, FruitTreeScript
	jp ScriptJump

Script_swarm:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld d, a
	call GetScriptByte
	ld e, a
	farcall StoreSwarmMapIndices
	ret

Script_trainertext:
	call GetScriptByte
	ld c, a
	ld b, 0
	ld hl, wSeenTextPointer
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSeenTrainerBank]
	ld b, a
	call MapTextbox
	ret

Script_scripttalkafter:
	ld hl, wScriptAfterPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSeenTrainerBank]
	ld b, a
	jp ScriptJump

Script_trainerflagaction:
	xor a
	ld [wScriptVar], a
	ld hl, wTempTrainerEventFlag
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
	ld [wScriptVar], a
	ret

Script_winlosstext:
	ld hl, wWinTextPointer
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ld hl, wLossTextPointer
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ret

Script_endifjustbattled:
	ld a, [wRunningTrainerBattleScript]
	and a
	ret z
	jp Script_end

Script_checkjustbattled:
	ld a, TRUE
	ld [wScriptVar], a
	ld a, [wRunningTrainerBattleScript]
	and a
	ret nz
	xor a
	ld [wScriptVar], a
	ret

Script_encountermusic:
	ld a, [wOtherTrainerClass]
	ld e, a
	farcall PlayTrainerEncounterMusic
	ret

Script_playmapmusic:
	call PlayMapMusic
	ret

Script_playmusic:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wMusicFade], a
	call MaxVolume
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlayMusic
	ret

Script_musicfadeout:
	call GetScriptByte
	ld [wMusicFadeID], a
	call GetScriptByte
	ld [wMusicFadeID + 1], a
	call GetScriptByte
	and ~(1 << MUSIC_FADE_IN_F)
	ld [wMusicFade], a
	ret

Script_playsound:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	call PlaySFX
	ret

Script_waitsfx:
	call WaitSFX
	ret

Script_warpsound:
	farcall GetWarpSFX
	call PlaySFX
	ret

Script_cry:
	call GetScriptByte
	push af
	call GetScriptByte
	pop af
	and a
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	call PlayMonCry
	ret

GetScriptObject:
	and a ; PLAYER?
	ret z
	cp LAST_TALKED
	ret z
	dec a
	ret

Script_setlasttalked:
	call GetScriptByte
	call GetScriptObject
	ldh [hLastTalked], a
	ret

Script_applymovement:
	call GetScriptByte
	call GetScriptObject
	ld c, a

ApplyMovement:
	push bc
	ld a, c
	farcall FreezeAllOtherObjects
	pop bc

	push bc
	call UnfreezeFollowerObject
	pop bc

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
	call GetMovementData
	ret c

	ld a, SCRIPT_WAIT_MOVEMENT
	ld [wScriptMode], a
	call StopScript
	ret

UnfreezeFollowerObject:
	farcall _UnfreezeFollowerObject
	ret

Script_applymovementlasttalked:
; apply movement to last talked

	ldh a, [hLastTalked]
	ld c, a
	jp ApplyMovement

Script_faceplayer:
	ldh a, [hLastTalked]
	and a
	ret z
	ld d, $0
	ldh a, [hLastTalked]
	ld e, a
	farcall GetRelativeFacing
	ld a, d
	add a
	add a
	ld e, a
	ldh a, [hLastTalked]
	ld d, a
	call ApplyObjectFacing
	ret

Script_faceobject:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr c, .ok
	ldh a, [hLastTalked]
.ok
	ld e, a
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok2
	ldh a, [hLastTalked]
.ok2
	ld d, a
	push de
	farcall GetRelativeFacing
	pop bc
	ret c
	ld a, d
	add a
	add a
	ld e, a
	ld d, c
	call ApplyObjectFacing
	ret

Script_turnobject:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	ld d, a
	call GetScriptByte
	add a
	add a
	ld e, a
	call ApplyObjectFacing
	ret

ApplyObjectFacing:
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
	bit FIXED_FACING_F, [hl]
	jr nz, .not_visible
	pop de
	ld a, e
	call SetSpriteDirection
	ld hl, wVramState
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

.DisableTextTiles:
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

Script_variablesprite:
	call GetScriptByte
	ld e, a
	ld d, 0
	ld hl, wVariableSprites
	add hl, de
	call GetScriptByte
	ld [hl], a
	ret

Script_appear:
	call GetScriptByte
	call GetScriptObject
	call UnmaskCopyMapObjectStruct
	ldh a, [hMapObjectIndex]
	ld b, 0 ; clear
	call ApplyEventActionAppearDisappear
	ret

Script_disappear:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	call DeleteObjectStruct
	ldh a, [hMapObjectIndex]
	ld b, 1 ; set
	call ApplyEventActionAppearDisappear
	farcall _UpdateSprites
	ret

ApplyEventActionAppearDisappear:
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

Script_follow:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	call GetScriptObject
	ld c, a
	farcall StartFollow
	ret

Script_stopfollow:
	farcall StopFollow
	ret

Script_moveobject:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	farcall CopyDECoordsToMapObject
	ret

Script_writeobjectxy:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	ld b, a
	farcall WriteObjectXY
	ret

Script_follownotexact:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	call GetScriptObject
	ld c, a
	farcall FollowNotExact
	ret

Script_loademote:
	call GetScriptByte
	cp EMOTE_FROM_MEM
	jr nz, .not_var_emote
	ld a, [wScriptVar]
.not_var_emote
	ld c, a
	farcall LoadEmote
	ret

Script_showemote:
	call GetScriptByte
	ld [wScriptVar], a
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr z, .ok
	ldh [hLastTalked], a
.ok
	call GetScriptByte
	ld [wScriptDelay], a
	ld b, BANK(ShowEmoteScript)
	ld de, ShowEmoteScript
	jp ScriptCall

ShowEmoteScript:
	loademote EMOTE_FROM_MEM
	applymovementlasttalked .Show
	pause 0
	applymovementlasttalked .Hide
	end

.Show:
	show_emote
	step_sleep 1
	step_end

.Hide:
	hide_emote
	step_sleep 1
	step_end

Script_earthquake:
	ld hl, EarthquakeMovement
	ld de, wEarthquakeMovementDataBuffer
	ld bc, EarthquakeMovement.End - EarthquakeMovement
	call CopyBytes
	call GetScriptByte
	ld [wEarthquakeMovementDataBuffer + 1], a
	and %00111111
	ld [wEarthquakeMovementDataBuffer + 3], a
	ld b, BANK(.script)
	ld de, .script
	jp ScriptCall

.script
	applymovement PLAYER, wEarthquakeMovementDataBuffer
	end

EarthquakeMovement:
	step_shake 16 ; the 16 gets overwritten with the script byte
	step_sleep 16 ; the 16 gets overwritten with the lower 6 bits of the script byte
	step_end
.End

Script_loadpikachudata:
	ld a, PIKACHU
	ld [wTempWildMonSpecies], a
	ld a, 5
	ld [wCurPartyLevel], a
	ret

Script_randomwildmon:
	xor a
	ld [wBattleScriptFlags], a
	ret

Script_loadtemptrainer:
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	ld a, [wTempTrainerClass]
	ld [wOtherTrainerClass], a
	ld a, [wTempTrainerID]
	ld [wOtherTrainerID], a
	ret

Script_loadwildmon:
	ld a, (1 << 7)
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [wTempWildMonSpecies], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	ret

Script_loadtrainer:
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [wOtherTrainerClass], a
	call GetScriptByte
	ld [wOtherTrainerID], a
	ret

Script_startbattle:
	call BufferScreen
	predef StartBattle
	ld a, [wBattleResult]
	and ~BATTLERESULT_BITMASK
	ld [wScriptVar], a
	ret

Script_catchtutorial:
	call GetScriptByte
	ld [wBattleType], a
	call BufferScreen
	farcall CatchTutorial
	jp Script_reloadmap

Script_reloadmapafterbattle:
	ld hl, wBattleScriptFlags
	ld d, [hl]
	ld [hl], 0
	ld a, [wBattleResult]
	and ~BATTLERESULT_BITMASK
	cp LOSE
	jr nz, .notblackedout
	ld b, BANK(Script_BattleWhiteout)
	ld hl, Script_BattleWhiteout
	jp ScriptJump

.notblackedout
	bit 0, d
	jr z, .was_wild
	farcall MomTriesToBuySomething
	jr .done

.was_wild
	ld a, [wBattleResult]
	bit BATTLERESULT_BOX_FULL, a
	jr z, .done
	ld b, BANK(Script_SpecialBillCall)
	ld de, Script_SpecialBillCall
	farcall LoadScriptBDE
.done
	jp Script_reloadmap

Script_reloadmap:
	xor a
	ld [wBattleScriptFlags], a
	ld a, MAPSETUP_RELOADMAP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	call StopScript
	ret

Script_scall:
	ld a, [wScriptBank]
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall

Script_farscall:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall

Script_memcall:
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

ScriptCall:
; BUG: ScriptCall can overflow wScriptStack and crash (see docs/bugs_and_glitches.md)

	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret

CallCallback::
	ld a, [wScriptBank]
	or $80
	ld [wScriptBank], a
	jp ScriptCall

Script_sjump:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
	jp ScriptJump

Script_farsjump:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jp ScriptJump

Script_memjump:
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

Script_iffalse:
	ld a, [wScriptVar]
	and a
	jp nz, SkipTwoScriptBytes
	jp Script_sjump

Script_iftrue:
	ld a, [wScriptVar]
	and a
	jp nz, Script_sjump
	jp SkipTwoScriptBytes

Script_ifequal:
	call GetScriptByte
	ld hl, wScriptVar
	cp [hl]
	jr z, Script_sjump
	jr SkipTwoScriptBytes

Script_ifnotequal:
	call GetScriptByte
	ld hl, wScriptVar
	cp [hl]
	jr nz, Script_sjump
	jr SkipTwoScriptBytes

Script_ifgreater:
	ld a, [wScriptVar]
	ld b, a
	call GetScriptByte
	cp b
	jr c, Script_sjump
	jr SkipTwoScriptBytes

Script_ifless:
	call GetScriptByte
	ld b, a
	ld a, [wScriptVar]
	cp b
	jr c, Script_sjump
	jr SkipTwoScriptBytes

Script_jumpstd:
	call StdScript
	jr ScriptJump

Script_callstd:
	call StdScript
	ld d, h
	ld e, l
	jp ScriptCall

StdScript:
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
	call GetFarWord
	ret

SkipTwoScriptBytes:
	call GetScriptByte
	call GetScriptByte
	ret

ScriptJump:
	ld a, b
	ld [wScriptBank], a
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	ret

Script_sdefer:
	ld a, [wScriptBank]
	ld [wDeferredScriptBank], a
	call GetScriptByte
	ld [wDeferredScriptAddr], a
	call GetScriptByte
	ld [wDeferredScriptAddr + 1], a
	ld hl, wScriptFlags
	set 3, [hl]
	ret

Script_checkscene:
	call CheckScenes
	jr z, .no_scene
	ld [wScriptVar], a
	ret

.no_scene
	ld a, $ff
	ld [wScriptVar], a
	ret

Script_checkmapscene:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	call GetMapSceneID
	ld a, d
	or e
	jr z, .no_scene
	ld a, [de]
	ld [wScriptVar], a
	ret

.no_scene
	ld a, $ff
	ld [wScriptVar], a
	ret

Script_setscene:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	jr DoScene

Script_setmapscene:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
DoScene:
	call GetMapSceneID
	ld a, d
	or e
	jr z, .no_scene
	call GetScriptByte
	ld [de], a
.no_scene
	ret

Script_readmem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [hl]
	ld [wScriptVar], a
	ret

Script_writemem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptVar]
	ld [hl], a
	ret

Script_loadmem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call GetScriptByte
	ld [hl], a
	ret

Script_setval:
	call GetScriptByte
	ld [wScriptVar], a
	ret

Script_addval:
	call GetScriptByte
	ld hl, wScriptVar
	add [hl]
	ld [hl], a
	ret

Script_random:
	call GetScriptByte
	ld [wScriptVar], a
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
	ldh a, [hRandomAdd]
	cp b
	jr nc, .loop
	jr .finish

.no_restriction
	push bc
	call Random
	pop bc
	ldh a, [hRandomAdd]

.finish
	push af
	ld a, [wScriptVar]
	ld c, a
	pop af
	call SimpleDivide
	ld [wScriptVar], a
	ret

.Divide256byC:
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

Script_readvar:
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wScriptVar], a
	ret

Script_writevar:
	call GetScriptByte
	call GetVarAction
	ld a, [wScriptVar]
	ld [de], a
	ret

Script_loadvar:
	call GetScriptByte
	call GetVarAction
	call GetScriptByte
	ld [de], a
	ret

GetVarAction:
	ld c, a
	farcall _GetVarAction
	ret

Script_checkver:
	ld a, [.gs_version]
	ld [wScriptVar], a
	ret

.gs_version:
	db GS_VERSION

Script_getmonname:
	call GetScriptByte
	and a
	jr nz, .gotit
	ld a, [wScriptVar]
.gotit
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld de, wStringBuffer1

GetStringBuffer:
	call GetScriptByte
	cp NUM_STRING_BUFFERS
	jr c, .ok
	xor a
.ok

CopyConvertedText:
	ld hl, wStringBuffer3
	ld bc, STRING_BUFFER_LENGTH
	call AddNTimes
	call CopyName2
	ret

Script_getitemname:
	call GetScriptByte
	and a ; USE_SCRIPT_VAR
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wNamedObjectIndex], a
	call GetItemName
	ld de, wStringBuffer1
	jr GetStringBuffer

Script_getcurlandmarkname:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation

ConvertLandmarkToText:
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	jp GetStringBuffer

Script_getlandmarkname:
	call GetScriptByte
	jr ConvertLandmarkToText

Script_gettrainername:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld b, a
	farcall GetTrainerName
	jr GetStringBuffer

Script_getname:
	call GetScriptByte
	ld [wNamedObjectType], a

ContinueToGetName:
	call GetScriptByte
	ld [wCurSpecies], a
	call GetName
	ld de, wStringBuffer1
	jp GetStringBuffer

Script_gettrainerclassname:
	ld a, TRAINER_NAME
	ld [wNamedObjectType], a
	jr ContinueToGetName

Script_getmoney:
	call ResetStringBuffer1
	call GetMoneyAccount
	ld hl, wStringBuffer1
	lb bc, PRINTNUM_LEFTALIGN | 3, 6
	call PrintNum
	ld de, wStringBuffer1
	jp GetStringBuffer

Script_getcoins:
	call ResetStringBuffer1
	ld hl, wStringBuffer1
	ld de, wCoins
	lb bc, PRINTNUM_LEFTALIGN | 2, 6
	call PrintNum
	ld de, wStringBuffer1
	jp GetStringBuffer

Script_getnum:
	call ResetStringBuffer1
	ld de, wScriptVar
	ld hl, wStringBuffer1
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	ld de, wStringBuffer1
	jp GetStringBuffer

ResetStringBuffer1:
	ld hl, wStringBuffer1
	ld bc, NAME_LENGTH
	ld a, "@"
	call ByteFill
	ret

Script_getstring:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld hl, CopyName1
	rst FarCall
	ld de, wStringBuffer2
	jp GetStringBuffer

Script_givepokemail:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	call GetFarByte
	ld b, a
	push bc
	inc hl
	ld bc, MAIL_MSG_LENGTH
	ld de, wMonMailMessageBuffer
	ld a, [wScriptBank]
	call FarCopyBytes
	pop bc
	farcall GivePokeMail
	ret

Script_checkpokemail:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall CheckPokeMail
	ret

Script_giveitem:
	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .full
	ld a, TRUE
	ld [wScriptVar], a
	ret
.full
	xor a
	ld [wScriptVar], a
	ret

Script_takeitem:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_checkitem:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_givemoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall GiveMoney
	ret

Script_takemoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall TakeMoney
	ret

Script_checkmoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall CompareMoney

CompareMoneyAction:
	jr c, .less
	jr z, .exact
	ld a, HAVE_MORE
	jr .done
.exact
	ld a, HAVE_AMOUNT
	jr .done
.less
	ld a, HAVE_LESS
.done
	ld [wScriptVar], a
	ret

GetMoneyAccount:
	call GetScriptByte
	and a
	ld de, wMoney ; YOUR_MONEY
	ret z
	ld de, wMomsMoney ; MOMS_MONEY
	ret

LoadMoneyAmountToMem:
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

Script_givecoins:
	call LoadCoinAmountToMem
	farcall GiveCoins
	ret

Script_takecoins:
	call LoadCoinAmountToMem
	farcall TakeCoins
	ret

Script_checkcoins:
	call LoadCoinAmountToMem
	farcall CheckCoins
	jr CompareMoneyAction

LoadCoinAmountToMem:
	call GetScriptByte
	ldh [hMoneyTemp + 1], a
	call GetScriptByte
	ldh [hMoneyTemp], a
	ld bc, hMoneyTemp
	ret

Script_checktime:
	xor a
	ld [wScriptVar], a
	farcall CheckTime
	call GetScriptByte
	and c
	ret z
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_checkpoke:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld hl, wPartySpecies
	ld de, 1
	call IsInArray
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_addcellnum:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld c, a
	farcall AddPhoneNumber
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_delcellnum:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld c, a
	farcall DelCellNum
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_checkcellnum:
; returns false if the cell number is not in your phone

	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld c, a
	farcall CheckCellNum
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_specialphonecall:
	call GetScriptByte
	ld [wSpecialPhoneCallID], a
	call GetScriptByte
	ld [wSpecialPhoneCallID + 1], a
	ret

Script_checkphonecall:
; returns false if no special phone call is stored

	ld a, [wSpecialPhoneCallID]
	and a
	jr z, .ok
	ld a, TRUE
.ok
	ld [wScriptVar], a
	ret

Script_givepoke:
	call GetScriptByte
	ld [wCurPartySpecies], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .ok
	ld hl, wScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.ok
	farcall GivePoke
	ld a, b
	ld [wScriptVar], a
	ret

Script_giveegg:
; if no room in the party, return 0 in wScriptVar; else, return 2

	xor a ; PARTYMON
	ld [wScriptVar], a
	ld [wMonType], a
	call GetScriptByte
	ld [wCurPartySpecies], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	farcall GiveEgg
	ret nc
	ld a, 2
	ld [wScriptVar], a
	ret

Script_setevent:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	call EventFlagAction
	ret

Script_clearevent:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	call EventFlagAction
	ret

Script_checkevent:
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
	ld [wScriptVar], a
	ret

Script_setflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	call _EngineFlagAction
	ret

Script_clearflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	call _EngineFlagAction
	ret

Script_checkflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, CHECK_FLAG
	call _EngineFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [wScriptVar], a
	ret

_EngineFlagAction:
	farcall EngineFlagAction
	ret

Script_wildoff:
	ld hl, wStatusFlags
	set STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	ret

Script_wildon:
	ld hl, wStatusFlags
	res STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	ret

Script_xycompare:
	call GetScriptByte
	ld [wXYComparePointer], a
	call GetScriptByte
	ld [wXYComparePointer + 1], a
	ret

Script_warpfacing:
	call GetScriptByte
	maskbits NUM_DIRECTIONS
	ld c, a
	ld a, [wPlayerSpriteSetupFlags]
	set PLAYERSPRITESETUP_CUSTOM_FACING_F, a
	or c
	ld [wPlayerSpriteSetupFlags], a
; fallthrough

Script_warp:
; This seems to be some sort of error handling case.
	call GetScriptByte
	and a
	jr z, .not_ok
	ld [wMapGroup], a
	call GetScriptByte
	ld [wMapNumber], a
	call GetScriptByte
	ld [wXCoord], a
	call GetScriptByte
	ld [wYCoord], a
	ld a, SPAWN_N_A
	ld [wDefaultSpawnpoint], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	call StopScript
	ret

.not_ok
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, SPAWN_N_A
	ld [wDefaultSpawnpoint], a
	ld a, MAPSETUP_BADWARP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	call StopScript
	ret

Script_warpmod:
	call GetScriptByte
	ld [wBackupWarpNumber], a
	call GetScriptByte
	ld [wBackupMapGroup], a
	call GetScriptByte
	ld [wBackupMapNumber], a
	ret

Script_blackoutmod:
	call GetScriptByte
	ld [wLastSpawnMapGroup], a
	call GetScriptByte
	ld [wLastSpawnMapNumber], a
	ret

Script_dontrestartmapmusic:
	ld a, TRUE
	ld [wDontPlayMapMusicOnReload], a
	ret

Script_writecmdqueue:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall WriteCmdQueue ; no need to farcall
	ret

Script_delcmdqueue:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld b, a
	farcall DelCmdQueue ; no need to farcall
	ret c
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_changemapblocks:
	call GetScriptByte
	ld [wMapBlocksBank], a
	call GetScriptByte
	ld [wMapBlocksPointer], a
	call GetScriptByte
	ld [wMapBlocksPointer + 1], a
	call ChangeMap
	call BufferScreen
	ret

Script_changeblock:
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

Script_reloadmappart::
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call GetMovementPermissions
	farcall ReloadMapPart
	call UpdateSprites
	ret

Script_warpcheck:
	call WarpCheck
	ret nc
	farcall EnableEvents
	ret

Script_enableevents: ; unreferenced
	farcall EnableEvents
	ret

Script_newloadmap:
	call GetScriptByte
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
	call StopScript
	ret

Script_reloadend:
	call Script_newloadmap
	jp Script_end

Script_opentext:
	call OpenText
	ret

Script_refreshscreen:
	call RefreshScreen
	call GetScriptByte
	ret

Script_writeunusedbyte:
	call GetScriptByte
	ld [wUnusedScriptByte], a
	ret

UnusedClosetextScript: ; unreferenced
	closetext

Script_closetext:
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	call CloseText
	ret

Script_autoinput:
	call GetScriptByte
	push af
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	pop af
	call StartAutoInput
	ret

Script_pause:
	call GetScriptByte
	and a
	jr z, .loop
	ld [wScriptDelay], a
.loop
	ld c, 2
	call DelayFrames
	ld hl, wScriptDelay
	dec [hl]
	jr nz, .loop
	ret

Script_deactivatefacing:
	call GetScriptByte
	and a
	jr z, .no_time
	ld [wScriptDelay], a
.no_time
	ld a, SCRIPT_WAIT
	ld [wScriptMode], a
	call StopScript
	ret

Script_stopandsjump:
	call StopScript
	jp Script_sjump

Script_end:
	call ExitScriptSubroutine
	jr c, .resume
	ret

.resume
	xor a
	ld [wScriptRunning], a
	ld a, SCRIPT_OFF
	ld [wScriptMode], a
	ld hl, wScriptFlags
	res 0, [hl]
	call StopScript
	ret

Script_endcallback:
	call ExitScriptSubroutine
	jr c, .dummy
.dummy
	ld hl, wScriptFlags
	res 0, [hl]
	call StopScript
	ret

ExitScriptSubroutine:
; Return carry if there's no parent to return to.

	ld hl, wScriptStackSize
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld e, [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	and $7f
	ld [wScriptBank], a
	ld a, [hli]
	ld e, a
	ld [wScriptPos], a
	ld a, [hl]
	ld d, a
	ld [wScriptPos + 1], a
	and a
	ret
.done
	scf
	ret

Script_endall:
	xor a
	ld [wScriptStackSize], a
	ld [wScriptRunning], a
	ld a, SCRIPT_OFF
	ld [wScriptMode], a
	ld hl, wScriptFlags
	res 0, [hl]
	call StopScript
	ret

Script_halloffame:
	ld hl, wGameTimerPaused
	res GAME_TIMER_PAUSED_F, [hl]
	farcall StubbedTrainerRankings_HallOfFame
	farcall StubbedTrainerRankings_HallOfFame2
	farcall HallOfFame
	ld hl, wGameTimerPaused
	set GAME_TIMER_PAUSED_F, [hl]
	jr ReturnFromCredits

Script_credits:
	farcall RedCredits
ReturnFromCredits:
	call Script_endall
	ld a, MAPSTATUS_DONE
	call LoadMapStatus
	call StopScript
	ret

Script_wait:
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

Script_checksave:
	farcall CheckSave
	ld a, c
	ld [wScriptVar], a
	ret

Script_checkver_duplicate: ; unreferenced
	ld a, [.gs_version]
	ld [wScriptVar], a
	ret

.gs_version:
	db GS_VERSION
