RepelWoreOffScript::
	opentext
	writetext .Text
	waitbutton
	closetext
	end

.Text:
	; REPEL's effect wore off.
	text_far _RepelWoreOffText
	text_end

HiddenItemScript::
	opentext
	readmem wHiddenItemID
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext .PlayerFoundItemText
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	sjump .finish

.bag_full
	buttonsound
	writetext .ButNoSpaceText
	waitbutton

.finish
	closetext
	end

.PlayerFoundItemText:
	; found @ !
	text_far _PlayerFoundItemText
	text_end

.ButNoSpaceText:
	; But   has no space left…
	text_far _ButNoSpaceText
	text_end

SetMemEvent:
	ld hl, wHiddenItemEvent
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret
