AddPhoneNumber:: ; 90000
	call _CheckCellNum
	jr c, .cant_add
	call Phone_FindOpenSlot
	jr nc, .cant_add
	ld [hl], c
	xor a
	ret

.cant_add
	scf
	ret
; 9000f


DelCellNum:: ; 9000f
	call _CheckCellNum
	jr nc, .not_in_list
	xor a
	ld [hl], a
	ret

.not_in_list
	scf
	ret
; 90019

CheckCellNum:: ; 90019
	jp _CheckCellNum ; wtf
; 9001c

_CheckCellNum: ; 9001c
	ld hl, wPhoneList
	ld b, CONTACT_LIST_SIZE
.loop
	ld a, [hli]
	cp c
	jr z, .got_it
	dec b
	jr nz, .loop
	xor a
	ret

.got_it
	dec hl
	scf
	ret
; 9002d

Phone_FindOpenSlot: ; 9002d
	call GetRemainingSpaceInPhoneList
	ld b, a
	ld hl, wPhoneList
.loop
	ld a, [hli]
	and a
	jr z, .FoundOpenSpace
	dec b
	jr nz, .loop
	xor a
	ret

.FoundOpenSpace:
	dec hl
	scf
	ret
; 90040

GetRemainingSpaceInPhoneList: ; 90040
	xor a
	ld [Buffer1], a
	ld hl, PermanentNumbers
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr z, .continue

	push bc
	push hl
	ld c, a
	call _CheckCellNum
	jr c, .permanent
	ld hl, Buffer1
	inc [hl]
.permanent
	pop hl
	pop bc

.continue
	jr .loop

.done
	ld a, CONTACT_LIST_SIZE
	ld hl, Buffer1
	sub [hl]
	ret
; 90066

INCLUDE "data/phone/permanent_numbers.asm"


FarPlaceString: ; 90069
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call PlaceString

	pop af
	rst Bankswitch
	ret
; 90074


CheckPhoneCall:: ; 90074 (24:4074)
; Check if the phone is ringing in the overworld.

	call CheckStandingOnEntrance
	jr z, .no_call

	call .timecheck
	nop
	jr nc, .no_call

	call Random
	ld b, a
	and 50 percent
	cp b
	jr nz, .no_call

	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .no_call

	call GetAvailableCallers
	call ChooseRandomCaller
	jr nc, .no_call

	ld e, a
	call LoadCallerScript
	ld a, BANK(Script_ReceivePhoneCall)
	ld hl, Script_ReceivePhoneCall
	call CallScript
	scf
	ret

.no_call
	xor a
	ret

.timecheck ; 900a6 (24:40a6)
	farcall CheckReceiveCallTimer
	ret

CheckPhoneContactTimeOfDay: ; 900ad (24:40ad)
	push hl
	push bc
	push de
	push af

	farcall CheckTime
	pop af
	and MORN | DAY | NITE
	and c

	pop de
	pop bc
	pop hl
	ret

ChooseRandomCaller: ; 900bf (24:40bf)
; If no one is available to call, don't return anything.
	ld a, [EngineBuffer3]
	and a
	jr z, .NothingToSample

; Sample a random number between 0 and 31.
	ld c, a
	call Random
	ld a, [hRandomAdd]
	swap a
	and $1f
; Compute that number modulo the number of available callers.
	call SimpleDivide
; Return the caller ID you just sampled.
	ld c, a
	ld b, 0
	ld hl, EngineBuffer4
	add hl, bc
	ld a, [hl]
	scf
	ret

.NothingToSample:
	xor a
	ret

GetAvailableCallers: ; 900de (24:40de)
	farcall CheckTime
	ld a, c
	ld [EngineBuffer1], a
	ld hl, EngineBuffer3
	ld bc, 11
	xor a
	call ByteFill
	ld de, wPhoneList
	ld a, CONTACT_LIST_SIZE

