RepelWoreOffScript:: ; 0x13619
	opentext
	writetext .text
	waitbutton
	closetext
	end

.text ; 0x13620
	; REPEL's effect wore off.
	text_jump UnknownText_0x1bd308
	db "@"

HiddenItemScript:: ; 0x13625
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

.bag_full ; 0x1363e
	buttonsound
	writetext .no_room_text
	waitbutton

.finish ; 13643
	closetext
	end

.found_text ; 0x13645
	; found @ !
	text_jump UnknownText_0x1bd321
	db "@"

.no_room_text ; 0x1364a
	; But   has no space left…
	text_jump UnknownText_0x1bd331
	db "@"

SetMemEvent: ; 1364f
	ld hl, wEngineBuffer1
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret
