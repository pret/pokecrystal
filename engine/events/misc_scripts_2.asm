RepelWoreOffScript::
	opentext
	writetext .text
	waitbutton
	closetext
	end

.text
	; REPEL's effect wore off.
	text_jump UnknownText_0x1bd308
	db "@"

HiddenItemScript::
	opentext
	copybytetovar wEngineBuffer3
	itemtotext USE_SCRIPT_VAR, MEM_BUFFER_0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	jump .finish

.bag_full
	buttonsound
	writetext .no_room_text
	waitbutton

.finish
	closetext
	end

.found_text
	; found @ !
	text_jump UnknownText_0x1bd321
	db "@"

.no_room_text
	; But   has no space left…
	text_jump UnknownText_0x1bd331
	db "@"

SetMemEvent:
	ld hl, wEngineBuffer1
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret
