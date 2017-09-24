INCLUDE "includes.asm"

SECTION "Events", ROMX

OverworldLoop:: ; 966b0
	xor a
	ld [MapStatus], a
.loop
	ld a, [MapStatus]
	ld hl, .jumps
	rst JumpTable
	ld a, [MapStatus]
	cp 3 ; done
	jr nz, .loop
.done
	ret

.jumps
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done
; 966cb

DisableEvents: ; 966cb
	xor a
	ld [ScriptFlags3], a
	ret
; 966d0

EnableEvents:: ; 966d0
	ld a, $ff
	ld [ScriptFlags3], a
	ret
; 966d6

CheckBit5_ScriptFlags3: ; 966d6
	ld hl, ScriptFlags3
	bit 5, [hl]
	ret
; 966dc

DisableWarpsConnxns: ; 966dc
	ld hl, ScriptFlags3
	res 2, [hl]
	ret
; 966e2

DisableCoordEvents: ; 966e2
	ld hl, ScriptFlags3
	res 1, [hl]
	ret
; 966e8

DisableStepCount: ; 966e8
	ld hl, ScriptFlags3
	res 0, [hl]
	ret
; 966ee

DisableWildEncounters: ; 966ee
	ld hl, ScriptFlags3
	res 4, [hl]
	ret
; 966f4

EnableWarpsConnxns: ; 966f4
	ld hl, ScriptFlags3
	set 2, [hl]
	ret
; 966fa

EnableCoordEvents: ; 966fa
	ld hl, ScriptFlags3
	set 1, [hl]
	ret
; 96700

EnableStepCount: ; 96700
	ld hl, ScriptFlags3
	set 0, [hl]
	ret
; 96706

EnableWildEncounters: ; 96706
	ld hl, ScriptFlags3
	set 4, [hl]
	ret
; 9670c

CheckWarpConnxnScriptFlag: ; 9670c
	ld hl, ScriptFlags3
	bit 2, [hl]
	ret
; 96712

CheckCoordEventScriptFlag: ; 96712
	ld hl, ScriptFlags3
	bit 1, [hl]
	ret
; 96718

CheckStepCountScriptFlag: ; 96718
	ld hl, ScriptFlags3
	bit 0, [hl]
	ret
; 9671e

CheckWildEncountersScriptFlag: ; 9671e
	ld hl, ScriptFlags3
	bit 4, [hl]
	ret
; 96724

StartMap: ; 96724
	xor a
	ld [ScriptVar], a
	xor a
	ld [ScriptRunning], a
	ld hl, MapStatus
	ld bc, wMapStatusEnd - MapStatus
	call ByteFill
	callba InitCallReceiveDelay
	call ClearJoypad
EnterMap: ; 9673e
	xor a
	ld [wXYComparePointer], a
	ld [wXYComparePointer + 1], a
	call SetUpFiveStepWildEncounterCooldown
	callba RunMapSetupScript
	call DisableEvents

	ld a, [hMapEntryMethod]
	cp MAPSETUP_CONNECTION
	jr nz, .dont_enable
	call EnableEvents
.dont_enable

	ld a, [hMapEntryMethod]
	cp MAPSETUP_RELOADMAP
	jr nz, .dontresetpoison
	xor a
	ld [PoisonStepCount], a
.dontresetpoison

	xor a ; end map entry
	ld [hMapEntryMethod], a
	ld a, 2 ; HandleMap
	ld [MapStatus], a
	ret
; 9676d

UnusedWait30Frames: ; 9676d
	ld c, 30
	call DelayFrames
	ret
; 96773

HandleMap: ; 96773
	call ResetOverworldDelay
	call HandleMapTimeAndJoypad
	callba HandleCmdQueue ; no need to farcall
	call MapEvents

; Not immediately entering a connected map will cause problems.
	ld a, [MapStatus]
	cp 2 ; HandleMap
	ret nz

	call HandleMapObjects
	call NextOverworldFrame
	call HandleMapBackground
	call CheckPlayerState
	ret
; 96795

MapEvents: ; 96795
	ld a, [MapEventStatus]
	ld hl, .jumps
	rst JumpTable
	ret

.jumps
	dw .events
	dw .no_events
; 967a1

