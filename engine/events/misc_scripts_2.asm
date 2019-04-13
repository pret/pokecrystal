RepelWoreOffScript::
	opentext
	writetext .text
	waitbutton
	closetext
	end

.text
	; REPEL's effect wore off.
	text_far _RepelWoreOffText
	text_end

HiddenItemScript::
	opentext
	readmem wHiddenItemID
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	sjump .finish

.bag_full
	buttonsound
	writetext .no_room_text
	waitbutton

.finish
	closetext
	end

.found_text
	; found @ !
	text_far _PlayerFoundItemText
	text_end

.no_room_text
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
