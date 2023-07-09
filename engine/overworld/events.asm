SECTION "Events", ROMX

OverworldLoop::
	xor a ; MAPSTATUS_START
	ld [wMapStatus], a
.loop
	ld a, [wMapStatus]
	ld hl, .Jumptable
	rst JumpTable
	ld a, [wMapStatus]
	cp MAPSTATUS_DONE
	jr nz, .loop
.done
	ret

.Jumptable:
; entries correspond to MAPSTATUS_* constants
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done

DisableEvents:
	xor a
	ld [wScriptFlags2], a
	ret

EnableEvents::
	ld a, $ff
	ld [wScriptFlags2], a
	ret

CheckBit5_ScriptFlags2:
	ld hl, wScriptFlags2
	bit 5, [hl]
	ret

DisableWarpsConnxns: ; unreferenced
	ld hl, wScriptFlags2
	res 2, [hl]
	ret

DisableCoordEvents: ; unreferenced
	ld hl, wScriptFlags2
	res 1, [hl]
	ret

DisableStepCount: ; unreferenced
	ld hl, wScriptFlags2
	res 0, [hl]
	ret

DisableWildEncounters: ; unreferenced
	ld hl, wScriptFlags2
	res 4, [hl]
	ret

EnableWarpsConnxns: ; unreferenced
	ld hl, wScriptFlags2
	set 2, [hl]
	ret

EnableCoordEvents: ; unreferenced
	ld hl, wScriptFlags2
	set 1, [hl]
	ret

EnableStepCount: ; unreferenced
	ld hl, wScriptFlags2
	set 0, [hl]
	ret

EnableWildEncounters:
	ld hl, wScriptFlags2
	set 4, [hl]
	ret

CheckWarpConnxnScriptFlag:
	ld hl, wScriptFlags2
	bit 2, [hl]
	ret

CheckCoordEventScriptFlag:
	ld hl, wScriptFlags2
	bit 1, [hl]
	ret

CheckStepCountScriptFlag:
	ld hl, wScriptFlags2
	bit 0, [hl]
	ret

CheckWildEncountersScriptFlag:
	ld hl, wScriptFlags2
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

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_CONNECTION
	jr nz, .dont_enable
	call EnableEvents
.dont_enable

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_RELOADMAP
	jr nz, .dontresetpoison
	xor a
	ld [wPoisonStepCount], a
.dontresetpoison

	xor a ; end map entry
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_HANDLE
	ld [wMapStatus], a
	ret

UnusedWait30Frames: ; unreferenced
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
	cp MAPSTATUS_HANDLE
	ret nz

	call HandleMapObjects
	call NextOverworldFrame
	call HandleMapBackground
	call CheckPlayerState
	ret

MapEvents:
	ld a, [wMapEventStatus]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
; entries correspond to MAPEVENTS_* constants
	dw .events
	dw .no_events

.events:
	call PlayerEvents
	call DisableEvents
	farcall ScriptEvents
	ret

.no_events:
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
	cp MAPEVENTS_OFF
	ret z

	call UpdateTime
	call GetJoypad
	call TimeOfDayPals
	ret

HandleMapObjects:
	farcall HandleNPCStep
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
	bit PLAYERSTEP_CONTINUE_F, a
	jr z, .events
	bit PLAYERSTEP_STOP_F, a
	jr z, .noevents
	bit PLAYERSTEP_MIDAIR_F, a
	jr nz, .noevents
	call EnableEvents
.events
	ld a, MAPEVENTS_ON
	ld [wMapEventStatus], a
	ret

.noevents
	ld a, MAPEVENTS_OFF
	ld [wMapEventStatus], a
	ret

_CheckObjectEnteringVisibleRange:
	ld hl, wPlayerStepFlags
	bit PLAYERSTEP_STOP_F, [hl]
	ret z
	farcall CheckObjectEnteringVisibleRange
	ret

PlayerEvents:
	xor a
; If there's already a player event, don't interrupt it.
	ld a, [wScriptRunning]
	and a
	ret nz

	call Dummy_CheckScriptFlags2Bit5 ; This is a waste of time

	call CheckTrainerBattle_GetPlayerEvent
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

CheckTrainerBattle_GetPlayerEvent:
	nop
	nop
	call CheckTrainerBattle
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
	ld a, [wPlayerTile]
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

SetMinTwoStepWildEncounterCooldown:
; dummied out
	ret
	ld a, [wWildEncounterCooldown]
	cp 2
	ret nc
	ld a, 2
	ld [wWildEncounterCooldown], a
	ret