.events ; 967a1
	call PlayerEvents
	call DisableEvents
	callba ScriptEvents
	ret
; 967ae

.no_events ; 967ae
	ret
; 967af

MaxOverworldDelay: ; 967af
	db 2
; 967b0

ResetOverworldDelay: ; 967b0
	ld a, [MaxOverworldDelay]
	ld [OverworldDelay], a
	ret
; 967b7

NextOverworldFrame: ; 967b7
	ld a, [OverworldDelay]
	and a
	ret z
	ld c, a
	call DelayFrames
	ret
; 967c1

HandleMapTimeAndJoypad: ; 967c1
	ld a, [MapEventStatus]
	cp 1 ; no events
	ret z

	call UpdateTime
	call GetJoypad
	call TimeOfDayPals
	ret
; 967d1

HandleMapObjects: ; 967d1
	callba HandleNPCStep ; engine/map_objects.asm
	callba _HandlePlayerStep
	call _CheckObjectEnteringVisibleRange
	ret
; 967e1

HandleMapBackground: ; 967e1
	callba _UpdateSprites
	callba ScrollScreen
	callba PlaceMapNameSign
	ret
; 967f4

CheckPlayerState: ; 967f4
	ld a, [wPlayerStepFlags]
	bit 5, a ; in the middle of step
	jr z, .events
	bit 6, a ; stopping step
	jr z, .noevents
	bit 4, a ; in midair
	jr nz, .noevents
	call EnableEvents
.events
	ld a, 0 ; events
	ld [MapEventStatus], a
	ret

.noevents
	ld a, 1 ; no events
	ld [MapEventStatus], a
	ret
; 96812

_CheckObjectEnteringVisibleRange: ; 96812
	ld hl, wPlayerStepFlags
	bit 6, [hl]
	ret z
	callba CheckObjectEnteringVisibleRange
	ret
; 9681f

PlayerEvents: ; 9681f
	xor a
; If there's already a player event, don't interrupt it.
	ld a, [ScriptRunning]
	and a
	ret nz

	call Dummy_CheckScriptFlags3Bit5 ; This is a waste of time

	call CheckTrainerBattle3
	jr c, .ok

	call CheckTileEvent
	jr c, .ok

	call RunMemScript
	jr c, .ok

	call DoMapTrigger
	jr c, .ok

	call CheckTimeEvents
	jr c, .ok

	call OWPlayerInput
	jr c, .ok

	xor a
	ret

.ok
	push af
	callba EnableScriptMode
	pop af

	ld [ScriptRunning], a
	call DoPlayerEvent
	ld a, [ScriptRunning]
	cp PLAYEREVENT_CONNECTION
	jr z, .ok2
	cp PLAYEREVENT_JOYCHANGEFACING
	jr z, .ok2

	xor a
	ld [wLandmarkSignTimer], a

.ok2
	scf
	ret
; 96867

CheckTrainerBattle3: ; 96867
	nop
	nop
	call CheckTrainerBattle2
	jr nc, .nope

	ld a, PLAYEREVENT_SEENBYTRAINER
	scf
	ret

.nope
	xor a
	ret
; 96874

CheckTileEvent: ; 96874
; Check for warps, tile triggers or wild battles.

	call CheckWarpConnxnScriptFlag
	jr z, .connections_disabled

	callba CheckMovingOffEdgeOfMap
	jr c, .map_connection

	call CheckWarpTile
	jr c, .warp_tile

.connections_disabled
	call CheckCoordEventScriptFlag
	jr z, .coord_events_disabled

	call CheckCurrentMapXYTriggers
	jr c, .coord_event

.coord_events_disabled
	call CheckStepCountScriptFlag
	jr z, .step_count_disabled

	call CountStep
	ret c

.step_count_disabled
	call CheckWildEncountersScriptFlag
	jr z, .ok

	call RandomEncounter
	ret c
	jr .ok ; pointless

.ok
	xor a
	ret

.map_connection
	ld a, PLAYEREVENT_CONNECTION
	scf
	ret

.warp_tile
	ld a, [PlayerStandingTile]
	call CheckPitTile
	jr nz, .not_pit
	ld a, PLAYEREVENT_FALL
	scf
	ret

.not_pit
	ld a, PLAYEREVENT_WARP
	scf
	ret

