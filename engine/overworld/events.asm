INCLUDE "constants.asm"


SECTION "Events", ROMX

OverworldLoop::
	xor a
	ld [wMapStatus], a
.loop
	ld a, [wMapStatus]
	ld hl, .jumps
	rst JumpTable
	ld a, [wMapStatus]
	cp 3 ; done
	jr nz, .loop
.done
	ret

.jumps
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done

DisableEvents:
	xor a
	ld [wScriptFlags3], a
	ret

EnableEvents::
	ld a, $ff
	ld [wScriptFlags3], a
	ret

CheckBit5_ScriptFlags3:
	ld hl, wScriptFlags3
	bit 5, [hl]
	ret

DisableWarpsConnxns:
	ld hl, wScriptFlags3
	res 2, [hl]
	ret

DisableCoordEvents:
	ld hl, wScriptFlags3
	res 1, [hl]
	ret

DisableStepCount:
	ld hl, wScriptFlags3
	res 0, [hl]
	ret

DisableWildEncounters:
	ld hl, wScriptFlags3
	res 4, [hl]
	ret

EnableWarpsConnxns:
	ld hl, wScriptFlags3
	set 2, [hl]
	ret

EnableCoordEvents:
	ld hl, wScriptFlags3
	set 1, [hl]
	ret

EnableStepCount:
	ld hl, wScriptFlags3
	set 0, [hl]
	ret

EnableWildEncounters:
	ld hl, wScriptFlags3
	set 4, [hl]
	ret

CheckWarpConnxnScriptFlag:
	ld hl, wScriptFlags3
	bit 2, [hl]
	ret

CheckCoordEventScriptFlag:
	ld hl, wScriptFlags3
	bit 1, [hl]
	ret

CheckStepCountScriptFlag:
	ld hl, wScriptFlags3
	bit 0, [hl]
	ret

CheckWildEncountersScriptFlag:
	ld hl, wScriptFlags3
	bit 4, [hl]
	ret

StartMap:
	xor a
	ld [wScriptVar], a
	xor a
	ld [wScriptRunning], a
	ld hl, wMapStatus
	ld bc, wMapStatusEnd - wMapStatus
	call ByteFill
	farcall InitCallReceiveDelay
	call ClearJoypad
EnterMap:
	xor a
	ld [wXYComparePointer], a
	ld [wXYComparePointer + 1], a
	call SetUpFiveStepWildEncounterCooldown
	farcall RunMapSetupScript
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
	ld [wPoisonStepCount], a
.dontresetpoison

	xor a ; end map entry
	ld [hMapEntryMethod], a
	ld a, 2 ; HandleMap
	ld [wMapStatus], a
	ret

UnusedWait30Frames:
	ld c, 30
	call DelayFrames
	ret

HandleMap:
	call ResetOverworldDelay
	call HandleMapTimeAndJoypad
	farcall HandleCmdQueue ; no need to farcall
	call MapEvents

; Not immediately entering a connected map will cause problems.
	ld a, [wMapStatus]
	cp 2 ; HandleMap
	ret nz

	call HandleMapObjects
	call NextOverworldFrame
	call HandleMapBackground
	call CheckPlayerState
	ret

MapEvents:
	ld a, [wMapEventStatus]
	ld hl, .jumps
	rst JumpTable
	ret

.jumps
	dw .events
	dw .no_events

.events
	call PlayerEvents
	call DisableEvents
	farcall ScriptEvents
	ret

.no_events
	ret

MaxOverworldDelay:
	db 2

ResetOverworldDelay:
	ld a, [MaxOverworldDelay]
	ld [wOverworldDelay], a
	ret

NextOverworldFrame:
	ld a, [wOverworldDelay]
	and a
	ret z
	ld c, a
	call DelayFrames
	ret

HandleMapTimeAndJoypad:
	ld a, [wMapEventStatus]
	cp 1 ; no events
	ret z

	call UpdateTime
	call GetJoypad
	call TimeOfDayPals
	ret

HandleMapObjects:
	farcall HandleNPCStep ; engine/map_objects.asm
	farcall _HandlePlayerStep
	call _CheckObjectEnteringVisibleRange
	ret

HandleMapBackground:
	farcall _UpdateSprites
	farcall ScrollScreen
	farcall PlaceMapNameSign
	ret

CheckPlayerState:
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
	ld [wMapEventStatus], a
	ret

.noevents
	ld a, 1 ; no events
	ld [wMapEventStatus], a
	ret

_CheckObjectEnteringVisibleRange:
	ld hl, wPlayerStepFlags
	bit 6, [hl]
	ret z
	farcall CheckObjectEnteringVisibleRange
	ret

PlayerEvents:
	xor a
