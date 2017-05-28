FieldMoveJumptableReset: ; c6ea
	xor a
	ld hl, Buffer1
	ld bc, 7
	call ByteFill
	ret

FieldMoveJumptable: ; c6f5
	ld a, [Buffer1]
	rst JumpTable
	ld [Buffer1], a
	bit 7, a
	jr nz, .okay
	and a
	ret

.okay
	and $7f
	scf
	ret

GetPartyNick: ; c706
; write CurPartyMon nickname to StringBuffer1-3
	ld hl, PartyMonNicknames
	ld a, BOXMON
	ld [MonType], a
	ld a, [CurPartyMon]
	call GetNick
	call CopyName1
; copy text from StringBuffer2 to StringBuffer3
	ld de, StringBuffer2
	ld hl, StringBuffer3
	call CopyName2
	ret

CheckEngineFlag: ; c721
; Check engine flag de
; Return carry if flag is not set
	ld b, CHECK_FLAG
	callba EngineFlagAction
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret

CheckBadge: ; c731
; Check engine flag a (ENGINE_ZEPHYRBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and return carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	ld hl, .BadgeRequiredText
	call MenuTextBoxBackup ; push text to queue
	scf
	ret

.BadgeRequiredText: ; c73d
	; Sorry! A new BADGE
	; is required.
	text_jump _BadgeRequiredText
	db "@"

CheckPartyMove: ; c742
; Check if a monster in your party has move d.

	ld e, 0
	xor a
	ld [CurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no
	cp a, -1
	jr z, .no
	cp a, EGG
	jr z, .next

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [CurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret

FieldMoveFailed: ; c779
	ld hl, .CantUseHere
	call MenuTextBoxBackup
	ret

.CantUseHere: ; 0xc780
	; Can't use that here.
	text_jump UnknownText_0x1c05c8
	db "@"

CutFunction: ; c785
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; c796 (3:4796)

	dw .CheckAble
	dw .DoCut
	dw .FailCut

.CheckAble: ; c79c (3:479c)
	ld de, ENGINE_HIVEBADGE
	call CheckBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	ld a, $1
	ret

.nohivebadge
	ld a, $80
	ret

.nothingtocut
	ld a, $2
	ret

.DoCut: ; c7b2 (3:47b2)
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, $81
	ret

.FailCut: ; c7bb (3:47bb)
	ld hl, Text_NothingToCut
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_UsedCut: ; 0xc7c4
	; used CUT!
	text_jump UnknownText_0x1c05dd
	db "@"

Text_NothingToCut: ; 0xc7c9
	; There's nothing to CUT here.
	text_jump UnknownText_0x1c05ec
	db "@"

CheckMapForSomethingToCut: ; c7ce
	; Does the collision data of the facing tile permit cutting?
	call GetFacingTileCoord
	ld c, a
	push de
	callba CheckCutCollision
	pop de
	jr nc, .fail
	; Get the location of the current block in OverworldMap.
	call GetBlockLocation
	ld c, [hl]
	; See if that block contains something that can be cut.
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	; Back up the OverworldMap address to Buffer3
	ld a, l
	ld [Buffer3], a
	ld a, h
	ld [Buffer4], a
	; Back up the replacement tile to Buffer5
	ld a, b
	ld [Buffer5], a
	; Back up the animation index to Buffer6
	ld a, c
	ld [Buffer6], a
	xor a
	ret

.fail
	scf
	ret

Script_CutFromMenu: ; c7fe
	reloadmappart
	special UpdateTimePals

Script_Cut: ; 0xc802
	callasm GetPartyNick
	writetext Text_UsedCut
	reloadmappart
	callasm CutDownTreeOrGrass
	closetext
	end

CutDownTreeOrGrass: ; c810
	ld hl, Buffer3 ; OverworldMapTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Buffer5] ; ReplacementTile
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call UpdateSprites
	call DelayFrame
	ld a, [Buffer6] ; Animation type
	ld e, a
	callba OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret

CheckOverworldTileArrays: ; c840
	; Input: c contains the tile you're facing
	; Output: Replacement tile in b and effect on wild encounters in c, plus carry set.
	;         Carry is not set if the facing tile cannot be replaced, or if the tileset
	;         does not contain a tile you can replace.

	; Dictionary lookup for pointer to tile replacement table
	push bc
	ld a, [wTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	; Load the pointer
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Look up the tile you're facing
	ld de, 3
	ld a, c
	call IsInArray
	jr nc, .nope
	; Load the replacement to b
	inc hl
	ld b, [hl]
	; Load the animation type parameter to c
	inc hl
	ld c, [hl]
	scf
	ret

.nope
	xor a
	ret

CutTreeBlockPointers: ; c862
; Which tileset are we in?
	dbw TILESET_JOHTO_1, .johto1
	dbw TILESET_JOHTO_2, .johto2
	dbw TILESET_KANTO, .kanto
	dbw TILESET_PARK, .park
	dbw TILESET_ILEX_FOREST, .ilex
	db -1

.johto1 ; Johto OW
; Which meta tile are we facing, which should we replace it with, and which animation?
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1

.johto2 ; Goldenrod area
	db $03, $02, $01 ; grass
	db -1

.kanto ; Kanto OW
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1

.park ; National Park
	db $13, $03, $01 ; grass
	db $03, $04, $01 ; grass
	db -1

.ilex ; Ilex Forest
	db $0f, $17, $00
	db -1

WhirlpoolBlockPointers: ; c8a4
	dbw TILESET_JOHTO_1, .johto
	db -1

.johto ; c8a8
	db $07, $36, $00
	db -1

OWFlash: ; c8ac
	call .CheckUseFlash
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.CheckUseFlash: ; c8b5
; Flash
	ld de, ENGINE_ZEPHYRBADGE
	callba CheckBadge
	jr c, .nozephyrbadge
	push hl
	callba SpecialAerodactylChamber
	pop hl
	jr c, .useflash
	ld a, [wTimeOfDayPalset]
	cp %11111111 ; 3, 3, 3, 3
	jr nz, .notadarkcave
.useflash
	call UseFlash
	ld a, $81
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, $80
	ret

.nozephyrbadge
	ld a, $80
	ret

UseFlash: ; c8e0
	ld hl, Script_UseFlash
	jp QueueScript

Script_UseFlash: ; 0xc8e6
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xc8f3
	callasm BlindingFlash
	closetext
	end

UnknownText_0xc8f3: ; 0xc8f3
	text_jump UnknownText_0x1c0609
	start_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, .BlankText
	ret

.BlankText: ; 0xc908
	db "@"

SurfFunction: ; c909
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; c91a (3:491a)
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing

.TrySurf: ; c922 (3:4922)
	ld de, ENGINE_FOGBADGE
	call CheckBadge
	jr c, .asm_c956
	ld hl, BikeFlags
	bit 1, [hl] ; always on bike
	jr nz, .cannotsurf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .alreadyfail
	cp PLAYER_SURF_PIKA
	jr z, .alreadyfail
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr nz, .cannotsurf
	call CheckDirection
	jr c, .cannotsurf
	callba CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.asm_c956
	ld a, $80
	ret
.alreadyfail
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf: ; c95f (3:495f)
	call GetSurfType
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	call GetPartyNick
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, $81
	ret

.FailSurf: ; c971 (3:4971)
	ld hl, CantSurfText
	call MenuTextBoxBackup
	ld a, $80
	ret

.AlreadySurfing: ; c97a (3:497a)
	ld hl, AlreadySurfingText
	call MenuTextBoxBackup
	ld a, $80
	ret

SurfFromMenuScript: ; c983
	special UpdateTimePals

UsedSurfScript: ; c986
	writetext UsedSurfText ; "used SURF!"
	waitbutton
	closetext

	callasm .empty_fn ; empty function

	copybytetovar Buffer2
	writevarcode VAR_MOVEMENT

	special ReplaceKrisSprite
	special PlayMapMusic
; step into the water
	special Special_SurfStartStep ; (slow_step_x, step_end)
	applymovement PLAYER, MovementBuffer ; PLAYER, MovementBuffer
	end

.empty_fn ; c9a2
	callba TrainerRankings_Surf
	ret

UsedSurfText: ; c9a9
	text_jump _UsedSurfText
	db "@"

CantSurfText: ; c9ae
	text_jump _CantSurfText
	db "@"

AlreadySurfingText: ; c9b3
	text_jump _AlreadySurfingText
	db "@"

GetSurfType: ; c9b8
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.

	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	ld hl, PartySpecies
	add hl, de

	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret

CheckDirection: ; c9cb
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [PlayerDirection]
	and a, %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [TilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions:
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT

TrySurfOW:: ; c9e7
; Checking a tile in the overworld.
; Return carry if fail is allowed.

; Don't ask to surf if already fail.
	ld a, [PlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .quit
	cp PLAYER_SURF
	jr z, .quit

; Must be facing water.
	ld a, [EngineBuffer1]
	call GetTileCollision
	cp 1 ; surfable
	jr nz, .quit

; Check tile permissions.
	call CheckDirection
	jr c, .quit

	ld de, ENGINE_FOGBADGE
	call CheckEngineFlag
	jr c, .quit

	ld d, SURF
	call CheckPartyMove
	jr c, .quit

	ld hl, BikeFlags
	bit 1, [hl] ; always on bike (can't surf)
	jr nz, .quit

	call GetSurfType
	ld [MovementType], a
	call GetPartyNick

	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript

	scf
	ret

.quit
	xor a
	ret

AskSurfScript: ; ca2c
	opentext
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	closetext
	end

AskSurfText: ; ca36
	text_jump _AskSurfText ; The water is calm.
	db "@"              ; Want to SURF?

FlyFunction: ; ca3b
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
 	dw .TryFly
 	dw .DoFly
 	dw .FailFly

.TryFly: ; ca52
; Fly
	ld de, ENGINE_STORMBADGE
	call CheckBadge
	jr c, .nostormbadge
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .outdoors
	jr .indoors

.outdoors
	xor a
	ld [hMapAnims], a
	call LoadStandardMenuDataHeader
	call ClearSprites
	callba _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp NUM_SPAWNS
	jr nc, .illegal

	ld [wd001], a
	call CloseWindow
	ld a, $1
	ret

.nostormbadge
	ld a, $82
	ret

.indoors
	ld a, $2
	ret

.illegal
	call CloseWindow
	call WaitBGMap
	ld a, $80
	ret

.DoFly: ; ca94
	ld hl, .FlyScript
	call QueueScript
	ld a, $81
	ret

.FailFly: ; ca9d
	call FieldMoveFailed
	ld a, $82
	ret

.FlyScript: ; 0xcaa3
	reloadmappart
	callasm HideSprites
	special UpdateTimePals
	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm DelayLoadingNewSprites
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm FlyToAnim
	special WaitSFX
	callasm .ReturnFromFly
	end

.ReturnFromFly: ; cacb
	callba Function561d
	call DelayFrame
	call ReplaceKrisSprite
	callba LoadOverworldFont
	ret

WaterfallFunction: ; cade
	call .TryWaterfall
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryWaterfall: ; cae7
; Waterfall
	ld de, ENGINE_RISINGBADGE
	callba CheckBadge
	ld a, $80
	ret c
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, $81
	ret

.failed
	call FieldMoveFailed
	ld a, $80
	ret

CheckMapCanWaterfall: ; cb07
	ld a, [PlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .failed
	ld a, [TileUp]
	call CheckWaterfallTile
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret

Script_WaterfallFromMenu: ; 0xcb1c
	reloadmappart
	special UpdateTimePals

Script_UsedWaterfall: ; 0xcb20
	callasm GetPartyNick
	writetext .Text_UsedWaterfall
	waitbutton
	closetext
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, .WaterfallStep
	callasm .CheckContinueWaterfall
	iffalse .loop
	end

.CheckContinueWaterfall: ; cb38
	xor a
	ld [ScriptVar], a
	ld a, [PlayerStandingTile]
	call CheckWaterfallTile
	ret z
	callba TrainerRankings_Waterfall
	ld a, $1
	ld [ScriptVar], a
	ret

.WaterfallStep: ; cb4f
	turn_waterfall UP
	step_end

.Text_UsedWaterfall: ; 0xcb51
	; used WATERFALL!
	text_jump UnknownText_0x1c068e
	db "@"

TryWaterfallOW:: ; cb56
	ld d, WATERFALL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_RISINGBADGE
	call CheckEngineFlag
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret

Script_CantDoWaterfall: ; 0xcb7e
	jumptext .Text_CantDoWaterfall

.Text_CantDoWaterfall: ; 0xcb81
	; Wow, it's a huge waterfall.
	text_jump UnknownText_0x1c06a3
	db "@"

Script_AskWaterfall: ; 0xcb86
	opentext
	writetext .AskUseWaterfall
	yesorno
	iftrue Script_UsedWaterfall
	closetext
	end

.AskUseWaterfall: ; 0xcb90
	; Do you want to use WATERFALL?
	text_jump UnknownText_0x1c06bf
	db "@"

EscapeRopeFunction: ; cb95
	call FieldMoveJumptableReset
	ld a, $1
	jr dig_incave

DigFunction: ; cb9c
	call FieldMoveJumptableReset
	ld a, $2

dig_incave
	ld [Buffer2], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.DigTable: ; cbb2
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig

.CheckCanDig: ; cbb8
	call GetMapPermission
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	ld a, $2
	ret

.incave
	ld hl, wDigWarp
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	ld a, $1
	ret

.DoDig: ; cbd8
	ld hl, wDigWarp
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	call GetPartyNick
	ld a, [Buffer2]
	cp $2
	jr nz, .escaperope
	ld hl, .UsedDigScript
	call QueueScript
	ld a, $81
	ret

.escaperope
	callba SpecialKabutoChamber
	ld hl, .UsedEscapeRopeScript
	call QueueScript
	ld a, $81
	ret

.FailDig: ; cc06
	ld a, [Buffer2]
	cp $2
	jr nz, .failescaperope
	ld hl, .Text_CantUseHere
	call MenuTextBox
	call WaitPressAorB_BlinkCursor
	call CloseWindow

.failescaperope
	ld a, $80
	ret

.Text_UsedDig: ; 0xcc1c
	; used DIG!
	text_jump UnknownText_0x1c06de
	db "@"

.Text_UsedEscapeRope: ; 0xcc21
	; used an ESCAPE ROPE.
	text_jump UnknownText_0x1c06ed
	db "@"

.Text_CantUseHere: ; 0xcc26
	; Can't use that here.
	text_jump UnknownText_0x1c0705
	db "@"

.UsedEscapeRopeScript: ; 0xcc2b
	reloadmappart
	special UpdateTimePals
	writetext .Text_UsedEscapeRope
	jump .UsedDigOrEscapeRopeScript

.UsedDigScript: ; 0xcc35
	reloadmappart
	special UpdateTimePals
	writetext .Text_UsedDig

.UsedDigOrEscapeRopeScript: ; 0xcc3c
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end

.DigOut: ; 0xcc59
	step_dig 32
	hide_person
	step_end

.DigReturn: ; 0xcc5d
	show_person
	return_dig 32
	step_end

TeleportFunction: ; cc61
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; cc72
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport

.TryTeleport: ; cc78
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .CheckIfSpawnPoint
	jr .nope

.CheckIfSpawnPoint:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	callba IsSpawnPoint
	jr nc, .nope
	ld a, c
	ld [wd001], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret

.DoTeleport: ; cc9c
	call GetPartyNick
	ld hl, .TeleportScript
	call QueueScript
	ld a, $81
	ret

.FailTeleport: ; cca8
	ld hl, .Text_CantUseHere
	call MenuTextBoxBackup
	ld a, $80
	ret

.Text_ReturnToLastMonCenter: ; 0xccb1
	; Return to the last #MON CENTER.
	text_jump UnknownText_0x1c071a
	db "@"

.Text_CantUseHere: ; 0xccb6
	; Can't use that here.
	text_jump UnknownText_0x1c073b
	db "@"

.TeleportScript: ; 0xccbb
	reloadmappart
	special UpdateTimePals
	writetext .Text_ReturnToLastMonCenter
	pause 60
	reloadmappart
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end

.TeleportFrom: ; cce1
	teleport_from
	step_end

.TeleportTo: ; cce3
	teleport_to
	step_end

StrengthFunction: ; cce5
	call .TryStrength
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryStrength: ; ccee
; Strength
	ld de, ENGINE_PLAINBADGE
	call CheckBadge
	jr c, .Failed
	jr .UseStrength

.AlreadyUsing: ; unreferenced
	ld hl, .JumpText
	call MenuTextBoxBackup
	ld a, $80
	ret

.JumpText: ; 0xcd01
	text_jump UnknownText_0x1c0751
	db "@"

.Failed: ; cd06
	ld a, $80
	ret

.UseStrength: ; cd09
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, $81
	ret

SetStrengthFlag: ; cd12
	ld hl, BikeFlags
	set 0, [hl]
	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [Buffer6], a
	call GetPartyNick
	ret

Script_StrengthFromMenu: ; 0xcd29
	reloadmappart
	special UpdateTimePals

Script_UsedStrength: ; 0xcd2d
	callasm SetStrengthFlag
	writetext .UsedStrength
	copybytetovar Buffer6
	cry 0
	pause 3
	writetext .StrengthAllowedItToMoveBoulders
	closetext
	end

.UsedStrength: ; 0xcd41
	text_jump UnknownText_0x1c0774
	db "@"

.StrengthAllowedItToMoveBoulders: ; 0xcd46
	text_jump UnknownText_0x1c0788
	db "@"

AskStrengthScript:
	callasm TryStrengthOW
	iffalse .AskStrength
	if_equal $1, .DontMeetRequirements
	jump .AlreadyUsedStrength

.DontMeetRequirements: ; 0xcd59
	jumptext UnknownText_0xcd73

.AlreadyUsedStrength: ; 0xcd5c
	jumptext UnknownText_0xcd6e

.AskStrength: ; 0xcd5f
	opentext
	writetext UnknownText_0xcd69
	yesorno
	iftrue Script_UsedStrength
	closetext
	end

UnknownText_0xcd69: ; 0xcd69
	; A #MON may be able to move this. Want to use STRENGTH?
	text_jump UnknownText_0x1c07a0
	db "@"

UnknownText_0xcd6e: ; 0xcd6e
	; Boulders may now be moved!
	text_jump UnknownText_0x1c07d8
	db "@"

UnknownText_0xcd73: ; 0xcd73
	; A #MON may be able to move this.
	text_jump UnknownText_0x1c07f4
	db "@"

TryStrengthOW: ; cd78
	ld d, STRENGTH
	call CheckPartyMove
	jr c, .nope

	ld de, ENGINE_PLAINBADGE
	call CheckEngineFlag
	jr c, .nope

	ld hl, BikeFlags
	bit 0, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.already_using
	xor a
	jr .done

.done
	ld [ScriptVar], a
	ret

WhirlpoolFunction: ; cd9d
	call FieldMoveJumptableReset
.loop
	ld hl, Jumptable_cdae
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

Jumptable_cdae: ; cdae
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool

.TryWhirlpool: ; cdb4
	ld de, ENGINE_GLACIERBADGE
	call CheckBadge
	jr c, .noglacierbadge
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	ld a, $80
	ret

.DoWhirlpool: ; cdca
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, $81
	ret

.FailWhirlpool: ; cdd3
	call FieldMoveFailed
	ld a, $80
	ret

Text_UsedWhirlpool: ; 0xcdd9
	; used WHIRLPOOL!
	text_jump UnknownText_0x1c0816
	db "@"

TryWhirlpoolMenu: ; cdde
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	ld a, l
	ld [Buffer3], a
	ld a, h
	ld [Buffer4], a
	ld a, b
	ld [Buffer5], a
	ld a, c
	ld [Buffer6], a
	xor a
	ret

.failed
	scf
	ret

Script_WhirlpoolFromMenu: ; 0xce0b
	reloadmappart
	special UpdateTimePals

Script_UsedWhirlpool: ; 0xce0f
	callasm GetPartyNick
	writetext Text_UsedWhirlpool
	reloadmappart
	callasm DisappearWhirlpool
	closetext
	end

DisappearWhirlpool: ; ce1d
	ld hl, Buffer3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Buffer5]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	ld a, [Buffer6]
	ld e, a
	callba PlayWhirlpoolSound
	call BufferScreen
	call GetMovementPermissions
	ret

TryWhirlpoolOW:: ; ce3e
	ld d, WHIRLPOOL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_GLACIERBADGE
	call CheckEngineFlag
	jr c, .failed
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, BANK(Script_AskWhirlpoolOW)
	ld hl, Script_AskWhirlpoolOW
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret

Script_MightyWhirlpool: ; 0xce66
	jumptext .MightyWhirlpoolText

.MightyWhirlpoolText: ; 0xce69
	text_jump UnknownText_0x1c082b
	db "@"

Script_AskWhirlpoolOW: ; 0xce6e
	opentext
	writetext UnknownText_0xce78
	yesorno
	iftrue Script_UsedWhirlpool
	closetext
	end

UnknownText_0xce78: ; 0xce78
	text_jump UnknownText_0x1c0864
	db "@"

HeadbuttFunction: ; ce7d
	call TryHeadbuttFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryHeadbuttFromMenu: ; ce86
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_tree
	call FieldMoveFailed
	ld a, $80
	ret

UnknownText_0xce9d: ; 0xce9d
	; did a HEADBUTT!
	text_jump UnknownText_0x1c0897
	db "@"

UnknownText_0xcea2: ; 0xcea2
	; Nope. Nothing…
	text_jump UnknownText_0x1c08ac
	db "@"

HeadbuttFromMenuScript: ; 0xcea7
	reloadmappart
	special UpdateTimePals

HeadbuttScript: ; 0xceab
	callasm GetPartyNick
	writetext UnknownText_0xce9d

	reloadmappart
	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.no_battle
	writetext UnknownText_0xcea2
	waitbutton
	closetext
	end

TryHeadbuttOW:: ; cec9
	ld d, HEADBUTT
	call CheckPartyMove
	jr c, .no

	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret

AskHeadbuttScript: ; 0xcedc
	opentext
	writetext UnknownText_0xcee6
	yesorno
	iftrue HeadbuttScript
	closetext
	end

UnknownText_0xcee6: ; 0xcee6
	; A #MON could be in this tree. Want to HEADBUTT it?
	text_jump UnknownText_0x1c08bc
	db "@"

RockSmashFunction: ; ceeb
	call TryRockSmashFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryRockSmashFromMenu: ; cef4
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp $18
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_rock
	call FieldMoveFailed
	ld a, $80
	ret

GetFacingObject: ; cf0d
	callba CheckFacingObject
	jr nc, .fail

	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret

RockSmashFromMenuScript: ; 0xcf2e
	reloadmappart
	special UpdateTimePals

RockSmashScript: ; cf32
	callasm GetPartyNick
	writetext UnknownText_0xcf58
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement2 MovementData_0xcf55
	disappear -2

	callasm RockMonEncounter
	copybytetovar TempWildMonSpecies
	iffalse .done
	randomwildmon
	startbattle
	reloadmapafterbattle
.done
	end

MovementData_0xcf55: ; 0xcf55
	rock_smash 10
	step_end

UnknownText_0xcf58: ; 0xcf58
	text_jump UnknownText_0x1c08f0
	db "@"

AskRockSmashScript: ; 0xcf5d
	callasm HasRockSmash
	if_equal 1, .no

	opentext
	writetext UnknownText_0xcf77
	yesorno
	iftrue RockSmashScript
	closetext
	end
.no
	jumptext UnknownText_0xcf72

UnknownText_0xcf72: ; 0xcf72
	; Maybe a #MON can break this.
	text_jump UnknownText_0x1c0906
	db "@"

UnknownText_0xcf77: ; 0xcf77
	; This rock looks breakable. Want to use ROCK SMASH?
	text_jump UnknownText_0x1c0924
	db "@"

HasRockSmash: ; cf7c
	ld d, ROCK_SMASH
	call CheckPartyMove
	jr nc, .yes
.no
	ld a, 1
	jr .done
.yes
	xor a
	jr .done
.done
	ld [ScriptVar], a
	ret

FishFunction: ; cf8e
	ld a, e
	push af
	call FieldMoveJumptableReset
	pop af
	ld [Buffer2], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.FishTable: ; cfa5
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .FailFish
	dw .FishNoFish

.TryFish: ; cfaf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .fail
	cp PLAYER_SURF_PIKA
	jr z, .fail
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr z, .facingwater
.fail
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [Buffer2]
	ld e, a
	callba Fish
	ld a, d
	and a
	jr z, .nonibble
	ld [TempWildMonSpecies], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, BATTLETYPE_FISH
	ld [BattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret

.FailFish: ; cff1
	ld a, $80
	ret

.FishGotSomething: ; cff4
	ld a, $1
	ld [Buffer6], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, $81
	ret

.FishNoBite: ; d002
	ld a, $2
	ld [Buffer6], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret

.FishNoFish: ; d010
	ld a, $0
	ld [Buffer6], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, $81
	ret

Script_NotEvenANibble: ; 0xd01e
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9
	jump Script_NotEvenANibble_FallThrough

Script_NotEvenANibble2: ; 0xd027
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9

Script_NotEvenANibble_FallThrough: ; 0xd02d
	loademote EMOTE_SHADOW
	callasm PutTheRodAway
	closetext
	end

Script_GotABite: ; 0xd035
	scall Script_FishCastRod
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, .Movement_FacingUp
	jump .FightTheHookedPokemon

.NotFacingUp: ; 0xd046
	applymovement PLAYER, .Movement_NotFacingUp

.FightTheHookedPokemon: ; 0xd04a
	pause 40
	applymovement PLAYER, .Movement_RestoreRod
	writetext UnknownText_0xd0a4
	callasm PutTheRodAway
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.Movement_NotFacingUp: ; d05c
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end

.Movement_FacingUp: ; d062
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep 1
	show_emote
	step_end

.Movement_RestoreRod: ; d069
	hide_emote
	fish_cast_rod
	step_end

Fishing_CheckFacingUp: ; d06c
	ld a, [PlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [ScriptVar], a
	ret

Script_FishCastRod: ; 0xd07c
	reloadmappart
	loadvar hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_0xd093
	pause 40
	end

MovementData_0xd093: ; d093
	fish_cast_rod
	step_end

PutTheRodAway: ; d095
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [PlayerAction], a
	call UpdateSprites
	call ReplaceKrisSprite
	ret

UnknownText_0xd0a4: ; 0xd0a4
	; Oh! A bite!
	text_jump UnknownText_0x1c0958
	db "@"

UnknownText_0xd0a9: ; 0xd0a9
	; Not even a nibble!
	text_jump UnknownText_0x1c0965
	db "@"

UnknownText_0xd0ae: ; unused
	; Looks like there's nothing here.
	text_jump UnknownText_0x1c0979
	db "@"

BikeFunction: ; d0b3
	call .TryBike
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryBike: ; d0bc
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike:
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	call QueueScript
	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.GetOffBike:
	ld hl, BikeFlags
	bit 1, [hl]
	jr nz, .CantGetOffBike
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	ld a, BANK(Script_GetOffBike)
	jr .done

.CantGetOffBike:
	ld hl, Script_CantGetOffBike
	jr .done

.CannotUseBike:
	ld a, $0
	ret

.done
	call QueueScript
	ld a, $1
	ret

.CheckIfRegistered: ; d119
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret

.CheckEnvironment: ; d121
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	jr .nope

.ok
	call GetPlayerStandingTile
	and $f ; can't use our bike in a wall or on water
	jr nz, .nope
	xor a
	ret

.nope
	scf
	ret

Script_GetOnBike: ; 0xd13e
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_BIKE
	writetext GotOnTheBikeText
	waitbutton
	closetext
	special ReplaceKrisSprite
	end

Script_GetOnBike_Register: ; 0xd14e
	writecode VAR_MOVEMENT, PLAYER_BIKE
	closetext
	special ReplaceKrisSprite
	end

; XXX
	nop
	ret

Script_GetOffBike: ; 0xd158
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext GotOffTheBikeText
	waitbutton

FinishGettingOffBike:
	closetext
	special ReplaceKrisSprite
	special PlayMapMusic
	end

Script_GetOffBike_Register: ; 0xd16b
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffBike

Script_CantGetOffBike: ; 0xd171
	writetext .CantGetOffBikeText
	waitbutton
	closetext
	end

.CantGetOffBikeText: ; 0xd177
	; You can't get off here!
	text_jump UnknownText_0x1c099a
	db "@"

GotOnTheBikeText: ; 0xd17c
	; got on the @ .
	text_jump UnknownText_0x1c09b2
	db "@"

GotOffTheBikeText: ; 0xd181
	; got off the @ .
	text_jump UnknownText_0x1c09c7
	db "@"

TryCutOW:: ; d186
	ld d, CUT
	call CheckPartyMove
	jr c, .cant_cut

	ld de, ENGINE_HIVEBADGE
	call CheckEngineFlag
	jr c, .cant_cut

	ld a, BANK(AskCutScript)
	ld hl, AskCutScript
	call CallScript
	scf
	ret

.cant_cut
	ld a, BANK(CantCutScript)
	ld hl, CantCutScript
	call CallScript
	scf
	ret

AskCutScript: ; 0xd1a9
	opentext
	writetext UnknownText_0xd1c8
	yesorno
	iffalse .script_d1b8
	callasm .CheckMap
	iftrue Script_Cut
.script_d1b8
	closetext
	end

.CheckMap: ; d1ba
	xor a
	ld [ScriptVar], a
	call CheckMapForSomethingToCut
	ret c
	ld a, TRUE
	ld [ScriptVar], a
	ret

UnknownText_0xd1c8: ; 0xd1c8
	text_jump UnknownText_0x1c09dd
	db "@"

CantCutScript: ; 0xd1cd
	jumptext UnknownText_0xd1d0

UnknownText_0xd1d0: ; 0xd1d0
	text_jump UnknownText_0x1c0a05
	db "@"