Dummy_CheckScriptFlags2Bit5:
	call CheckBit5_ScriptFlags2
	ret z
	call SetXYCompareFlags
	ret

RunSceneScript:
	ld a, [wCurMapSceneScriptCount]
	and a
	jr z, .nope

	ld c, a
	call CheckScenes
	cp c
	jr nc, .nope

	ld e, a
	ld d, 0
	ld hl, wCurMapSceneScriptsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept SCENE_SCRIPT_SIZE
	add hl, de
endr

	call GetMapScriptsBank
	call GetFarWord
	call GetMapScriptsBank
	call CallScript

	ld hl, wScriptFlags
	res 3, [hl]

	farcall EnableScriptMode
	farcall ScriptEvents

	ld hl, wScriptFlags
	bit 3, [hl]
	jr z, .nope

	ld hl, wDeferredScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wDeferredScriptBank]
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

.unused ; unreferenced
	ld a, $8 ; ???
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
	ldh a, [hJoyPressed]
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
	ldh a, [hObjectStructIndex]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a

	ldh a, [hLastTalked]
	call GetMapObject
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]
	and MAPOBJECT_TYPE_MASK

	push bc
	ld de, 3
	ld hl, ObjectEventTypeArray
	call IsInArray
	pop bc
	jr nc, .nope

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nope
	xor a
	ret

ObjectEventTypeArray:
	table_width 3, ObjectEventTypeArray
	dbw OBJECTTYPE_SCRIPT, .script
	dbw OBJECTTYPE_ITEMBALL, .itemball
	dbw OBJECTTYPE_TRAINER, .trainer
	; the remaining four are dummy events
	dbw OBJECTTYPE_3, .three
	dbw OBJECTTYPE_4, .four
	dbw OBJECTTYPE_5, .five
	dbw OBJECTTYPE_6, .six
	assert_table_length NUM_OBJECT_TYPES
	db -1 ; end

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
	ld de, wItemBallData
	ld bc, wItemBallDataEnd - wItemBallData
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
	ld a, [wCurBGEventType]
	ld hl, BGEventJumptable
	rst JumpTable
	ret

BGEventJumptable:
	table_width 2, BGEventJumptable
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .copy
	assert_table_length NUM_BGEVENTS

.up:
	ld b, OW_UP
	jr .checkdir

.down:
	ld b, OW_DOWN
	jr .checkdir

.right:
	ld b, OW_RIGHT
	jr .checkdir

.left:
	ld b, OW_LEFT
	jr .checkdir

.checkdir:
	ld a, [wPlayerDirection]
	and %1100
	cp b
	jp nz, .dontread
.read:
	call PlayTalkObject
	ld hl, wCurBGEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.itemifset:
	call CheckBGEventFlag
	jp nz, .dontread
	call PlayTalkObject
	call GetMapScriptsBank
	ld de, wHiddenItemData
	ld bc, wHiddenItemDataEnd - wHiddenItemData
	call FarCopyBytes
	ld a, BANK(HiddenItemScript)
	ld hl, HiddenItemScript
	call CallScript
	scf
	ret

.copy:
	call CheckBGEventFlag
	jr nz, .dontread
	call GetMapScriptsBank
	ld de, wHiddenItemData
	ld bc, wHiddenItemDataEnd - wHiddenItemData
	call FarCopyBytes
	jr .dontread

.ifset:
	call CheckBGEventFlag
	jr z, .dontread
	jr .thenread

.ifnotset:
	call CheckBGEventFlag
	jr nz, .dontread
.thenread:
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptsBank
	call GetFarWord
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.dontread:
	xor a
	ret

CheckBGEventFlag:
	ld hl, wCurBGEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptsBank
	call GetFarWord
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
	ld hl, PlayerMovementPointers
	rst JumpTable
	ld a, c
	ret

PlayerMovementPointers:
; entries correspond to PLAYERMOVEMENT_* constants
	table_width 2, PlayerMovementPointers
	dw .normal
	dw .warp
	dw .turn
	dw .force_turn
	dw .finish
	dw .continue
	dw .exit_water
	dw .jump
	assert_table_length NUM_PLAYER_MOVEMENTS

.normal:
.finish:
	xor a
	ld c, a
	ret

.jump:
	call SetMinTwoStepWildEncounterCooldown
	xor a
	ld c, a
	ret

.warp:
	ld a, PLAYEREVENT_WARP
	ld c, a
	scf
	ret

.turn:
	ld a, PLAYEREVENT_JOYCHANGEFACING
	ld c, a
	scf
	ret

.force_turn:
; force the player to move in some direction
	ld a, BANK(Script_ForcedMovement)
	ld hl, Script_ForcedMovement
	call CallScript
	ld c, a
	scf
	ret

.continue:
.exit_water:
	ld a, -1
	ld c, a
	and a
	ret

CheckMenuOW:
	xor a
	ldh [hMenuReturn], a
	ldh [hUnusedByte], a
	ldh a, [hJoyPressed]

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
	sjump StartMenuCallback

SelectMenuScript:
	callasm SelectMenu
	sjump SelectMenuCallback

StartMenuCallback:
SelectMenuCallback:
	readmem hMenuReturn
	ifequal HMENURETURN_SCRIPT, .Script
	ifequal HMENURETURN_ASM, .Asm
	end

.Script:
	memjump wQueuedScriptBank

.Asm:
	memcallasm wQueuedScriptBank
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

	; Every 4 steps, deal damage to all poisoned Pokemon.
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
	ld a, PLAYEREVENT_HATCH
	scf
	ret

.whiteout ; unreferenced
	ld a, PLAYEREVENT_WHITEOUT
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
; entries correspond to PLAYEREVENT_* constants
	table_width 3, PlayerEventScriptPointers
	dba InvalidEventScript      ; PLAYEREVENT_NONE
	dba SeenByTrainerScript     ; PLAYEREVENT_SEENBYTRAINER
	dba TalkToTrainerScript     ; PLAYEREVENT_TALKTOTRAINER
	dba FindItemInBallScript    ; PLAYEREVENT_ITEMBALL
	dba EdgeWarpScript          ; PLAYEREVENT_CONNECTION
	dba WarpToNewMapScript      ; PLAYEREVENT_WARP
	dba FallIntoMapScript       ; PLAYEREVENT_FALL
	dba OverworldWhiteoutScript ; PLAYEREVENT_WHITEOUT
	dba HatchEggScript          ; PLAYEREVENT_HATCH
	dba ChangeDirectionScript   ; PLAYEREVENT_JOYCHANGEFACING
	dba InvalidEventScript      ; (NUM_PLAYER_EVENTS)
	assert_table_length NUM_PLAYER_EVENTS + 1

InvalidEventScript:
	end

UnusedPlayerEventScript: ; unreferenced
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
	applymovement PLAYER, .SkyfallMovement
	playsound SFX_STRENGTH
	scall LandAfterPitfallScript
	end

.SkyfallMovement:
	skyfall
	step_end

LandAfterPitfallScript:
	earthquake 16
	end

EdgeWarpScript:
	reloadend MAPSETUP_CONNECTION

ChangeDirectionScript:
	deactivatefacing 3
	callasm EnableWildEncounters
	end

INCLUDE "engine/overworld/scripting.asm"

WarpToSpawnPoint::
	ld hl, wStatusFlags2
	res STATUSFLAGS2_SAFARI_GAME_F, [hl]
	res STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ret

RunMemScript::
; If there is no script here, we don't need to be here.
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret z
; Execute the script at (wMapReentryScriptBank):(wMapReentryScriptAddress).
	ld hl, wMapReentryScriptAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapReentryScriptBank]
	call CallScript
	scf
; Clear the buffer for the next script.
	push af
	xor a
	ld hl, wMapReentryScriptQueueFlag
	ld bc, 8
	call ByteFill
	pop af
	ret

LoadScriptBDE::
; If there's already a script here, don't overwrite.
	ld hl, wMapReentryScriptQueueFlag
	ld a, [hl]
	and a
	ret nz
; Set the flag
	ld [hl], 1
	inc hl
; Load the script pointer b:de into (wMapReentryScriptBank):(wMapReentryScriptAddress)
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

TryTileCollisionEvent::
	call GetFacingTileCoord
	ld [wFacingTileID], a
	ld c, a
	; CheckFacingTileForStdScript preserves c, and
	; farcall copies c back into a.
	farcall CheckFacingTileForStdScript
	jr c, .done

	; CheckCutTreeTile expects a == [wFacingTileID], which
	; it still is after the previous farcall.
	call CheckCutTreeTile
	jr nz, .whirlpool
	farcall TryCutOW
	jr .done

.whirlpool
	ld a, [wFacingTileID]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	farcall TryWhirlpoolOW
	jr .done