.coord_event
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
	ret
; 968c7

CheckWildEncounterCooldown:: ; 968c7
	ld hl, wWildEncounterCooldown
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret z
	scf
	ret
; 968d1

SetUpFiveStepWildEncounterCooldown: ; 968d1
	ld a, 5
	ld [wWildEncounterCooldown], a
	ret
; 968d7

ret_968d7: ; 968d7
	ret
;968d8

SetMinTwoStepWildEncounterCooldown: ; 968d8
	ld a, [wWildEncounterCooldown]
	cp 2
	ret nc
	ld a, 2
	ld [wWildEncounterCooldown], a
	ret
; 968e4

Dummy_CheckScriptFlags3Bit5: ; 968e4
	call CheckBit5_ScriptFlags3
	ret z
	call ret_2f3e
	ret
; 968ec

DoMapTrigger: ; 968ec
	ld a, [wCurrMapTriggerCount]
	and a
	jr z, .nope

	ld c, a
	call CheckTriggers
	cp c
	jr nc, .nope

	ld e, a
	ld d, 0
	ld hl, wCurrMapTriggerHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	add hl, de
endr

	call GetMapScriptHeaderBank
	call GetFarHalfword
	call GetMapScriptHeaderBank
	call CallScript

	ld hl, ScriptFlags
	res 3, [hl]

	callba EnableScriptMode
	callba ScriptEvents

	ld hl, ScriptFlags
	bit 3, [hl]
	jr z, .nope

	ld hl, wPriorityScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPriorityScriptBank]
	call CallScript
	scf
	ret

.nope
	xor a
	ret
; 9693a

CheckTimeEvents: ; 9693a
	ld a, [wLinkMode]
	and a
	jr nz, .nothing

	ld hl, StatusFlags2
	bit 2, [hl] ; bug contest
	jr z, .do_daily

	callba CheckBugContestTimer
	jr c, .end_bug_contest
	xor a
	ret

.do_daily
	callba CheckDailyResetTimer
	callba CheckPokerusTick
	callba CheckPhoneCall
	ret c

.nothing
	xor a
	ret

.end_bug_contest
	ld a, BANK(BugCatchingContestOverScript)
	ld hl, BugCatchingContestOverScript
	call CallScript
	scf
	ret
; 96970

.unused ; 96970
	ld a, 8
	scf
	ret
; 96974

OWPlayerInput: ; 96974

	call PlayerMovement
	ret c
	and a
	jr nz, .NoAction

; Can't perform button actions while sliding on ice.
	callba CheckStandingOnIce
	jr c, .NoAction

	call CheckAPressOW
	jr c, .Action

	call CheckMenuOW
	jr c, .Action

.NoAction:
	xor a
	ret

.Action:
	push af
	callba StopPlayerForEvent
	pop af
	scf
	ret
; 96999

CheckAPressOW: ; 96999
	ld a, [hJoyPressed]
	and A_BUTTON
	ret z
	call TryObjectEvent
	ret c
	call TryReadSign
	ret c
	call CheckFacingTileEvent
	ret c
	xor a
	ret
; 969ac

PlayTalkObject: ; 969ac
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 969b5

TryObjectEvent: ; 969b5
	callba CheckFacingObject
	jr c, .IsObject
	xor a
	ret

.IsObject:
	call PlayTalkObject
	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a

	ld a, [hLastTalked]
	call GetMapObject
	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ld a, [hl]
	and %00001111

; Bug: If IsInArray returns nc, data at bc will be executed as code.
	push bc
	ld de, 3
	ld hl, .pointers
	call IsInArray
	jr nc, .nope_bugged
	pop bc

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nope_bugged
	; pop bc
	xor a
	ret

.pointers
	dbw PERSONTYPE_SCRIPT, .script
	dbw PERSONTYPE_ITEMBALL, .itemball
	dbw PERSONTYPE_TRAINER, .trainer
	; the remaining four are dummy events
	dbw PERSONTYPE_3, .three
	dbw PERSONTYPE_4, .four
	dbw PERSONTYPE_5, .five
	dbw PERSONTYPE_6, .six
	db -1
; 96a04

.script ; 96a04
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
	ret
; 96a12

