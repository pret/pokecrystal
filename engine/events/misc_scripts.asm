Script_AbortBugContest: ; 0x122c1
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special Special_ContestReturnMons
.finish
	end

FindItemInBallScript:: ; 0x122ce
	callasm .TryReceiveItem
	iffalse .no_room
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	itemnotify
	closetext
	end
; 0x122e3

.no_room ; 0x122e3
	opentext
	writetext .text_found
	waitbutton
	writetext .text_bag_full
	waitbutton
	closetext
	end
; 0x122ee

.text_found ; 0x122ee
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"
; 0x122f3

.text_bag_full ; 0x122f3
	; But   can't carry any more items.
	text_jump UnknownText_0x1c0a2c
	db "@"
; 0x122f8

.TryReceiveItem: ; 122f8
	xor a
	ld [wScriptVar], a
	ld a, [wEngineBuffer1]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, wStringBuffer3
	call CopyName2
	ld a, [wEngineBuffer1]
	ld [wCurItem], a
	ld a, [wCurFruit]
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ret nc
	ld a, $1
	ld [wScriptVar], a
	ret
; 12324