; If there's already a player event, don't interrupt it.
	ld a, [wScriptRunning]
	and a
	ret nz

	call Dummy_CheckScriptFlags3Bit5 ; This is a waste of time

	call CheckTrainerBattle3
	jr c, .ok

	call CheckTileEvent
	jr c, .ok

	call RunMemScript
	jr c, .ok

	call RunSceneScript
	jr c, .ok

	call CheckTimeEvents
	jr c, .ok

	call OWPlayerInput
	jr c, .ok

	xor a
	ret

.ok
	push af
	farcall EnableScriptMode
	pop af

	ld [wScriptRunning], a
	call DoPlayerEvent
	ld a, [wScriptRunning]
	cp PLAYEREVENT_CONNECTION
	jr z, .ok2
	cp PLAYEREVENT_JOYCHANGEFACING
	jr z, .ok2

	xor a
	ld [wLandmarkSignTimer], a

.ok2
	scf
	ret

CheckTrainerBattle3:
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

CheckTileEvent:
; Check for warps, coord events, or wild battles.

	call CheckWarpConnxnScriptFlag
	jr z, .connections_disabled

	farcall CheckMovingOffEdgeOfMap
	jr c, .map_connection

	call CheckWarpTile
	jr c, .warp_tile

.connections_disabled
	call CheckCoordEventScriptFlag
	jr z, .coord_events_disabled

	call CheckCurrentMapCoordEvents
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
	ld a, [wPlayerStandingTile]
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
	call GetMapScriptsBank
	call CallScript
	ret

CheckWildEncounterCooldown::
	ld hl, wWildEncounterCooldown
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret z
	scf
	ret

SetUpFiveStepWildEncounterCooldown:
	ld a, 5
	ld [wWildEncounterCooldown], a
	ret

ret_968d7:
	ret

SetMinTwoStepWildEncounterCooldown:
	ld a, [wWildEncounterCooldown]
	cp 2
	ret nc
	ld a, 2
	ld [wWildEncounterCooldown], a
	ret

Dummy_CheckScriptFlags3Bit5:
	call CheckBit5_ScriptFlags3
	ret z
	call ret_2f3e
	ret

RunSceneScript:
	ld a, [wCurrMapSceneScriptCount]
	and a
	jr z, .nope

	ld c, a
	call CheckScenes
	cp c
	jr nc, .nope

	ld e, a
	ld d, 0
	ld hl, wCurrMapSceneScriptsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	add hl, de
endr

	call GetMapScriptsBank
	call GetFarHalfword
	call GetMapScriptsBank
	call CallScript

	ld hl, wScriptFlags
	res 3, [hl]

	farcall EnableScriptMode
	farcall ScriptEvents

	ld hl, wScriptFlags
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

CheckTimeEvents:
	ld a, [wLinkMode]
	and a
	jr nz, .nothing

	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr z, .do_daily

	farcall CheckBugContestTimer
	jr c, .end_bug_contest
	xor a
	ret

.do_daily
	farcall CheckDailyResetTimer
	farcall CheckPokerusTick
	farcall CheckPhoneCall
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

.unused
	ld a, 8
	scf
	ret

OWPlayerInput:

	call PlayerMovement
	ret c
	and a
	jr nz, .NoAction

; Can't perform button actions while sliding on ice.
	farcall CheckStandingOnIce
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
	farcall StopPlayerForEvent
	pop af
	scf
	ret

CheckAPressOW:
	ld a, [hJoyPressed]
	and A_BUTTON
	ret z
	call TryObjectEvent
	ret c
	call TryBGEvent
	ret c
	call TryTileCollisionEvent
	ret c
	xor a
	ret

PlayTalkObject:
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

TryObjectEvent:
	farcall CheckFacingObject
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
	dbw OBJECTTYPE_SCRIPT, .script
	dbw OBJECTTYPE_ITEMBALL, .itemball
	dbw OBJECTTYPE_TRAINER, .trainer
	; the remaining four are dummy events
	dbw OBJECTTYPE_3, .three
	dbw OBJECTTYPE_4, .four
	dbw OBJECTTYPE_5, .five
	dbw OBJECTTYPE_6, .six
	db -1

.script
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	ret

.itemball
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 2
	call FarCopyBytes
	ld a, PLAYEREVENT_ITEMBALL
	scf
	ret

.trainer
	call TalkToTrainer
	ld a, PLAYEREVENT_TALKTOTRAINER
	scf
	ret

.three
	xor a
	ret

.four
	xor a
	ret

.five
	xor a
	ret

.six
	xor a
	ret

TryBGEvent:
	call CheckFacingBGEvent
	jr c, .is_bg_event
	xor a
	ret

.is_bg_event:
	ld a, [wEngineBuffer3]
	ld hl, .bg_events
	rst JumpTable
	ret

.bg_events
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .copy

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
	ld a, [wPlayerDirection]
	and %1100
	cp b
	jp nz, .dontread