.itemball ; 96a12
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 2
	call FarCopyBytes
	ld a, PLAYEREVENT_ITEMBALL
	scf
	ret
; 96a29

.trainer ; 96a29
	call TalkToTrainer
	ld a, PLAYEREVENT_TALKTOTRAINER
	scf
	ret
; 96a30

.three ; 96a30
	xor a
	ret
; 96a32

.four ; 96a32
	xor a
	ret
; 96a34

.five ; 96a34
	xor a
	ret
; 96a36

.six ; 96a36
	xor a
	ret
; 96a38

TryReadSign: ; 96a38
	call CheckFacingSign
	jr c, .IsSign
	xor a
	ret

.IsSign:
	ld a, [EngineBuffer3]
	ld hl, .signs
	rst JumpTable
	ret

.signs
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .copy
; 96a59

.up
	ld b, OW_UP
	jr .checkdir
.down
	ld b, OW_DOWN
	jr .checkdir
.right
	ld b, OW_RIGHT
	jr .checkdir
.left
	ld b, OW_LEFT
	jr .checkdir

.checkdir
	ld a, [PlayerDirection]
	and %1100
	cp b
	jp nz, .dontread

.read
	call PlayTalkObject
	ld hl, EngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
	scf
	ret

.itemifset
	call CheckSignFlag
	jp nz, .dontread
	call PlayTalkObject
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 3
	call FarCopyBytes
	ld a, BANK(HiddenItemScript)
	ld hl, HiddenItemScript
	call CallScript
	scf
	ret

.copy
	call CheckSignFlag
	jr nz, .dontread
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 3
	call FarCopyBytes
	jr .dontread

.ifset
	call CheckSignFlag
	jr z, .dontread
	jr .thenread

.ifnotset
	call CheckSignFlag
	jr nz, .dontread

.thenread
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptHeaderBank
	call GetFarHalfword
	call GetMapScriptHeaderBank
	call CallScript
	scf
	ret

.dontread
	xor a
	ret
; 96ad8

CheckSignFlag: ; 96ad8
	ld hl, EngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptHeaderBank
	call GetFarHalfword
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	ret
; 96af0

PlayerMovement: ; 96af0
	callba DoPlayerMovement
	ld a, c
	ld hl, .pointers
	rst JumpTable
	ld a, c
	ret
; 96afd

.pointers
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven

.zero
.four ; 96b0d
	xor a
	ld c, a
	ret
; 96b10

.seven ; 96b10
	call ret_968d7 ; mobile
	xor a
	ld c, a
	ret
; 96b16

.one ; 96b16
	ld a, 5
	ld c, a
	scf
	ret
; 96b1b

.two ; 96b1b
	ld a, 9
	ld c, a
	scf
	ret
; 96b20

.three ; 96b20
; force the player to move in some direction
	ld a, BANK(Script_ForcedMovement)
	ld hl, Script_ForcedMovement
	call CallScript
;	ld a, -1
	ld c, a
	scf
	ret
; 96b2b

.five
.six ; 96b2b
	ld a, -1
	ld c, a
	and a
	ret
; 96b30

CheckMenuOW: ; 96b30
	xor a
	ld [hMenuReturn], a
	ld [hMenuReturn + 1], a
	ld a, [hJoyPressed]

	bit 2, a ; SELECT
	jr nz, .Select

	bit 3, a ; START
	jr z, .NoMenu

	ld a, BANK(StartMenuScript)
	ld hl, StartMenuScript
	call CallScript
	scf
	ret

.NoMenu:
	xor a
	ret

.Select:
	call PlayTalkObject
	ld a, BANK(SelectMenuScript)
	ld hl, SelectMenuScript
	call CallScript
	scf
	ret
; 96b58

StartMenuScript: ; 96b58
	callasm StartMenu
	jump StartMenuCallback
; 96b5f

SelectMenuScript: ; 96b5f
	callasm SelectMenu
	jump SelectMenuCallback
; 96b66

StartMenuCallback:
SelectMenuCallback: ; 96b66
	copybytetovar hMenuReturn
	if_equal HMENURETURN_SCRIPT, .Script
	if_equal HMENURETURN_ASM, .Asm
	end
; 96b72

.Script: ; 96b72
	ptjump wQueuedScriptBank
; 96b75