.loop
	ld [EngineBuffer2], a
	ld a, [de]
	and a
	jr z, .not_good_for_call
	ld hl, PhoneContacts + PHONE_CONTACT_SCRIPT2_TIME
	ld bc, PHONE_TABLE_WIDTH
	call AddNTimes
	ld a, [EngineBuffer1]
	and [hl]
	jr z, .not_good_for_call
	ld bc, PHONE_CONTACT_MAP_GROUP - PHONE_CONTACT_SCRIPT2_TIME
	add hl, bc
	ld a, [MapGroup]
	cp [hl]
	jr nz, .different_map
	inc hl
	ld a, [MapNumber]
	cp [hl]
	jr z, .not_good_for_call
.different_map
	ld a, [EngineBuffer3]
	ld c, a
	ld b, $0
	inc a
	ld [EngineBuffer3], a
	ld hl, EngineBuffer4
	add hl, bc
	ld a, [de]
	ld [hl], a
.not_good_for_call
	inc de
	ld a, [EngineBuffer2]
	dec a
	jr nz, .loop
	ret

CheckSpecialPhoneCall:: ; 90136 (24:4136)
	ld a, [wSpecialPhoneCallID]
	and a
	jr z, .NoPhoneCall

	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, 6
	call AddNTimes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	jr nc, .NoPhoneCall

	call .DoSpecialPhoneCall
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	push hl
	call LoadCallerScript
	pop hl
	ld de, wPhoneScriptPointer
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, BANK(.script)
	ld hl, .script
	call CallScript
	scf
	ret
.NoPhoneCall:
	xor a
	ret
; 90173 (24:4173)

.script ; 0x90173
	pause 30
	jump Script_ReceivePhoneCall
; 0x90178

.DoSpecialPhoneCall: ; 90178 (24:4178)
	ld a, [wSpecialPhoneCallID]
	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, 6
	call AddNTimes
	ret

SpecialCallOnlyWhenOutside: ; 90188
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr z, .outside
	xor a
	ret

.outside
	scf
	ret

SpecialCallWhereverYouAre: ; 90197
	scf
	ret

Function90199: ; 90199 (24:4199)
	; Don't do the call if you're in a link communication
	ld a, [wLinkMode]
	and a
	jr nz, .OutOfArea
	; If you're in an area without phone service, don't do the call
	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .OutOfArea
	; If the person can't take a call at that time, don't do the call
	ld a, b
	ld [wCurrentCaller], a
	ld hl, PhoneContacts
	ld bc, PHONE_TABLE_WIDTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, PHONE_CONTACT_SCRIPT1_TIME
	add hl, de
	ld a, [hl]
	call CheckPhoneContactTimeOfDay
	jr z, .OutOfArea
	; If we're in the same map as the person we're calling,
	; use the "Just talk to that person" script.
	ld hl, PHONE_CONTACT_MAP_GROUP
	add hl, de
	ld a, [MapGroup]
	cp [hl]
	jr nz, .GetPhoneScript
	ld hl, PHONE_CONTACT_MAP_NUMBER
	add hl, de
	ld a, [MapNumber]
	cp [hl]
	jr nz, .GetPhoneScript
	ld b, BANK(PhoneScript_JustTalkToThem)
	ld hl, PhoneScript_JustTalkToThem
	jr .DoPhoneCall

.GetPhoneScript:
	ld hl, PHONE_CONTACT_SCRIPT1_BANK
	add hl, de
	ld b, [hl]
	ld hl, PHONE_CONTACT_SCRIPT1_ADDR_LO
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .DoPhoneCall

.OutOfArea:
	ld b, BANK(UnknownScript_0x90209)
	ld de, UnknownScript_0x90209
	call ExecuteCallbackScript
	ret

.DoPhoneCall:
	ld a, b
	ld [PhoneScriptBank], a
	ld a, l
	ld [PhoneCaller], a
	ld a, h
	ld [PhoneCaller + 1], a
	ld b, BANK(UnknownScript_0x90205)
	ld de, UnknownScript_0x90205
	call ExecuteCallbackScript
	ret
; 90205 (24:4205)

UnknownScript_0x90205: ; 0x90205
	ptcall wd002
	return
; 0x90209

UnknownScript_0x90209: ; 0x90209
	scall UnknownScript_0x90657
	return
; 0x9020d