.waterfall
	ld a, [wFacingTileID]
	call CheckWaterfallTile
	jr nz, .headbutt
	farcall TryWaterfallOW
	jr .done

.headbutt
	ld a, [wFacingTileID]
	call CheckHeadbuttTreeTile
	jr nz, .surf
	farcall TryHeadbuttOW
	jr c, .done
	jr .noevent

.surf
	farcall TrySurfOW
	jr nc, .noevent
	jr .done

.noevent
	xor a
	ret

.done
	call PlayClickSFX
	ld a, $ff
	scf
	ret

RandomEncounter::
; Random encounter

	call CheckWildEncounterCooldown
	jr c, .nope
	call CanUseSweetScent
	jr nc, .nope
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .bug_contest
	farcall TryWildEncounter
	jr nz, .nope
	jr .ok

.bug_contest
	call _TryWildEncounter_BugContest
	jr nc, .nope
	jr .ok_bug_contest

.nope
	ld a, 1
	and a
	ret

.ok
	ld a, BANK(WildBattleScript)
	ld hl, WildBattleScript
	jr .done

.ok_bug_contest
	ld a, BANK(BugCatchingContestBattleScript)
	ld hl, BugCatchingContestBattleScript
	jr .done

.done
	call CallScript
	scf
	ret

WildBattleScript:
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

CanUseSweetScent::
	ld hl, wStatusFlags
	bit STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	jr nz, .no
	ld a, [wEnvironment]
	cp CAVE
	jr z, .ice_check
	cp DUNGEON
	jr z, .ice_check
	farcall CheckGrassCollision
	jr nc, .no

.ice_check
	ld a, [wPlayerTile]
	call CheckIceTile
	jr z, .no
	scf
	ret

.no
	and a
	ret

_TryWildEncounter_BugContest:
	call TryWildEncounter_BugContest
	ret nc
	call ChooseWildEncounter_BugContest
	farcall CheckRepelEffect
	ret

ChooseWildEncounter_BugContest::
; Pick a random mon out of ContestMons.

.loop
	call Random
	cp 100 << 1
	jr nc, .loop
	srl a

	ld hl, ContestMons
	ld de, 4
.CheckMon:
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon:
	inc hl

; Species
	ld a, [hli]
	ld [wTempWildMonSpecies], a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel:
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ldh a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel:
	ld [wCurPartyLevel], a

	xor a
	ret

TryWildEncounter_BugContest:
	ld a, [wPlayerTile]
	call CheckSuperTallGrassTile
	ld b, 40 percent
	jr z, .ok
	ld b, 20 percent

.ok
	farcall ApplyMusicEffectOnEncounterRate
	farcall ApplyCleanseTagEffectOnEncounterRate
	call Random
	ldh a, [hRandomAdd]
	cp b
	ret c
	ld a, 1
	and a
	ret

INCLUDE "data/wild/bug_contest_mons.asm"

DoBikeStep::
	nop
	nop
	; If the bike shop owner doesn't have our number, or
	; if we've already gotten the call, we don't have to
	; be here.
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BIKE_SHOP_CALL_F, [hl]
	jr z, .NoCall

	; If we're not on the bike, we don't have to be here.
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .NoCall

	; If we're not in an area of phone service, we don't
	; have to be here.
	call GetMapPhoneService
	and a
	jr nz, .NoCall

	; Check the bike step count and check whether we've
	; taken 65536 of them yet.
	ld hl, wBikeStep
	ld a, [hli]
	ld d, a
	ld e, [hl]
	cp 255
	jr nz, .increment
	ld a, e
	cp 255
	jr z, .dont_increment

.increment
	inc de
	ld [hl], e
	dec hl
	ld [hl], d

.dont_increment
	; If we've taken at least 1024 steps, have the bike
	;  shop owner try to call us.
	ld a, d
	cp HIGH(1024)
	jr c, .NoCall

	; If a call has already been queued, don't overwrite
	; that call.
	ld a, [wSpecialPhoneCallID]
	and a
	jr nz, .NoCall

	; Queue the call.
	ld a, SPECIALCALL_BIKESHOP
	ld [wSpecialPhoneCallID], a
	xor a
	ld [wSpecialPhoneCallID + 1], a
	ld hl, wStatusFlags2
	res STATUSFLAGS2_BIKE_SHOP_CALL_F, [hl]
	scf
	ret

.NoCall:
	xor a
	ret

INCLUDE "engine/overworld/cmd_queue.asm"