.Asm: ; 96b75
	ptcallasm wQueuedScriptBank
	end
; 96b79

CountStep: ; 96b79
	; Don't count steps in link communication rooms.
	ld a, [wLinkMode]
	and a
	jr nz, .done

	; If there is a special phone call, don't count the step.
	callba CheckSpecialPhoneCall
	jr c, .doscript

	; If Repel wore off, don't count the step.
	call DoRepelStep
	jr c, .doscript

	; Count the step for poison and total steps
	ld hl, PoisonStepCount
	inc [hl]
	ld hl, StepCount
	inc [hl]
	; Every 256 steps, increase the happiness of all your Pokemon.
	jr nz, .skip_happiness

	callba StepHappiness

.skip_happiness
	; Every 256 steps, offset from the happiness incrementor by 128 steps,
	; decrease the hatch counter of all your eggs until you reach the first
	; one that is ready to hatch.
	ld a, [StepCount]
	cp $80
	jr nz, .skip_egg

	callba DoEggStep
	jr nz, .hatch

.skip_egg
	; Increase the EXP of (both) DayCare Pokemon by 1.
	callba DaycareStep

	; Every four steps, deal damage to all Poisoned Pokemon
	ld hl, PoisonStepCount
	ld a, [hl]
	cp 4
	jr c, .skip_poison
	ld [hl], 0

	callba DoPoisonStep
	jr c, .doscript

.skip_poison
	callba DoBikeStep

.done
	xor a
	ret

.doscript
	ld a, -1
	scf
	ret

.hatch
	ld a, 8
	scf
	ret
; 96bd3

.unreferenced ; 96bd3
	ld a, 7
	scf
	ret
; 96bd7

DoRepelStep: ; 96bd7
	ld a, [wRepelEffect]
	and a
	ret z

	dec a
	ld [wRepelEffect], a
	ret nz

	ld a, BANK(RepelWoreOffScript)
	ld hl, RepelWoreOffScript
	call CallScript
	scf
	ret
; 96beb

DoPlayerEvent: ; 96beb
	ld a, [ScriptRunning]
	and a
	ret z

	cp PLAYEREVENT_MAPSCRIPT ; run script
	ret z

	cp NUM_PLAYER_EVENTS
	ret nc

	ld c, a
	ld b, 0
	ld hl, PlayerEventScriptPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [ScriptBank], a
	ld a, [hli]
	ld [ScriptPos], a
	ld a, [hl]
	ld [ScriptPos + 1], a
	ret
; 96c0c

PlayerEventScriptPointers: ; 96c0c
	dba Invalid_0x96c2d          ; 0
	dba SeenByTrainerScript      ; 1
	dba TalkToTrainerScript      ; 2
	dba FindItemInBallScript     ; 3
	dba EdgeWarpScript           ; 4
	dba WarpToNewMapScript       ; 5
	dba FallIntoMapScript        ; 6
	dba Script_OverworldWhiteout ; 7
	dba HatchEggScript           ; 8
	dba ChangeDirectionScript    ; 9
	dba Invalid_0x96c2d          ; 10
; 96c2d

Invalid_0x96c2d: ; 96c2d
	end
; 96c2e

; unreferenced
	end
; 96c2f

HatchEggScript: ; 96c2f
	callasm OverworldHatchEgg
	end
; 96c34

WarpToNewMapScript: ; 96c34
	warpsound
	newloadmap MAPSETUP_DOOR
	end
; 96c38

FallIntoMapScript: ; 96c38
	newloadmap MAPSETUP_FALL
	playsound SFX_KINESIS
	applymovement PLAYER, MovementData_0x96c48
	playsound SFX_STRENGTH
	scall LandAfterPitfallScript
	end
; 96c48

MovementData_0x96c48: ; 96c48
	skyfall
	step_end
; 96c4a

LandAfterPitfallScript: ; 96c4a
	earthquake 16
	end
; 96c4d

EdgeWarpScript: ; 4
	reloadandreturn MAPSETUP_CONNECTION
; 96c4f

ChangeDirectionScript: ; 9
	deactivatefacing 3
	callasm EnableWildEncounters
	end
; 96c56

INCLUDE "engine/scripting.asm"
INCLUDE "engine/events_2.asm"