LoadCallerScript: ; 9020d (24:420d)
	nop
	nop
	ld a, e
	ld [wCurrentCaller], a
	and a
	jr nz, .actualcaller
	ld a, BANK(WrongNumber)
	ld hl, WrongNumber
	jr .proceed

.actualcaller
	ld hl, PhoneContacts
	ld bc, 12
	ld a, e
	call AddNTimes
	ld a, BANK(PhoneContacts)
.proceed
	ld de, EngineBuffer2
	ld bc, 12
	call FarCopyBytes
	ret
; 90233 (24:4233)

WrongNumber: ; 90233
	db TRAINER_NONE, PHONE_00
	dba .script
.script
	writetext .text
	end
.text
	; Huh? Sorry, wrong number!
	text_jump UnknownText_0x1c5565
	db "@"
; 90241

Script_ReceivePhoneCall: ; 0x90241
	refreshscreen
	callasm RingTwice_StartCall
	ptcall wPhoneScriptPointer
	waitbutton
	callasm HangUp
	closetext
	callasm InitCallReceiveDelay
	end
; 0x90255

Script_SpecialBillCall:: ; 0x90255
	callasm .LoadBillScript
	jump Script_ReceivePhoneCall

.LoadBillScript:
	ld e, PHONE_BILL
	jp LoadCallerScript
; 90261

UnknownScript_0x90261: ; 0x90261
	callasm .LoadElmScript
	pause 30
	jump Script_ReceivePhoneCall

.LoadElmScript:
	ld e, PHONE_ELM
	jp LoadCallerScript
; 9026f

RingTwice_StartCall: ; 9026f
	call .Ring
	call .Ring
	farcall TrainerRankings_PhoneCalls
	ret
; 9027c

.Ring: ; 9027c (24:427c)
	call Phone_StartRinging
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName
	ret

Phone_CallerTextboxWithName: ; 90292 (24:4292)
	ld a, [wCurrentCaller]
	ld b, a
	call Function90363
	ret

PhoneCall:: ; 9029a
	ld a, b
	ld [PhoneScriptBank], a
	ld a, e
	ld [PhoneCaller], a
	ld a, d
	ld [PhoneCaller + 1], a
	call Phone_FirstOfTwoRings
	call Phone_FirstOfTwoRings
	farcall TrainerRankings_PhoneCalls
	ret
; 902b3

Phone_FirstOfTwoRings: ; 902b3
	call Phone_StartRinging
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName2
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName2
	ret
; 902c9

Phone_CallerTextboxWithName2: ; 902c9
	call Phone_CallerTextbox
	hlcoord 1, 2
	ld [hl], "<PHONE>"
	inc hl
	inc hl
	ld a, [PhoneScriptBank]
	ld b, a
	ld a, [PhoneCaller]
	ld e, a
	ld a, [PhoneCaller + 1]
	ld d, a
	call FarPlaceString
	ret
; 902e3


Phone_NoSignal: ; 902e3 (24:42e3)
	ld de, SFX_NO_SIGNAL
	call PlaySFX
	jr Phone_CallEnd

HangUp:: ; 902eb
	call HangUp_Beep
	call HangUp_Wait20Frames
Phone_CallEnd:
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	ret
; 90316

Function90316: ; 90316
	ld de, SFX_SHUT_DOWN_PC
	call PlaySFX
	ret
; 9031d

HangUp_Beep: ; 9031d
	ld hl, UnknownText_0x9032a
	call PrintText
	ld de, SFX_HANG_UP
	call PlaySFX
	ret
; 9032a

UnknownText_0x9032a: ; 9032a
	text_jump UnknownText_0x1c5580
	db "@"
; 9032f


HangUp_BoopOn: ; 9032f
	ld hl, UnknownText_0x90336
	call PrintText
	ret
; 90336

UnknownText_0x90336: ; 0x90336
	text_jump UnknownText_0x1c5588
	db "@"
; 0x9033b


HangUp_BoopOff: ; 9033b
	call SpeechTextBox
	ret
; 9033f

Phone_StartRinging: ; 9033f
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	call Phone_CallerTextbox
	call UpdateSprites
	farcall PhoneRing_CopyTilemapAtOnce
	ret
