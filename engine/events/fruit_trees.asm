FruitTreeScript::
DEF FRUIT_TREE_3_MIN EQU 3
DEF FRUIT_TREE_4     EQU 4
DEF FRUIT_TREE_5_MAX EQU 5

	callasm GetCurTreeFruit
	opentext
	readmem wCurFruit
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext FruitBearingTreeText
	promptbutton
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	waitbutton
	sjump .end

.fruit
	farwritetext _HeyItsFruitText
	callasm GetFruitTreeCount
	ifequal FRUIT_TREE_3_MIN, .try_three
	ifequal FRUIT_TREE_4, .try_four
	; only possible value left it could be is FRUIT_TREE_5_MAX
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $5
	iffalse .try_four
	promptbutton
	writetext ObtainedFiveFruitText
	sjump .continue
.try_four
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $4
	iffalse .try_three
	promptbutton
	writetext ObtainedFourFruitText
	sjump .continue
.try_three
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $3
	iffalse .try_two
	promptbutton
	writetext ObtainedThreeFruitText
	sjump .continue
.try_two
; if you somehow approach the limit of number of a single berry
; and 3-5 will not fit in the bag but 2 will, it prints the "bag is full" text to let you know
; but still gives you the 2 berry too
; if 2 still wont fit, try 1
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, $2
	iffalse .try_one
	promptbutton
	writetext FruitPackIsFullText
	promptbutton
	writetext ObtainedTwoFruitText
	sjump .continue
.try_one
; if you somehow approach the limit of number of a single berry
; and 3-5 will not fit in the bag but 1 will, it prints the "bag is full" text to let you know
; but still gives you the 1 berry too
; if not even one berry will fit, print "bag is full text" and do not print ObtainedFruitText 
	readmem wCurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	promptbutton
	writetext FruitPackIsFullText
	promptbutton
	writetext ObtainedFruitText
.continue
	callasm PickedFruitTree
	specialsound
	itemnotify
	sjump .end

.packisfull
	promptbutton
	writetext FruitPackIsFullText
	waitbutton

.end
	closetext
	end

GetFruitTreeCount:
; RandomRange returns a random number between 0 and 2
; the range is in a, not inclusive
; We want a possible range of 3-5 so we add 3 after
	ld a, 3
	call RandomRange
	add 3
	ld [wScriptVar], a
	ret

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
rept (NUM_FRUIT_TREES + 7) / 8 - 1
	ld [hli], a
endr
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
	text_far _FruitBearingTreeText
	text_end

HeyItsFruitText:
	text_far _HeyItsFruitText
	text_end

ObtainedFruitText:
	text_far _ObtainedFruitText
	text_end

ObtainedTwoFruitText:
	text_far _ObtainedTwoFruitText
	text_end

ObtainedThreeFruitText:
	text_far _ObtainedThreeFruitText
	text_end

ObtainedFourFruitText:
	text_far _ObtainedFourFruitText
	text_end

ObtainedFiveFruitText:
	text_far _ObtainedFiveFruitText
	text_end

FruitPackIsFullText:
	text_far _FruitPackIsFullText
	text_end

NothingHereText:
	text_far _NothingHereText
	text_end