.read
	call PlayTalkObject
	ld hl, wEngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.itemifset
	call CheckBGEventFlag
	jp nz, .dontread
	call PlayTalkObject
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 3
	call FarCopyBytes
	ld a, BANK(HiddenItemScript)
	ld hl, HiddenItemScript
	call CallScript
	scf
	ret

.copy
	call CheckBGEventFlag
	jr nz, .dontread
	call GetMapScriptsBank
	ld de, wEngineBuffer1
	ld bc, 3
	call FarCopyBytes
	jr .dontread

.ifset
	call CheckBGEventFlag
	jr z, .dontread
	jr .thenread

.ifnotset
	call CheckBGEventFlag
	jr nz, .dontread

.thenread
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptsBank
	call GetFarHalfword
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.dontread
	xor a
	ret

CheckBGEventFlag:
	ld hl, wEngineBuffer4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptsBank
	call GetFarHalfword
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	ret

PlayerMovement:
	farcall DoPlayerMovement
	ld a, c
	ld hl, .pointers
	rst JumpTable
	ld a, c
	ret

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
.four
	xor a
	ld c, a
	ret

.seven
	call ret_968d7 ; mobile
	xor a
	ld c, a
	ret

.one
	ld a, 5
	ld c, a
	scf
	ret

.two
	ld a, 9
	ld c, a
	scf
	ret

.three
; force the player to move in some direction
	ld a, BANK(Script_ForcedMovement)
	ld hl, Script_ForcedMovement
	call CallScript
;	ld a, -1
	ld c, a
	scf
	ret

.five
.six
	ld a, -1
	ld c, a
	and a
	ret

CheckMenuOW:
	xor a
	ld [hMenuReturn], a
	ld [hMenuReturn + 1], a
	ld a, [hJoyPressed]

	bit SELECT_F, a
	jr nz, .Select

	bit START_F, a
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

StartMenuScript:
	callasm StartMenu
	jump StartMenuCallback

SelectMenuScript:
	callasm SelectMenu
	jump SelectMenuCallback

StartMenuCallback:
SelectMenuCallback:
	copybytetovar hMenuReturn
	ifequal HMENURETURN_SCRIPT, .Script
	ifequal HMENURETURN_ASM, .Asm
	end

.Script:
	ptjump wQueuedScriptBank

.Asm:
	ptcallasm wQueuedScriptBank
	end

CountStep:
	; Don't count steps in link communication rooms.
	ld a, [wLinkMode]
	and a
	jr nz, .done

	; If there is a special phone call, don't count the step.
	farcall CheckSpecialPhoneCall
	jr c, .doscript

	; If Repel wore off, don't count the step.
	call DoRepelStep
	jr c, .doscript

	; Count the step for poison and total steps
	ld hl, wPoisonStepCount
	inc [hl]
	ld hl, wStepCount
	inc [hl]
	; Every 256 steps, increase the happiness of all your Pokemon.
	jr nz, .skip_happiness

	farcall StepHappiness

.skip_happiness
	; Every 256 steps, offset from the happiness incrementor by 128 steps,
	; decrease the hatch counter of all your eggs until you reach the first
	; one that is ready to hatch.
	ld a, [wStepCount]
	cp $80
	jr nz, .skip_egg

	farcall DoEggStep
	jr nz, .hatch

.skip_egg
	; Increase the EXP of (both) DayCare Pokemon by 1.
	farcall DayCareStep

	; Every four steps, deal damage to all Poisoned Pokemon
	ld hl, wPoisonStepCount
	ld a, [hl]
	cp 4
	jr c, .skip_poison
	ld [hl], 0

	farcall DoPoisonStep
	jr c, .doscript

.skip_poison
	farcall DoBikeStep

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

; unused
.unreferenced
	ld a, 7
	scf
	ret

DoRepelStep:
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

DoPlayerEvent:
	ld a, [wScriptRunning]
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
	ld [wScriptBank], a
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hl]
	ld [wScriptPos + 1], a
	ret

PlayerEventScriptPointers:
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

Invalid_0x96c2d:
	end

; unused
	end

HatchEggScript:
	callasm OverworldHatchEgg
	end

WarpToNewMapScript:
	warpsound
	newloadmap MAPSETUP_DOOR
	end

FallIntoMapScript:
	newloadmap MAPSETUP_FALL
	playsound SFX_KINESIS
	applymovement PLAYER, MovementData_0x96c48
	playsound SFX_STRENGTH
	scall LandAfterPitfallScript
	end

MovementData_0x96c48:
	skyfall
	step_end

LandAfterPitfallScript:
	earthquake 16
	end

EdgeWarpScript: ; 4
	reloadandreturn MAPSETUP_CONNECTION

ChangeDirectionScript: ; 9
	deactivatefacing 3
	callasm EnableWildEncounters
	end

INCLUDE "engine/overworld/scripting.asm"

INCLUDE "engine/overworld/events_2.asm"