; 90355

HangUp_Wait20Frames: ; 90355
	jr Phone_Wait20Frames

Phone_Wait20Frames
	ld c, 20
	call DelayFrames
	farcall PhoneRing_CopyTilemapAtOnce
	ret
; 90363


Function90363: ; 90363 (24:4363)
	push bc
	call Phone_CallerTextbox
	hlcoord 1, 1
	ld [hl], "<PHONE>"
	inc hl
	inc hl
	ld d, h
	ld e, l
	pop bc
	call Function90380
	ret


Phone_CallerTextbox: ; 90375
	hlcoord 0, 0
	ld b, 2
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ret
; 90380


Function90380: ; 90380 (24:4380)
	ld h, d
	ld l, e
	ld a, b
	call GetCallerTrainerClass
	call GetCallerName
	ret

CheckCanDeletePhoneNumber: ; 9038a (24:438a)
	ld a, c
	call GetCallerTrainerClass
	ld a, c
	; and a
	ret nz
	ld a, b
	cp PHONECONTACT_MOM
	ret z
	cp PHONECONTACT_ELM
	ret z
	ld c, $1
	ret

GetCallerTrainerClass: ; 9039a
	push hl
	ld hl, PhoneContacts + PHONE_CONTACT_TRAINER_CLASS
	ld bc, PHONE_TABLE_WIDTH
	call AddNTimes
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ret
; 903a9


GetCallerName: ; 903a9 (24:43a9)
	ld a, c
	and a
	jr z, .NotTrainer

	call Phone_GetTrainerName
	push hl
	push bc
	call PlaceString
	ld a, ":"
	ld [bc], a
	pop bc
	pop hl
	ld de, SCREEN_WIDTH + 3
	add hl, de
	call Phone_GetTrainerClassName
	call PlaceString
	ret

.NotTrainer:
	push hl
	ld c, b
	ld b, 0
	ld hl, NonTrainerCallerNames
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	call PlaceString
	ret
; 903d6 (24:43d6)

NonTrainerCallerNames: ; 903d6
	dw .none
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .buena

.none db "----------@"
.mom db "MOM:@"
.bill db "BILL:@"
.elm db "PROF.ELM:@"
.bikeshop db "BIKE SHOP:@"
.buena db "BUENA:", $22, "   DISC JOCKEY@"
; 90423

Phone_GetTrainerName: ; 90423 (24:4423)
	push hl
	push bc
	farcall GetTrainerName
	pop bc
	pop hl
	ret

Phone_GetTrainerClassName: ; 9042e (24:442e)
	push hl
	push bc
	farcall GetTrainerClassName
	pop bc
	pop hl
	ret

GetCallerLocation: ; 90439
	ld a, [wCurrentCaller]
	call GetCallerTrainerClass
	ld d, c
	ld e, b
	push de
	ld a, [wCurrentCaller]
	ld hl, PhoneContacts + PHONE_CONTACT_MAP_GROUP
	ld bc, PHONE_TABLE_WIDTH
	call AddNTimes
	ld b, [hl]
	inc hl
	ld c, [hl]
	push bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	pop bc
	pop de
	ret
; 9045f


INCLUDE "data/phone/phone_contacts.asm"

INCLUDE "data/phone/special_calls.asm"


UnknownScript_0x90657: ; 0x90657
	writetext UnknownText_0x9065b
	end
; 0x9065b

UnknownText_0x9065b: ; 0x9065b
	; That number is out of the area.
	text_jump UnknownText_0x1c558b
	db "@"
; 0x90660

PhoneScript_JustTalkToThem: ; 0x90660
	writetext UnknownText_0x90664
	end
; 0x90664

UnknownText_0x90664: ; 0x90664
	; Just go talk to that person!
	text_jump UnknownText_0x1c55ac
	db "@"
; 0x90669

UnknownScript_0x90669: ; 0x90669
	writetext UnknownText_0x9066d
	end
; 0x9066d

UnknownText_0x9066d: ; 0x9066d
	; Thank you!
	text_jump UnknownText_0x1c55ca
	db "@"
; 0x90672
