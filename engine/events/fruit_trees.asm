FruitTreeScript::
	callasm GetCurTreeFruit
	opentext
	copybytetovar wCurFruit
	itemtotext USE_SCRIPT_VAR, MEM_BUFFER_0
	writetext FruitBearingTreeText
	buttonsound
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	waitbutton
	jump .end

.fruit
	writetext HeyItsFruitText
	copybytetovar wCurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	buttonsound
	writetext ObtainedFruitText
	callasm PickedFruitTree
	specialsound
	itemnotify
	jump .end

.packisfull
	buttonsound
	writetext FruitPackIsFullText
	waitbutton

.end
	closetext
	end

GetCurTreeFruit:
	ld a, [wCurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [wCurFruit], a
	ret

TryResetFruitTrees:
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret nz
	jp ResetFruitTrees

CheckFruitTree:
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [wScriptVar], a
	ret

PickedFruitTree:
	farcall StubbedTrainerRankings_FruitPicked
	ld b, 1
	jp GetFruitTreeFlag

ResetFruitTrees:
	xor a
	ld hl, wFruitTreeFlags
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wDailyFlags1
	set DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret

GetFruitTreeFlag:
	push hl
	push de
	ld a, [wCurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, wFruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret

GetFruitTreeItem:
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

INCLUDE "data/items/fruit_trees.asm"

FruitBearingTreeText:
	text_jump _FruitBearingTreeText
	db "@"

HeyItsFruitText:
	text_jump _HeyItsFruitText
	db "@"

ObtainedFruitText:
	text_jump _ObtainedFruitText
	db "@"

FruitPackIsFullText:
	text_jump _FruitPackIsFullText
	db "@"

NothingHereText:
	text_jump _NothingHereText
	db "@"
