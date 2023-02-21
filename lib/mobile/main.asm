; A library included as part of the Mobile Adapter GB SDK.

setcharmap ascii

; Mobile Adapter protocol commands
DEF MOBILE_COMMAND_BEGIN_SESSION            EQU $10
DEF MOBILE_COMMAND_END_SESSION              EQU $11
DEF MOBILE_COMMAND_DIAL_TELEPHONE           EQU $12
DEF MOBILE_COMMAND_HANG_UP_TELEPHONE        EQU $13
DEF MOBILE_COMMAND_WAIT_FOR_TELEPHONE_CALL  EQU $14
DEF MOBILE_COMMAND_TRANSFER_DATA            EQU $15
DEF MOBILE_COMMAND_TELEPHONE_STATUS         EQU $17
DEF MOBILE_COMMAND_READ_CONFIGURATION_DATA  EQU $19
DEF MOBILE_COMMAND_WRITE_CONFIGURATION_DATA EQU $1a
DEF MOBILE_COMMAND_TRANSFER_DATA_END        EQU $1f
DEF MOBILE_COMMAND_ISP_LOGIN                EQU $21
DEF MOBILE_COMMAND_ISP_LOGOUT               EQU $22
DEF MOBILE_COMMAND_OPEN_TCP_CONNECTION      EQU $23
DEF MOBILE_COMMAND_CLOSE_TCP_CONNECTION     EQU $24
DEF MOBILE_COMMAND_DNS_QUERY                EQU $28
DEF MOBILE_COMMAND_ERROR                    EQU $6e


SECTION "Mobile Adapter SDK", ROMX

MobileSDK_CopyBytes:
; Copy b bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

MobileSDK_CopyString:
; Copy bytes from hl to de until a 0 is encountered.
; Include the 0 in the copy, and count the number of
; nonzero bytes copied.  Keep the de pointer at the
; copied zero.
.loop
	ld a, [hli]
	ld [de], a
	or a
	ret z
	inc de
	inc bc
	jr .loop

MobileSDK_CopyStringLen:
; Copy bytes from hl to de until a 0 is encountered,
; or a bytes have been copied, whichever comes first.
; Add the byte count to the count previously stored
; in bc.
	push bc
	ld c, $0
	ld b, a
	dec b
.loop
	ld a, [hli]
	ld [de], a
	or a
	jr z, .done
	inc de
	inc c
	dec b
	jr nz, .loop
	xor a
	ld [de], a

.done
	ld a, c
	pop bc
	add c
	ld c, a
	ld a, b
	adc 0
	ld b, a
	ret

ResetReceivePacketBuffer:
; Clear two bytes at wMobileSDK_ReceivedBytes
	xor a
	ld hl, wMobileSDK_ReceivedBytes
	ld [hli], a
	ld [hl], a
	ret

_MobileAPI::
; Use the byte at wMobileAPIIndex as a parameter
; for a dw.
; If [wMobileAPIIndex] not in {MOBILEAPI_06, MOBILEAPI_07, MOBILEAPI_08},
; clear [wc835].
	push de
	ld a, [wMobileAPIIndex]
	cp MOBILEAPI_06
	jr z, .noreset
	cp MOBILEAPI_07
	jr z, .noreset
	cp MOBILEAPI_08
	jr z, .noreset
	xor a
	ld [wc835], a
	ld a, [wMobileAPIIndex]
.noreset
	; Get the pointer
	ld d, 0
	ld e, a
	ld hl, .dw
	add hl, de
	; Store the low byte in [wMobileAPIIndex]
	ld a, [hli]
	ld [wMobileAPIIndex], a
	ld a, [hl]
	; restore de
	pop de
	ld hl, ReturnMobileAPI ; return here
	push hl
	; If the destination function is not Function110236,
	; call Function1100b4.
	ld h, a
	ld a, [wMobileAPIIndex]
	ld l, a
	push hl
	ld a, LOW(Function110236)
	cp l
	jr nz, .okay
	ld a, HIGH(Function110236)
	cp h
.okay
	call nz, Function1100b4
	ld hl, wc986
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret ; indirectly jump to the function loaded from the dw, which returns to ReturnMobileAPI.

.dw
	dw Function110115
	dw Function110236
	dw Function110291
	dw Function1103ac
	dw Function110438
	dw Function1104c6
	dw Function110578
	dw Function110582
	dw Function11058c
	dw Function1105dd
	dw Function1106ef
	dw Function110757
	dw Function1107ff
	dw Function110899
	dw Function1108a3
	dw Function110905
	dw Function1109a4
	dw Function1109f9
	dw Function110a5b
	dw Function110c3c
	dw Function110c9e
	dw Function110ddd
	dw Function1111fe
	dw Function1113fe
	dw MobileAPI_SetTimer
	dw MobileAPI_TelephoneStatus
	dw Function111596
	dw Function11162d
	dw Function11032c
	dw Function11148c
	dw Function111610
	dw Function1103ac
	dw Function110235
	dw Function111540

Function1100b4:
	push bc
.loop
	di
	ld a, [wc800]
	ld b, a
	ld a, [wc80b]
	ld c, a
	ld a, [wc822]
	ei
	or a
	bit 0, a
	jr z, .done
	ld a, b
	or a
	jr nz, .loop
	ld a, c
	cp $4
	jr z, .loop
	xor a
	ld [wc80f], a
	ld hl, wc821
	set 1, [hl]
	scf
.done
	pop bc
	ret

MobileAPI_SetTimer:
	xor a
	ldh [rTAC], a
	ld e, c
	ld b, a
	ld hl, Unknown_112089
	add hl, bc
	ld c, [hl]
	inc hl
	ldh a, [rKEY1]
	bit 7, a
	jr nz, .asm_1100f9
	ld a, e
	sra c
	ld a, e
	cp $4
	jr nc, .asm_1100f9
	ld de, $000f
	add hl, de

.asm_1100f9
	ld a, c
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, [hli]
	ld [wc81f], a
	ld [wc816], a
	ld a, [hl]
	ld [wc820], a
	ld [wc815], a
	ld c, LOW(rTAC)
	ld a, rTAC_65536_HZ
	ldh [c], a
	ld a, 1 << rTAC_ON | rTAC_65536_HZ
	ldh [c], a
	ret

Function110115:
	ld hl, wc821
	bit 1, [hl]
	jr nz, .asm_110120
	xor a
	ld l, a
	ld h, a
	ret

.asm_110120
	res 1, [hl]
	ld a, [wc80f]
	ld e, a
	cp $22
	jr z, .asm_11016a
	cp $23
	jr z, .asm_11016a
	cp $25
	jr z, .asm_11016a
	cp $26
	jr z, .asm_11018e
	cp $24
	jr z, .asm_1101a4
	cp $30
	jp z, .asm_1101f8
	cp $31
	jp z, .asm_11020d
	cp $32
	jr z, .asm_1101a4
	cp $33
	jr z, .asm_1101a4
	swap a
	and $f
	cp $1
	jr z, .asm_11016a
	cp $0
	jr z, .asm_11015d
.asm_110158
	ld hl, 0
.asm_11015b
	ld a, e
	ret

.asm_11015d
	ld a, e
	add $15
	ld e, a
	xor a
	ld hl, wc810
	ld [hli], a
	ld [hl], a
	ld hl, wc821

.asm_11016a
	xor a
	ld [wc86d], a
	ld [hl], a
	ld [wc807], a
	inc a
	ld [wc86a], a
	ld hl, wc822
	res 0, [hl]
	res 5, [hl]
	ld hl, wMobileSDK_PacketBuffer
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	call Function111686
	ld a, $15
	cp e
	jr nz, .asm_110158
	jr .asm_1101d7

.asm_11018e
	ld a, [wc821]
	bit 4, a
	ld a, $1
	jr z, .asm_11016a
	ld a, $2
	ld [wc86a], a
	ld a, [wc805]
	ld [wc807], a
	jr .asm_110158

.asm_1101a4
	res 0, [hl]
	ld hl, wc822
	res 5, [hl]
	ld hl, wc821
	res 7, [hl]
	res 6, [hl]
	set 5, [hl]
	xor a
	ld [wc86d], a
	ld [wc9af], a
	ld a, $2
	ld [wc86a], a
	ld a, $4
	ld [wc807], a
	ld a, e
	cp $32
	jr z, .asm_1101d7
	cp $33
	jr z, .asm_1101d7
	cp $30
	jr z, .asm_1101d7
	cp $31
	jp nz, .asm_110158

.asm_1101d7
	ld hl, wc810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $32
	cp e
	jp nz, .asm_11015b
	ld a, $3
	cp h
	jp nz, .asm_11015b
	dec a
	cp l
	jr z, .asm_1101f2
	dec a
	cp l
	jp nz, .asm_11015b

.asm_1101f2
	ld bc, wc880
	jp .asm_11015b

.asm_1101f8
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $a4
	jr z, .asm_1101a4
	ld a, $3
	ld [wc86a], a
	ld hl, wc810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp .asm_11015b

.asm_11020d
	ld a, [wc810]
	cp $2
	jr z, .asm_1101a4
	cp $3
	jr z, .asm_1101a4
	ld a, $4
	ld [wc86a], a
	ld hl, wc810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp .asm_11015b

Function110226:
	ld a, $21

Function110228:
	ld [wc80f], a
	ld hl, wc821
	set 1, [hl]
	ret

Function110231:
	ld a, $20
	jr Function110228

Function110235:
	nop

Function110236:
	ld a, [wMobileAPIIndex]
	push af
	push bc
	push hl
	xor a
	ldh [rTAC], a
	ldh a, [rIF]
	and $1b
	ldh [rIF], a
	call ResetReceivePacketBuffer
	ld bc, $0452
	ld hl, wc800
.asm_11024e
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_11024e
	ld a, [wc822]
	set 6, a
	ld [wc822], a
	pop hl
	ld a, l
	ld [wc981], a
	ld a, h
	ld [wc982], a
	pop bc
	ld hl, wc983
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, wc86e
	ld a, e
	ld [hli], a
	ld [hl], d
	xor a
	ld [wc819], a
	ld c, $c
	call MobileAPI_SetTimer
	call Function1104b0
	pop af
	cp $35
	jr nz, .asm_110289
	ld a, $2b
	jr .asm_11028b

.asm_110289
	ld a, $a

.asm_11028b
	ld [wc86a], a
	jp Function110432

Function110291:
	ld a, [wc821]
	bit 1, a
	jr z, .asm_1102a6
	ld a, [wc80f]
	cp $14
	jr z, .asm_1102b3
	cp $25
	jr z, .asm_1102b3
	ld a, [wc821]

.asm_1102a6
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $1
	jp nz, Function110226

.asm_1102b3
	xor a
	ldh [rTAC], a
	xor a
	ld [wc819], a
	ld a, l
	ld b, h
	ld hl, wc880
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld hl, wc829
	ld a, LOW(wc872)
	ld [hli], a
	ld a, HIGH(wc872)
	ld [hl], a
	ld de, wMobileSDK_PacketBuffer
	ld b, MobilePacket_WriteConfigurationData.End - MobilePacket_WriteConfigurationData
	ld hl, MobilePacket_WriteConfigurationData
	call MobileSDK_CopyBytes
	ld a, [wc882]
	ld c, a
	or a
	jr z, .asm_1102f2
	cp $80
	jr nc, .asm_1102f2
	ld c, $80
	jr .asm_1102f4

.asm_1102f2
	ld a, $80

.asm_1102f4
	ld b, a
	inc a
	ld [de], a
	inc de
	ld a, $80
	add c
	ld hl, wc882
	ld [hli], a
	ld a, [hl]
	ld [de], a
	inc de
	add $80
	ld [hl], a
	ld hl, wc880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, b
	call MobileSDK_CopyBytes
	ld a, l
	ld [wc880], a
	ld a, h
	ld [wc880 + 1], a
	ld b, c
	inc b
	call Function111f63
	call Function1104b0
	ld a, $2e
	ld [wc86a], a
	ld hl, wc821
	res 1, [hl]
	set 0, [hl]
	ret

Function11032c:
	ld a, [wc821]
	bit 1, a
	jp nz, Function110226
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $1
	jp nz, Function110226
	xor a
	ldh [rTAC], a
	ld [wc819], a
	ld hl, wc880
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld de, wMobileSDK_PacketBuffer
	ld b, 6 ; header size
	ld hl, MobilePacket_ReadConfigurationDataPart1
	call MobileSDK_CopyBytes
	ld a, [wc883]
	ld [de], a
	inc de
	ld a, [wc882]
	ld c, a
	or a
	jr z, .asm_11037f
	cp $80
	jr nc, .asm_11037f
	ld c, $80
	jr .asm_110381

.asm_11037f
	ld a, $80

.asm_110381
	ld [de], a
	inc de
	ld b, $2
	call Function111f63
	call Function1104b0
	ld a, $2d
	ld [wc86a], a
	jp Function110432

Function110393:
	ld c, LOW(rIE)
	ldh a, [c]
	or (1 << SERIAL) | (1 << TIMER)
	ldh [c], a
	ret

Function11039a:
	ld b, $0
.asm_11039c
	inc b
	jr z, .asm_1103a3
	ld a, [hli]
	or a
	jr nz, .asm_11039c

.asm_1103a3
	ld a, b
	cp c
	jr nc, .asm_1103aa
	cp $2
	ret

.asm_1103aa
	scf
	ret

Function1103ac:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $1
	jp nz, Function110226
	push hl
	ld c, $15
	call Function11039a
	jr c, .asm_1103d2
	ld c, $22
	call Function11039a
	jr c, .asm_1103d2
	ld c, $12
	call Function11039a
	jr nc, .isp_login

.asm_1103d2
	pop hl
	jp Function110231

.isp_login
	xor a
	ldh [rTAC], a
	ld [wc86d], a
	ld [wc97a], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld hl, wc829
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hl], a
	call Mobile_DialTelephone
	push hl
	ld b, a
	call Function111f63
	ld b, MobilePacket_ISPLogin.End - MobilePacket_ISPLogin
	ld hl, MobilePacket_ISPLogin
	ld de, wMobileSDK_PacketBuffer + 45
	call MobileSDK_CopyBytes
	inc de
	inc de
	pop hl
	ld bc, 0
	call MobileSDK_CopyString
	ld a, c
	ld [wMobileSDK_PacketBuffer + 51], a
	ld [wc86b], a
	push de
	inc de
	ld bc, 0
	ld a, $20
	call MobileSDK_CopyStringLen
	ld l, e
	ld h, d
	pop de
	ld a, c
	ld [de], a
	ld a, [wc86b]
	add c
	add $a
	ld [wMobileSDK_PacketBuffer + 50], a
	call Function1104b0
	ld a, $b
	ld [wc86a], a

Function110432:
	ld hl, wc821
	set 0, [hl]
	ret

Function110438:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $1
	jp nz, Function110226
	push hl
	ld c, $15
	call Function11039a
	jr nc, .asm_110454
	pop hl
	jp Function110231

.asm_110454
	xor a
	ldh [rTAC], a
	ld [wc97a], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld hl, wc98f
	ld a, LOW(wc880 + 1)
	ld [hli], a
	ld a, HIGH(wc880 + 1)
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $ff
	ld [wc86e], a
	call Mobile_DialTelephone
	ld b, a
	call Function111f63
	call Function1104b0
	ld a, $c
	ld [wc86a], a
	jr Function110432

Mobile_DialTelephone:
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_DialTelephone
	ld b, MobilePacket_DialTelephone.End - MobilePacket_DialTelephone
	call MobileSDK_CopyBytes
	pop bc
	pop hl
	push bc
	ld a, [wMobileSDK_AdapterType]
	cp $8c
	jr c, .asm_11049e
	ld a, $3
	jr .asm_1104a1

.asm_11049e
	ld a, [wc871]

.asm_1104a1
	ld [de], a
	inc de
	ld bc, $0001
	ld a, MOBILE_PHONE_NUMBER_LENGTH
	call MobileSDK_CopyStringLen
	ld a, c
	ld [wMobileSDK_PacketBuffer + 5], a
	ret

Function1104b0:
	xor a
	ld [wMobileSDK_SendCommandID], a
	call Function110393
	xor a
	ld [wc86b], a
	ld de, MobilePacket_Idle.End - MobilePacket_Idle
	ld hl, MobilePacket_Idle
	ld b, 1
	jp PacketSendBytes

Function1104c6:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jr z, .asm_110526
	cp $3
	jr z, .asm_110526
	cp $2
	jp nz, Function110226
	ld hl, wc822
	bit 4, [hl]
	jr nz, .asm_110507
	ld a, $2
	ld [wc86b], a
	ld a, MOBILE_COMMAND_ISP_LOGOUT | $80
	ld [wMobileSDK_SendCommandID], a
	ld de, MobilePacket_ISPLogout.End - MobilePacket_ISPLogout
	ld hl, MobilePacket_ISPLogout
	ld b, $5
	call PacketSendBytes
.asm_1104fa
	ld a, $e
	ld [wc86a], a
	ld hl, wc821
	set 0, [hl]
	res 3, [hl]
	ret

.asm_110507
	ld a, [wc807]
	or a
	jr nz, .asm_11051f
	ld a, $1
	ld [wc86a], a
	ld hl, wc822
	res 4, [hl]
	ld hl, wc821
	ld a, [hl]
	and $17
	ld [hl], a
	ret

.asm_11051f
	ld a, $2
	ld [wc86b], a
	jr .asm_1104fa

.asm_110526
	call Function112724
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer + 32
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $7
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120c1
	call MobileSDK_CopyString
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $e
	ld [wc86a], a
	jp Function110432

Function110578:
	ld b, $25
	call Function110596
	or a
	jp nz, Function1135ba
	ret

Function110582:
	ld b, $26
	call Function110596
	or a
	jp nz, Function11359d
	ret

Function11058c:
	ld b, $27
	call Function110596
	or a
	jp nz, Function1135ad
	ret

Function110596:
	ld a, [wc821]
	bit 0, a
	jr nz, .asm_1105d9
	ld a, [wc86a]
	cp $1
	jr nz, .asm_1105d9
	ld a, [wc835]
	or a
	ret nz
	ld a, b
	ld [wcb36], a
	xor a
	ldh [rTAC], a
	ld a, e
	ld [wc86e], a
	ld a, d
	ld [wc86e + 1], a
	xor a
	ld [wc819], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld hl, wc829
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hl], a
	call Function1104b0
	ld a, [wcb36]
	ld [wc86a], a
	xor a
	jp Function110432

.asm_1105d9
	pop hl
	jp Function110226

Function1105dd:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $1
	jp nz, Function110226
	xor a
	ldh [rTAC], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	ld hl, wc98f
	ld a, LOW(wc880 + 1)
	ld [hli], a
	ld a, HIGH(wc880 + 1)
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $ff
	ld [wc86e], a
	call Function1104b0
	ld a, $d
	ld [wc86a], a
	jp Function110432

Function110615:
	ld b, $15
	ld [wc86e], a
	or a
	jr z, .asm_110625
	dec a
	jr z, .asm_11062c
	dec a
	jp z, .asm_1106c1
	ret

.asm_110625
	ld a, $19
	ld hl, wc83e
	jr .asm_110631

.asm_11062c
	ld a, $6e
	ld hl, wc852

.asm_110631
	push hl
	push bc
	ld [wMobileSDK_PacketBuffer + 91], a
	ld hl, wc829
	ld a, LOW(wMobileSDK_PacketBuffer + 86)
	ld [hli], a
	ld a, HIGH(wMobileSDK_PacketBuffer + 86)
	ld [hl], a
	xor a
	ld [wMobileSDK_PacketBuffer + 90], a
	ld [wc86b], a
	ld [wc9af], a
	ld de, wMobileSDK_PacketBuffer + 80
	ld hl, MobilePacket_OpenTCPConnection
	ld b, MobilePacket_OpenTCPConnection.End - MobilePacket_OpenTCPConnection
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_DNSQuery
	ld b, MobilePacket_DNSQuery.End - MobilePacket_DNSQuery
	call MobileSDK_CopyBytes
	pop bc
	pop hl
	push de
	inc de
	ld a, b
	ld bc, 0
	call MobileSDK_CopyStringLen
	ld a, c
	pop hl
	ld [hl], a
	ld b, c
	call Function111f63
	ld a, [wc86e]
	cp $2
	jr nz, .asm_1106ac
	ld a, [wMobileSDK_ReceivePacketBuffer + 128]
	or a
	jr z, .asm_1106ac
	ld hl, wc995
	ld a, [hli]
	cp $99
	jr nz, .asm_1106ac
	ld a, [hli]
	cp $66
	jr nz, .asm_1106ac
	ld a, [hli]
	cp $23
	jr nz, .asm_1106ac
	ld a, $2
	ld [wc86e], a
	dec a
	ld [wc86b], a
	ld a, $a3
	ld de, $0010
	ld hl, wc995
	call Function111f02
	ld a, $f
	ld [wc86a], a
	jp Function110432

.asm_1106ac
	ld hl, wMobileSDK_PacketBuffer
	ld a, MOBILE_COMMAND_DNS_QUERY | $80
	ld [wMobileSDK_SendCommandID], a
	ld b, $5
	call PacketSendBytes
	ld a, $f
	ld [wc86a], a
	jp Function110432

.asm_1106c1
	ld b, $50
	ld hl, wc876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0007
	add hl, de
	ld de, wc8ff
.asm_1106d0
	ld a, [hli]
	ld [de], a
	cp $2f
	jr z, .asm_1106da
	inc de
	dec b
	jr nz, .asm_1106d0

.asm_1106da
	xor a
	ld [de], a
	dec hl
	ld a, l
	ld [wc876], a
	ld a, h
	ld [wc877], a
	ld hl, wc8ff
	ld a, $50
	ld b, $40
	jp .asm_110631

Function1106ef:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $2
	jp nz, Function110226
	ld a, [wc86d]
	or a
	jp nz, Function110226
	push hl
	ld c, $20
	call Function11039a
	jr nc, .asm_110712
	pop hl
	jp Function110231

.asm_110712
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer + 96
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 112
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	inc de
	inc de
	ld bc, $0001
	ld hl, Unknown_11209e
	call MobileSDK_CopyString
	pop hl
	push hl
	ld b, $ff
.asm_11073b
	inc b
	ld a, [hli]
	or a
	jr z, .asm_110744
	cp $40
	jr nz, .asm_11073b

.asm_110744
	ld a, c
	add b
	add $2
	ld [wMobileSDK_PacketBuffer + 117], a
	pop hl
	call MobileSDK_CopyBytes
	call Function11295e
	ld a, $0
	jp Function110615

Function110757:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $3
	jp nz, Function110226
	ld a, [wc98a]
	or a
	jp nz, Function110226
	push hl
.asm_11076f
	ld a, [hli]
	or a
	jr nz, .asm_11076f
	ld a, [hl]
	or a
	jp z, .asm_1107fb
	pop hl
	push hl
	ld c, $20
	call Function11039a
	jr c, .asm_1107fb
.asm_110781
	ld c, $81
	call Function11039a
	jr c, .asm_1107fb
	xor a
	cp [hl]
	jr nz, .asm_110781
	call Function112724
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer + 12
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 18
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld de, wMobileSDK_PacketBuffer + 19
	ld hl, Unknown_1120a4
	call MobileSDK_CopyString
	pop hl
	call MobileSDK_CopyString
	ld a, $3e
	ld [de], a
	inc de
	inc c
	ld a, l
	ld [wc87c], a
	ld a, h
	ld [wc87d], a
	call Function11295e
	ld a, c
	ld [wMobileSDK_PacketBuffer + 17], a
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer + 12
	ld d, $0
	ld e, c
	ld b, $5
	call PacketSendBytes
	ld a, $15
	ld [wc86a], a
	jp Function110432

.asm_1107fb
	pop hl
	jp Function110231

Function1107ff:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $3
	jp nz, Function110226
	ld a, [wc98a]
	or a
	jp z, Function110226
	ld a, c
	or b
	jp z, Function110231
	ld a, l
	ld [wc87c], a
	ld a, h
	ld [wc87d], a
	ld hl, wc87e
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [wc86e + 1], a
	call Function112724
	ld hl, wc98a
	ld a, [hl]
	and $1
	xor $1
	ld [wc86b], a
	inc [hl]
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 6
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer + 150
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 156
	ld a, [wc86c]
	ld [de], a
	ld a, [wc86b]
	or a
	jr nz, .asm_110891
	ld bc, $0001
	ld de, wMobileSDK_PacketBuffer + 157
	ld hl, Unknown_1120ba
	call MobileSDK_CopyString
	ld a, c
	ld [wMobileSDK_PacketBuffer + 155], a
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld de, $0011
	ld hl, wMobileSDK_PacketBuffer + 150
	ld b, $5
	call PacketSendBytes

.asm_110891
	ld a, $16
	ld [wc86a], a
	jp Function110432

Function110899:
	ld a, [wc86a]
	cp $3
	jp nz, Function110226
	jr Function1108ab

Function1108a3:
	ld a, [wc86a]
	cp $4
	jp nz, Function110226

Function1108ab:
	ld hl, wc821
	bit 0, [hl]
	jp nz, Function110226
	call Function112724
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer + 32
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $7
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120c1
	call MobileSDK_CopyString
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $17
	ld [wc86a], a
	jp Function110432

Function110905:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $2
	jp nz, Function110226
	ld a, [wc86d]
	or a
	jp nz, Function110226
	xor a
	ld [wc86b], a
	push hl
	ld c, $20
	call Function11039a
	jr c, .asm_11092f
	ld c, $22
	call Function11039a
	jr nc, .asm_110933

.asm_11092f
	pop hl
	jp Function110231

.asm_110933
	ld de, wMobileSDK_PacketBuffer + 96
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	inc de
	inc de
	ld hl, Unknown_1120c8
	call MobileSDK_CopyString
	pop hl
	push hl
	ld b, $ff
.asm_11094a
	inc b
	ld a, [hli]
	or a
	jr z, .asm_110953
	cp $40
	jr nz, .asm_11094a

.asm_110953
	ld a, b
	add $6
	ld c, a
	ld [wMobileSDK_PacketBuffer + 101], a
	pop hl
	ld de, wMobileSDK_PacketBuffer + 108
	call MobileSDK_CopyBytes
.asm_110961
	ld a, [hli]
	or a
	jr nz, .asm_110961
	call Function11295e
	ld a, c
	ld [wMobileSDK_PacketBuffer + 101], a
	ld bc, $0006
	ld de, wMobileSDK_PacketBuffer + 172
	ld a, $20
	call MobileSDK_CopyStringLen
	call Function11295e
	ld a, c
	ld [wMobileSDK_PacketBuffer + 165], a
	ld de, wMobileSDK_PacketBuffer + 160
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 167
	ld hl, Unknown_1120ce
	ld b, $5
	call MobileSDK_CopyBytes
	ld de, wMobileSDK_PacketBuffer + 128
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, $1
	jp Function110615

Function1109a4:
	ld hl, wc821
	bit 0, [hl]
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jp nz, Function110226
	ld a, e
	ld [wc86e], a
	ld a, d
	ld [wc86e + 1], a
	xor a
	ld [wc86b], a
	call Function112729
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $7
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120d4
	call MobileSDK_CopyString
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $18
	ld [wc86a], a
	jp Function110432

Function1109f9:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jp nz, Function110226
	xor a
	ld [wc86b], a
	ld a, e
	ld [wc86e], a
	ld a, d
	ld [wc86e + 1], a
	ld a, l
	or h
	jp z, Function110231
	push hl
	call Function112729
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $d
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120db
	call MobileSDK_CopyString
	ld de, wMobileSDK_PacketBuffer + 12
	pop hl
	call Function110d37
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $1d
	ld [wc86a], a
	jp Function110432

Function110a5b:
	ld a, [wc821]
	bit 2, a
	jr z, .asm_110a6d
	ld a, [wc86a]
	cp $1a
	jp nz, Function110226
	jp Function110af4

.asm_110a6d
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [wc86e], a
	ld a, h
	ld [wc86e + 1], a
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	dec bc
	dec bc
	ld hl, wc98f
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, wc829
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $d
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120e8
	call MobileSDK_CopyString
	ld de, wMobileSDK_PacketBuffer + 12
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $1a
	ld [wc86a], a
	jp Function110432

Function110af4:
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld e, [hl]
	ld a, b
	or c
	ld [wc86e], a
	ld [wc86e + 1], a
	jr z, .asm_110b5c
	dec bc
	dec bc
	ld a, [wc993]
	or a
	jp nz, .asm_110bd5
	ld a, [wc994]
	or a
	jr z, .asm_110b1c
	ld e, a

.asm_110b1c
	xor a
	ld [wc994], a
	cp b
	jr nz, .asm_110b5c
	ld a, e
	cp c
	jr c, .asm_110b5c
	push bc
	sub c
	ld [hl], a
	ld b, c
	ld hl, wc82d
	ld a, [wc993]
	add c
	ld [hli], a
	ld a, b
	adc 0
	ld [hl], a
	xor a
	ld [wc993], a
	ld hl, wMobileSDK_ReceivePacketBuffer + 3
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	pop bc
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ret

.asm_110b5c
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wc82d
	ld a, [wc993]
	add e
	ld [hli], a
	ld a, 0
	adc 0
	ld [hl], a
	xor a
	ld [wc993], a
	ld a, [wc86e]
	or a
	jr z, .asm_110b9b
	ld b, e
	ld hl, wMobileSDK_ReceivePacketBuffer + 3
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a

.asm_110b9b
	call Function1127f3
	jr z, .asm_110bbb
	di
	ld hl, wc821
	res 2, [hl]
	ld a, $1
	ld [wc86b], a
	ld de, $000b
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer + 128
	ld b, $5
	jp PacketSendBytes

.asm_110bbb
	ld a, $4
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	res 2, [hl]
	ld hl, wc827
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wc82d
	ld b, $2
	jp MobileSDK_CopyBytes

.asm_110bd5
	ld e, a
	xor a
	cp b
	jr nz, .asm_110c05
	ld a, e
	cp c
	jr c, .asm_110c05
	ld b, c
	ld hl, wc993
	ld a, [hl]
	sub c
	ld [hl], a
	ld a, $80
	sub e
	ld e, a
	ld d, 0
	ld hl, wc880
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_110c05
	push hl
	push bc
	ld a, [wc993]
	ld b, a
	ld a, $80
	sub e
	ld e, a
	ld d, 0
	ld hl, wc880
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	ld a, e
	ld [wc829], a
	ld a, d
	ld [wc829 + 1], a
	pop bc
	ld a, [wc993]
	ld e, a
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, [wc994]
	ld e, a
	pop hl
	jp .asm_110b1c

Function110c3c:
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [wc86e], a
	ld a, h
	ld [wc86e + 1], a
	call Function112729
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $d
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120f5
	call MobileSDK_CopyString
	ld de, wMobileSDK_PacketBuffer + 12
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $1b
	ld [wc86a], a
	jp Function110432

Function110c9e:
	ld a, [wc821]
	bit 2, a
	jr z, .asm_110cb0
	ld a, [wc86a]
	cp $1c
	jp nz, Function110226
	jp Function110af4

.asm_110cb0
	bit 0, a
	jp nz, Function110226
	ld a, [wc86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [wc86e], a
	ld a, h
	ld [wc86e + 1], a
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	dec bc
	dec bc
	ld hl, wc98f
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, wc829
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	ld a, $e
	ld [de], a
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_112102
	call MobileSDK_CopyString
	ld de, wMobileSDK_PacketBuffer + 11
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $1c
	ld [wc86a], a
	jp Function110432

Function110d37:
	push bc
	push de
	ld b, 0
.check_under_10k
	ld a, HIGH(10000)
	cp h
	jr c, .subtract_10k
	jr nz, .done_10k
	ld a, LOW(10000)
	cp l
	jr z, .subtract_10k
	jr nc, .done_10k

.subtract_10k
	inc b
	ld a, b
	ld bc, -10000
	add hl, bc
	ld b, a
	jr .check_under_10k

.done_10k
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, 0
.check_under_1k
	ld a, HIGH(1000)
	cp h
	jr c, .subtract_1k
	jr nz, .done_1k
	ld a, LOW(1000)
	cp l
	jr z, .subtract_1k
	jr nc, .done_1k

.subtract_1k
	inc b
	ld a, b
	ld bc, -1000
	add hl, bc
	ld b, a
	jr .check_under_1k

.done_1k
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, 0
.check_under_100
	ld a, HIGH(100)
	cp h
	jr nz, .subtract_100
	ld a, LOW(100)
	cp l
	jr z, .subtract_100
	jr nc, .check_under_10

.subtract_100
	inc b
	ld a, b
	ld bc, -100
	add hl, bc
	ld b, a
	jr .check_under_100

.check_under_10
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, $0
	ld a, l
.subtract_10
	cp 10
	jr c, .done_10
	sub 10
	inc b
	jr .subtract_10

.done_10
	ld l, a
	ld a, $30
	or b
	ld [de], a
	inc de
	ld a, $30
	or l
	ld [de], a
	pop de
	ld l, e
	ld h, d
	ld b, $5
.find_first_digit
	ld a, [hl]
	cp $30
	jr nz, .found_first_digit
	inc hl
	dec b
	jr nz, .find_first_digit
	jr .done

.found_first_digit
	ld a, $5
	cp b
	jr z, .done
	sub b
	ld c, a
	ld a, [wMobileSDK_PacketBuffer + 5]
	sub c
	ld c, a
	ld [wMobileSDK_PacketBuffer + 5], a
	push hl
	ld b, $1
.penultimate_loop
	inc b
	ld a, [hli]
	cp $d
	jr nz, .penultimate_loop
	pop hl
	call MobileSDK_CopyBytes
	pop hl
	ret

.done
	pop bc
.last_loop
	ld a, [de]
	inc de
	cp $a
	jr nz, .last_loop
	ret

Function110ddd:
	ld a, [wc821]
	bit 2, a
	ld a, [wc86a]
	jr z, .asm_110e00
	cp $13
	jp z, Function111044
	cp $1f
	jp z, Function111044
	cp $21
	jp z, Function111044
	jp Function110226

.asm_110df9
	pop hl
.asm_110dfa
	pop hl
	pop hl
	pop hl
.asm_110dfd
	jp Function110231

.asm_110e00
	cp $2
	jp nz, Function110226
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86d]
	or a
	jp nz, Function110226
	ld a, l
	ld [wc9b5], a
	ld a, h
	ld [wc9b6], a
	xor a
	ld [wc989], a
	ld [wc9a5], a
	ld [wc98a], a
	ld [wc993], a
	ld a, [hli]
	ld [wc833], a
	ld a, [hli]
	ld [wc834], a
	inc hl
	inc hl
	ld a, l
	ld [wc97f], a
	ld a, h
	ld [wc980], a
	dec hl
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, LOW(wc880)
	cp l
	jr nz, .asm_110e4a
	ld a, HIGH(wc880)
	cp h
	jr z, .asm_110dfd

.asm_110e4a
	push hl
	push de
	push bc
	push hl
	ld b, URIPrefix.End - URIPrefix
	ld de, URIPrefix
.asm_110e53
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110df9
	inc hl
	dec b
	jr nz, .asm_110e53
	push hl
	ld b, HTTPUploadURL.End - HTTPUploadURL
	ld c, $0
	ld de, HTTPUploadURL
.asm_110e64
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110e70
	inc hl
	dec b
	jr nz, .asm_110e64
	pop hl
	jr .asm_110df9

.asm_110e70
	pop hl
	push hl
	ld b, HTTPRankingURL.End - HTTPRankingURL
	ld c, $0
	ld de, HTTPRankingURL
.asm_110e79
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110e86
	inc hl
	dec b
	jr nz, .asm_110e79
	pop hl
	jp .asm_110df9

.asm_110e86
	pop hl
	push hl
	ld b, HTTPUtilityURL.End - HTTPUtilityURL
	ld c, $0
	ld de, HTTPUtilityURL
.asm_110e8f
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110ea2
	inc hl
	dec b
	jr nz, .asm_110e8f
	pop hl
	ld a, $1
	ld [wc98a], a
	ld c, $1
	jr .asm_110eb3

.asm_110ea2
	pop hl
	ld b, HTTPDownloadURL.End - HTTPDownloadURL
	ld c, $0
	ld de, HTTPDownloadURL
.asm_110eaa
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110ecb
	inc hl
	dec b
	jr nz, .asm_110eaa

.asm_110eb3
	ld hl, wc97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $12
	call Function11039a
	jp c, .asm_110df9
	ld c, $12
	call Function11039a
	jp c, .asm_110df9
	ld c, $1

.asm_110ecb
	ld a, c
	ld [wc98f], a
	ld [wMobileSDK_ReceivePacketBuffer + 128], a
	pop hl
	call Function1111d7
	ld a, b
	cp $4
	jr c, .asm_110ee3
	jp nz, .asm_110dfa
	xor a
	or c
	jp nz, .asm_110dfa

.asm_110ee3
	ld hl, wc98b
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop bc
	pop de
	pop hl
	ld a, l
	ld [wc876], a
	ld a, h
	ld [wc877], a
	ld hl, wc872
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	xor a
	ld [wc994], a

Function110f07:
	ld hl, wc833
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_110f12
	xor a
	ld [hl], a

.asm_110f12
	ld hl, wc991
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wc866
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .asm_110f28
	ld a, $2
	jp Function110615

.asm_110f28
	ld a, $2
	ld [wc86e], a
	ld a, $1f
	ld [wMobileSDK_PacketBuffer + 10], a
	ld a, $90
	ld [wMobileSDK_PacketBuffer + 11], a
	ld a, $1
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_OpenTCPConnection
	ld b, $6
	call MobileSDK_CopyBytes
	ld hl, wc866
	ld b, $4
	call MobileSDK_CopyBytes
	inc de
	inc de
	ld b, $6
	call Function111f63
	ld a, [wMobileSDK_ReceivePacketBuffer + 128]
	or a
	jr z, .asm_110f95
	ld hl, wc995
	ld a, [hli]
	cp $99
	jr nz, .asm_110f8a
	ld a, [hli]
	cp $66
	jr nz, .asm_110f8a
	ld a, [hli]
	cp $23
	jr nz, .asm_110f8a
	ld a, $2
	ld [wc86e], a
	dec a
	ld [wc86b], a
	ld a, $a3
	ld de, $0010
	ld hl, wc995
	call Function111f02
	ld a, $f
	ld [wc86a], a
	jp Function110432

.asm_110f8a
	ld hl, wMobileSDK_PacketBuffer
	ld de, wc995
	ld b, $10
	call MobileSDK_CopyBytes

.asm_110f95
	ld de, $0010
	ld hl, wMobileSDK_PacketBuffer
	ld a, MOBILE_COMMAND_OPEN_TCP_CONNECTION | $80
	ld [wMobileSDK_SendCommandID], a
	ld b, $5
	call PacketSendBytes
	ld a, $f
	ld [wc86a], a
	jp Function110432

URIPrefix:
	db "http://"
.End

HTTPDownloadURL:
	db "gameboy.datacenter.ne.jp/cgb/download"
.End

HTTPUploadURL:
	db "gameboy.datacenter.ne.jp/cgb/upload"
.End

HTTPUtilityURL:
	db "gameboy.datacenter.ne.jp/cgb/utility"
.End

HTTPRankingURL:
	db "gameboy.datacenter.ne.jp/cgb/ranking"
.End

Function111044:
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld e, [hl]
	ld a, b
	or c
	ld [wc86e], a
	ld [wc86e + 1], a
	dec bc
	dec bc
	jp z, Function1111ca
	ld a, [wc991]
	or a
	call nz, Function11115f
	xor a
	cp e
	jp z, .asm_1110eb
	xor a
	cp b
	jr nz, .asm_1110ac
	ld a, e
	cp c
	jr c, .asm_1110ac
	push bc
	sub c
	ld [hl], a
	ld b, c
	ld hl, wc82d
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, wMobileSDK_ReceivePacketBuffer + 3
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	pop bc
	ld a, [wc991]
	ld l, a
	ld h, 0
	add hl, bc
	ld c, l
	ld b, h
	xor a
	ld [wc991], a
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ret

.asm_1110ac
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wc82d
	ld a, [wc991]
	add e
	ld [hli], a
	ld a, 0
	adc 0
	ld [hl], a
	xor a
	ld [wc991], a
	ld a, [wc86e]
	or a
	jr z, .asm_1110eb
	ld b, e
	ld hl, wMobileSDK_ReceivePacketBuffer + 3
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a

.asm_1110eb
	di
	ld a, $2
	ld [wc989], a
	ld hl, wc821
	res 2, [hl]
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jr z, .asm_111144
	ld de, $000b
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	ld a, $1
	ld [wc86b], a
	ret

	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc82d]
	ld [hli], a
	ld a, [wc82e]
	ld [hl], a
	ld hl, wc98f
	inc [hl]
	ld a, $f
	ld [wc86a], a
	ld a, $1
	ld [wc86b], a
	ld a, [wc86d]
	ld [wc86e], a
	xor a
	ld [wc989], a
	ld a, $a3
	ld de, $0010
	ld hl, wc995
	jp Function111f02

.asm_111144
	res 0, [hl]
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc82d]
	ld [hli], a
	ld a, [wc82e]
	ld [hl], a
	ld a, $2
	ld [wc86a], a
	xor a
	ld [wc86d], a
	ei
	ret

Function11115f:
	ld e, a
	xor a
	cp b
	jr nz, .asm_111168
	ld a, c
	cp e
	jr c, .asm_1111a2

.asm_111168
	push hl
	push bc
	ld b, e
	ld c, e
	ld a, [wc993]
	sub e
	ld e, a
	ld d, 0
	ld hl, wc880
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	call MobileSDK_CopyBytes
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld e, c
	ld a, c
	ld hl, wc82d
	ld [hli], a
	xor a
	ld [hl], a
	pop bc
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, [wc992]
	ld [wc82b], a
	ld e, a
	pop hl
	ret

.asm_1111a2
	ld a, e
	sub c
	ld [wc991], a
	ld a, [wc993]
	sub e
	ld e, a
	ld d, 0
	ld hl, wc880
	add hl, de
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	ld b, c
	call MobileSDK_CopyBytes
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	pop af
	ret

Function1111ca:
	ld hl, wc821
	res 2, [hl]
	ld a, $6
	ld [wc86b], a
	jp Function112430

Function1111d7:
	push hl
	ld hl, wc866
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	pop hl
	jr nz, .asm_1111ee
	ld de, $0007
	add hl, de
.asm_1111e8
	ld a, [hli]
	cp $2f
	jr nz, .asm_1111e8
	dec hl

.asm_1111ee
	ld bc, -1
.asm_1111f1
	ld a, [hli]
	inc bc
	or a
	jr nz, .asm_1111f1
	ld hl, wc87a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

Function1111fe:
	ld a, [wc821]
	bit 2, a
	ld a, [wc86a]
	jp nz, Function1113ea
	cp $2
	jp nz, Function110226
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	ld a, [wc86d]
	or a
	jp nz, Function110226
	xor a
	ld [wc989], a
	ld [wc98a], a
	ld [wc993], a
	push hl
	push de
	push bc
	push hl
rept 4
	inc hl
endr
	ld a, [hli]
	ld [wc833], a
	ld a, [hli]
	ld [wc834], a
	inc hl
	inc hl
	ld a, l
	ld [wc97f], a
	ld a, h
	ld [wc980], a
	dec hl
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, LOW(wc880)
	cp l
	jr nz, .asm_111251
	ld a, HIGH(wc880)
	cp h
	jp z, Function1113f7

.asm_111251
	ld b, URIPrefix.End - URIPrefix
	ld de, URIPrefix
.asm_111256
	ld a, [de]
	inc de
	cp [hl]
	jp nz, Function1113f7
	inc hl
	dec b
	jr nz, .asm_111256
	push hl
	ld b, HTTPDownloadURL.End - HTTPDownloadURL
	ld c, $0
	ld de, HTTPDownloadURL
.asm_111268
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_111275
	inc hl
	dec b
	jr nz, .asm_111268
	pop hl
	jp Function1113f7

.asm_111275
	pop hl
	push hl
	ld b, HTTPRankingURL.End - HTTPRankingURL
	ld c, $0
	ld de, HTTPRankingURL
.asm_11127e
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_11128f
	inc hl
	dec b
	jr nz, .asm_11127e
	ld a, $2
	ld [wc98a], a
	pop hl
	jr .asm_1112a0

.asm_11128f
	pop hl
	ld b, HTTPUploadURL.End - HTTPUploadURL
	ld c, $0
	ld de, HTTPUploadURL
.asm_111297
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_1112cc
	inc hl
	dec b
	jr nz, .asm_111297

.asm_1112a0
	ld a, [hli]
	or a
	jr nz, .asm_1112a0
.asm_1112a4
	ld a, [hld]
	cp $2f
	jr nz, .asm_1112a4
	inc hl
	inc hl
	ld a, [hl]
	cp $30
	jr c, .asm_1112cc
	cp $3a
	jr nc, .asm_1112cc
	ld hl, wc97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $12
	call Function11039a
	jp c, Function1113f7
	ld c, $12
	call Function11039a
	jp c, Function1113f7
	ld c, $1

.asm_1112cc
	ld a, c
	ld [wc98f], a
	ld [wMobileSDK_ReceivePacketBuffer + 128], a
	pop hl
	ld de, $0006
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function1111d7
	ld a, b
	cp $4
	jr c, .asm_1112eb
	jp nz, Function1113f8
	xor a
	or c
	jp nz, Function1113f8

.asm_1112eb
	pop bc
	pop de
	pop hl
	ld a, l
	ld [wc876], a
	ld a, h
	ld [wc877], a
	ld hl, wc872
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	call Function111335
	ld hl, wc876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [wc9aa], a
	ld a, [hli]
	ld [wc9ab], a
	ld a, [hli]
	ld [wc9ac], a
	ld a, [hli]
	ld [wc9ad], a
	inc hl
	inc hl
	ld a, [hli]
	ld [wc876], a
	ld a, [hl]
	ld [wc877], a
	ld a, [wc98f]
	xor $1
	ld [wc994], a
	jp Function110f07

Function111335:
	ld hl, wc876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld [wc8c9], a
.asm_111344
	ld de, $8ad0
	add hl, de
	jr nc, .asm_11134e
	add $3
	jr .asm_111344

.asm_11134e
	ld de, $7530
	add hl, de
.asm_111352
	ld de, $d8f0
	add hl, de
	jr nc, .asm_11135b
	inc a
	jr .asm_111352

.asm_11135b
	ld de, $2710
	add hl, de
	ld [wc8c6], a
	xor a
.asm_111363
	ld de, $f448
	add hl, de
	jr nc, .asm_11136d
	add $30
	jr .asm_111363

.asm_11136d
	ld de, $0bb8
	add hl, de
.asm_111371
	ld de, $fc18
	add hl, de
	jr nc, .asm_11137b
	add $10
	jr .asm_111371

.asm_11137b
	ld de, $03e8
	add hl, de
.asm_11137f
	ld de, $fed4
	add hl, de
	jr nc, .asm_111389
	add $3
	jr .asm_11137f

.asm_111389
	ld de, $012c
	add hl, de
.asm_11138d
	ld de, $ff9c
	add hl, de
	jr nc, .asm_111396
	inc a
	jr .asm_11138d

.asm_111396
	ld de, $0064
	add hl, de
	ld [wc8c7], a
	xor a
.asm_11139e
	ld de, $ffe2
	add hl, de
	jr nc, .asm_1113a8
	add $30
	jr .asm_11139e

.asm_1113a8
	ld de, $001e
	add hl, de
.asm_1113ac
	ld de, $fff6
	add hl, de
	jr nc, .asm_1113b6
	add $10
	jr .asm_1113ac

.asm_1113b6
	ld de, $000a
	add hl, de
	add l
	ld [wc8c8], a
	ld de, wc9a5
	ld hl, wc8c6
	ld a, [hli]
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	swap a
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hli]
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	swap a
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	and $f
	or $30
	ld [de], a
	inc de
	ret

Function1113ea:
	cp $14
	jp z, Function111044
	cp $24
	jp z, Function111044
	jp Function110226

Function1113f7:
	pop hl

Function1113f8:
	pop hl
	pop hl
	pop hl
	jp Function110231

Function1113fe:
	ld a, [wc822]
	bit 4, a
	jp z, .asm_11147f
	bit 7, a
	jp nz, .asm_11147f
	ld a, [wc821]
	bit 0, a
	jp nz, .asm_11147f
.asm_111413
	ld a, [wc800]
	or a
	jr nz, .asm_111413
	di
	ld a, [wc821]
	bit 3, a
	jp nz, .asm_11147b
	ld a, [wc807]
	or a
	jr nz, .asm_111436
	ld hl, wc821
	set 1, [hl]
	ld a, $23
	ld [wc80f], a
	ld a, $ff
	ei
	ret

.asm_111436
	xor a
	ld [wc86b], a
	push hl
	ld hl, wc829
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	pop hl
	ld a, [hli]
	or a
	jr z, .asm_111485
	cp $81
	jr nc, .asm_111485
	ld c, a
	inc a
	inc a
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld b, c
	call MobileSDK_CopyBytes
	ld b, c
	inc b
	inc b
	call Function111f63
	ld hl, wc822
	set 7, [hl]
	ld hl, wc821
	set 0, [hl]
	ld a, $0
	ei
	ret

.asm_11147b
	ei
	ld a, $1
	ret

.asm_11147f
	call Function110226
	ld a, $ff
	ret

.asm_111485
	ei
	call Function110231
	ld a, $ff
	ret

Function11148c:
	ld a, [wc822]
	bit 4, a
	jp z, Function110226
	ld a, [wc821]
	bit 0, a
	jp nz, Function110226
	bit 3, a
	jp z, Function110226
	ld e, l
	ld d, h
	ld a, [wc992]
	or a
	jr nz, .asm_111507
	ld a, [wc993]
	ld c, a
	ld b, 0
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	add hl, bc
	ld a, [hli]
	or a
	jr z, .asm_1114bb
	cp $81
	jr c, .asm_1114bd

.asm_1114bb
	ld a, $80

.asm_1114bd
	ld b, a
	inc c
	add c
	ld [wc993], a
	ld a, [wc994]
	dec a
	sub b
	ld c, a
	ld [wc994], a
	ld a, b
	ld [de], a
	inc de
	call MobileSDK_CopyBytes
.asm_1114d2
	xor a
	or c
	jr nz, .asm_1114dc
	ld hl, wc821
	res 3, [hl]
	ret

.asm_1114dc
	ld a, [hli]
	or a
	jr z, .asm_1114e4
	cp $81
	jr c, .asm_1114e6

.asm_1114e4
	ld a, $80

.asm_1114e6
	cp c
	ret c
	ld [wc991], a
	dec c
	ld a, c
	or a
	jr z, .asm_111500
	ld [wc992], a
	ld b, a
	ld de, wc880
	call MobileSDK_CopyBytes
.asm_1114fa
	ld hl, wc821
	res 3, [hl]
	ret

.asm_111500
	ld a, $ff
	ld [wc992], a
	jr .asm_1114fa

.asm_111507
	cp $ff
	jr nz, .asm_11150c
	xor a

.asm_11150c
	ld b, a
	ld a, [wc991]
	sub b
	ld c, a
	ld hl, wc880
	ld a, [wc991]
	ld [de], a
	inc de
	ld a, b
	or a
	jr z, .asm_111521
	call MobileSDK_CopyBytes

.asm_111521
	ld hl, wMobileSDK_ReceivePacketBuffer + 5
	ld b, c
	call MobileSDK_CopyBytes
	push hl
	ld a, c
	inc a
	ld [wc993], a
	ld b, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	sub b
	ld [wc994], a
	ld c, a
	xor a
	ld hl, wc991
	ld [hli], a
	ld [hl], a
	pop hl
	jr .asm_1114d2

Function111540:
	nop

MobileAPI_TelephoneStatus:
	ld hl, wc821
	bit 0, [hl]
	jp nz, Function110226
	ld a, [wc86a]
	cp $5
	jp nc, Function110226
	ld [wc985], a
	ld a, e
	ld [wc86e], a
	ld a, d
	ld [wc86e + 1], a
	ld a, [wc807]
	cp $2
	jr c, .asm_111582
	xor a
	ld [wc86b], a
	ld a, MOBILE_COMMAND_TELEPHONE_STATUS | $80
	ld hl, MobilePacket_TelephoneStatus
	call PacketSendEmptyBody
.asm_11156f
	ld a, [wMobileAPIIndex]
	cp $40
	jr nz, .asm_11157a
	ld a, $2c
	jr .asm_11157c

.asm_11157a
	ld a, $1e

.asm_11157c
	ld [wc86a], a
	jp Function110432

.asm_111582
	xor a
	ldh [rTAC], a
	ld a, [wc870]
	ld c, a
	call MobileAPI_SetTimer
	call Function1104b0
	ld a, $1
	ld [wc86b], a
	jr .asm_11156f

Function111596:
	ld hl, wc86a
	ld a, [hl]
	cp $1
	jp z, Function110226
	cp $2a
	jp z, Function110226
	ld a, [wc800]
	bit 1, a
	jr nz, .asm_1115af
	ld a, $2a
	jr Function1115e4

.asm_1115af
	ld a, [wMobileSDK_SendCommandID]
	cp $92
	jr nz, .asm_1115dd
	ld a, $2a
	ld b, $0
	di
	ld [hli], a
	ld [hl], b
	ld hl, wc822
	res 5, [hl]
	res 0, [hl]
	xor a
	ld [wc80b], a
	ld [wc800], a
	ld a, $8
	ld [wc807], a
	call ResetReceivePacketBuffer
	call Function11164f
	ld hl, wc821
	set 0, [hl]
	ei
	ret

.asm_1115dd
	ld a, $2a
	ld [hli], a
	ld a, $1
	ld [hl], a
	ret

Function1115e4:
	di
	push af
	ld hl, wc821
	set 0, [hl]
	ld a, $1
	ld [wc86b], a
	ld a, [wc86d]
	or a
	ld a, [wMobileSDK_ReceivePacketBuffer]
	jr z, .asm_111609
	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jr z, .asm_11160d
	cp MOBILE_COMMAND_CLOSE_TCP_CONNECTION | $80
	jr z, .asm_11160d
.asm_111601
	call Function112430
.asm_111604
	pop af
	ld [wc86a], a
	ret

.asm_111609
	cp $a3
	jr z, .asm_111601

.asm_11160d
	ei
	jr .asm_111604

Function111610:
	ld hl, wc86a
	ld a, [hl]
	dec a
	jp z, Function110226
	dec a
	jp z, Function110226
	ld a, [wc800]
	or a
	jr nz, .asm_111626
	ld a, $28
	jr Function1115e4

.asm_111626
	ld a, $28
	ld b, $2
	ld [hli], a
	ld [hl], b
	ret

Function11162d:
	ld a, [wc86a]
	cp $1
	jp nz, Function110226
	xor a
	ld hl, wMobileSDK_PacketBuffer
	ld [hli], a
	ld [hl], a
	call Function111686
	call ResetReceivePacketBuffer
	ld bc, $0452
	ld hl, wc800
.asm_111647
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_111647
	ret

Function11164f:
	ld hl, wc815
	xor a
	ld [hli], a
	ld a, [wc81f]
	ld b, a
	ld a, [wMobileSDK_AdapterType]
	ld a, b
	srl a
	srl a
	add b
	add b
	ld [hl], a
	ret

Function111664:
	ld hl, wMobileSDK_ReceivedBytes
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wMobileSDK_SendCommandID]
	cp $ff
	jr z, .asm_111679
	ld a, [wc822]
	bit 0, a
	jr z, .asm_11167c
.asm_111679
	ld hl, wMobileSDK_ReceivePacketBufferAlt
.asm_11167c
	add hl, de
	ld [hl], c
	inc de
	ld hl, wMobileSDK_ReceivedBytes
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

Function111686:
	xor a
	ldh [rTAC], a
	ld c, LOW(rIE)
	ldh a, [c]
	and ~(1 << SERIAL | 1 << TIMER)
	ldh [c], a
	ld a, [wMobileSDK_PacketBuffer + 1]
	ld [wc86a], a
	ld a, [wMobileSDK_PacketBuffer]
	ld c, a
	ld hl, wc821
	ld a, [hl]
	or c
	ld [hl], a
	ret

Function1116a0:
	ld a, $1
	jr Function1116a9

Function1116a4:
	set 1, [hl]
	ld a, [wc86a]

Function1116a9:
	ld [wMobileSDK_PacketBuffer + 1], a
	ld hl, wc815
	xor a
	ld [hli], a
	ld a, [wc81f]
	rla
	ld [hl], a
	ld hl, wc821
	ld a, [hl]
	ld b, a
	and $d
	ld [hl], a
	ld a, $2
	and b
	ld [wMobileSDK_PacketBuffer], a
	ret

_MobileReceive::
	ld a, [wc800]
	rrca
	jp nc, Function1118bc
	rrca
	jp c, Function1117e7
	ld hl, wc801
	ld a, [hli]
	ld d, [hl]
	ld e, a
	dec de
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	cp $2
	jp nc, Function1118bc
	ld a, d
	or a
	jp nz, Function1118bc
	ld hl, wc808
	add hl, de
	ldh a, [rSB]
	ld [hl], a
	ld a, $8
	cp l
	jp nz, Function1118bc
	ld a, [wMobileSDK_SendCommandID]
	cp $ff
	jr z, .asm_111716
	ld a, $f2
	cp [hl]
	jp z, Function111796
	dec a
	cp [hl]
	jp z, Function1117a0
	dec a
	cp [hl]
	jp z, Function1117a0
	ld a, [wc807]
	cp $1
	jr nz, .asm_111716
	ld a, [wc806]
	or a
	jr z, .asm_111778
.asm_111716
	ld a, [wMobileSDK_SendCommandID]
	cp -1
	jr z, .asm_111730
	cp MOBILE_COMMAND_ERROR | $80
	jr z, .asm_111727
	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jr nz, .asm_111727
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
.asm_111727
	cp [hl]
	jr nz, asm_11179a
	ld a, [wMobileSDK_AdapterType]
	or a
	jr z, .asm_111730
.asm_111730
	xor a
	ld [wc819], a
	ld a, $3
	ld [wc800], a
	xor a
	ld hl, wc80a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wc81f
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld hl, wc815
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [wc822]
	bit 0, a
	jr z, .asm_111757
	ld a, $b
	jr .asm_111774
.asm_111757
	ld a, [wMobileSDK_SendCommandID]
	cp -1
	jr z, .asm_11176e
	cp MOBILE_COMMAND_DIAL_TELEPHONE | $80
	jr z, .asm_111772
	cp MOBILE_COMMAND_OPEN_TCP_CONNECTION | $80
	jr z, .asm_111772
	cp MOBILE_COMMAND_DNS_QUERY | $80
	jr z, .asm_111772
	ld a, $20
	jr .asm_111774
.asm_11176e
	ld a, $3
	jr .asm_111774
.asm_111772
	ld a, $60
.asm_111774
	ld [hl], a
	jp Function1118bc
.asm_111778
	xor a
	ld [wc800], a
Function11177c:
	ld hl, wc820
	ld a, [hld]
	ld e, a
	ld a, [hl]
	dec a
	ld b, $3
.asm_111785
	or a
	rra
	rr e
	dec b
	jr nz, .asm_111785
	or a
	inc a
	ld hl, wc816
	ld [hld], a
	ld [hl], e
	jp Function1118bc

Function111796:
	ld b, $a
	jr asm_1117a2
asm_11179a:
	xor a
	ld [hli], a
	ld [hl], a
	jp Function1118bc

Function1117a0:
	ld b, $3
asm_1117a2:
	ld hl, wc822
	set 3, [hl]
	ld hl, wc815
	ld a, [wc820]
	ld [hli], a
	ld a, [wc81f]
	ld [hl], a
	xor a
	ld [wc800], a
	ld hl, wc819
	inc [hl]
	ld a, b
	cp [hl]
	jp nc, Function1118bc
	xor a
	ld hl, wc806
	ld [hli], a
	ld [wc800], a
	ld a, $6
	ld [hl], a
	ld hl, wc821
	set 1, [hl]
	ld a, $15
	ld [wc80f], a
	ld hl, wc810
	ld a, [wc808]
	and $f
	cp $2
	jr nz, .asm_1117e1
	inc a
.asm_1117e1
	ld [hli], a
	xor a
	ld [hl], a
	jp Function1118bc

Function1117e7:
	ld a, [wc80b]
	or a
	jr z, .asm_1117f8
	dec a
	jp z, Function11186e
	dec a
	jp z, Function111884
	jp Function111892
.asm_1117f8
	ld hl, wc80a
	ld a, [hl]
	or a
	jr nz, .asm_111803
	ld b, $99
	jr .asm_111805
.asm_111803
	ld b, $66
.asm_111805
	ldh a, [rSB]
	cp b
	jr z, .asm_111840
	cp $d2
	jr nz, .asm_111817
	xor a
	ld [wc9ae], a
.asm_111812
	xor a
	ld [hl], a
	jp Function1118bc
.asm_111817
	ld a, [wc9ae]
	inc a
	ld [wc9ae], a
	cp $14
	jr c, .asm_111812
	ld a, $6
	ld [wc807], a
	ld a, $10
	ld [wc80f], a
	xor a
	ld [wc800], a
	ld hl, wc822
	res 0, [hl]
	ld hl, wc821
	ld a, [hl]
	set 1, a
	and $f
	ld [hl], a
	jr Function1118bc
.asm_111840
	inc [hl]
	ld a, $2
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	ld hl, wMobileSDK_PacketChecksum
	ld b, $3
.asm_11184e
	ld [hli], a
	dec b
	jr nz, .asm_11184e
	ld a, [wc822]
	bit 4, a
	jr z, .asm_111864
	ld b, a
	ld a, [wc821]
	bit 3, a
	jr nz, .asm_111864
	jp Function11177c
.asm_111864
	ld a, [wc820]
	ld [hli], a
	ld a, [wc81f]
	ld [hl], a
	jr Function1118bc

Function11186e:
	call Function1118c2
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	ldh a, [rSB]
	ld [wc80c], a
	inc [hl]
	or a
	jr nz, Function1118bc
	inc [hl]
	jr Function1118bc

Function111884:
	call Function1118c2
	ld a, [wc80c]
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	jr Function1118bc

Function111892:
	ldh a, [rSB]
	ld c, a
	call Function111664
	ld hl, wc80a
	inc [hl]
	ld a, $2
	cp [hl]
	jr c, .asm_1118b4
	ld a, [wc80a]
	add $11
	ld e, a
	ld d, $c8
	ld a, [de]
	cp c
	jr z, Function1118bc
	ld a, $1
	ld [wc814], a
	jr Function1118bc
.asm_1118b4
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
Function1118bc:
	ld hl, wc822
	res 1, [hl]
	ret

Function1118c2:
	ldh a, [rSB]
	ld c, a
	ld b, 0
	ld hl, wMobileSDK_PacketChecksum
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, bc
	ld a, h
	ld [wMobileSDK_PacketChecksum], a
	ld a, l
	ld [wMobileSDK_PacketChecksum + 1], a
	call Function111664
	ld hl, wc80a
	inc [hl]
	ret

_Timer::
	ld a, [wc80b]
	cp $4
	call z, Function111b3c
	call Function11214e
	ld hl, wc807
	ld a, [hli]
	cp $2
	jr c, .asm_111927
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	and b
	cp $ff
	jr z, .asm_1118fe
	ld a, c
	or b
	jr nz, .asm_111927
.asm_1118fe
	ld hl, wc807
	ld a, $6
	cp [hl]
	jp z, Function111b3b
	ld [hl], a
	ld a, $10
	ld [wc80f], a
	xor a
	ld [wc800], a
	ld hl, wc822
	res 0, [hl]
	ld hl, wc821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $10
	ld [wc80f], a
	jp Function111b3b
.asm_111927
	ld a, [wc800]
	cp $1
	jp z, Function111b21
	cp $3
	jp z, Function111a2a
	ld a, [wc807]
	cp $1
	jp c, Function111b3b
	ld hl, wc815
	dec [hl]
	jp nz, Function111b3b
	inc hl
	dec [hl]
	jp nz, Function111b3b
	ld hl, wc807
	ld a, [wc822]
	bit 3, a
	jp nz, Function111a0b
	bit 4, a
	jr nz, .asm_11199c
	ld a, [hl]
	cp $1
	jp z, Function1119f0_BeginSession
	cp $a
	jr z, .asm_111984
	cp $8
	jr z, .asm_11197d
	ld a, [wc86a]
	cp $2a
	jr z, .asm_111991
	cp $d
	jr nz, .asm_111977
	ld a, [wc86b]
	cp $4
	jr nc, .asm_11199c
.asm_111977
	call Function111f97
	jp Function111b3b
.asm_11197d
	ld a, [wc805]
	ld [hl], a
	jp Function111b3b
.asm_111984
	xor a
	ld [hl], a
	ld hl, wc821
	res 0, [hl]
	call Function111686
	jp Function111b3b
.asm_111991
	xor a
	ld [hl], a
	ld [wc821], a
	call Function111686
	jp Function111b3b
.asm_11199c
	ld b, a
	ld [hl], a
	or a
	jp z, Function111b3b
	ld a, [wc822]
	bit 7, a
	jr nz, .asm_1119be
.asm_1119a9
	ld a, [wc821]
	bit 3, a
	jr nz, .asm_111977
	ld de, MobilePacket_TransferData.End - MobilePacket_TransferData
	ld hl, MobilePacket_TransferData
	ld a, $95
	call Function111f02
	jp Function111b3b
.asm_1119be
	ld a, [wc821]
	bit 3, a
	jr nz, .asm_1119dd
	ld a, [wMobileSDK_PacketBuffer + 5]
	add $a
	ld e, a
	ld d, 0
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
	ld [wMobileSDK_SendCommandID], a
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	call PacketSendBytes
	jp Function111b3b
.asm_1119dd
	ld hl, wc821
	set 1, [hl]
	res 0, [hl]
	ld hl, wc822
	res 7, [hl]
	ld a, $21
	ld [wc80f], a
	jr .asm_1119a9

Function1119f0_BeginSession:
	ld a, MOBILE_COMMAND_BEGIN_SESSION | $80
	ld [wMobileSDK_SendCommandID], a
	ld [wc808], a
	ld b, $5
	ld de, MobilePacket_BeginSession.End - MobilePacket_BeginSession
	ld hl, MobilePacket_BeginSession
	call PacketSendBytes
	ld a, $1
	ld [wc806], a
	jp Function111b3b

Function111a0b:
	ld a, [hl]
	cp $6
	jp z, Function111b3b
	ld hl, wc822
	res 3, [hl]
	res 0, [hl]
	ld hl, wc81a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $5
	call PacketSendBytes
	jp Function111b3b

Function111a2a:
	ld hl, wc80b
	ld a, [hld]
	or a
	jr z, asm_111a47
	cp $3
	jr nz, asm_111a40
	ld a, [hl]
	cp $2
	jp z, Function111ab9
	cp $3
	jp z, Function111abd
asm_111a40:
	ld a, $4b

Function111a42:
	ldh [rSB], a
	jp Function111b2e

asm_111a47:
	ld hl, wc815
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr z, .asm_111a63
	ld hl, wc81f
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld hl, wc815
	ld [hli], a
	ld a, d
	ld [hli], a
	jr asm_111a40
.asm_111a63
	di
	ld a, [wc86a]
	cp $2a
	jr z, .asm_111aa8
	ld hl, wc9b2
	inc [hl]
	ld a, [hl]
	cp $1
	jr z, .asm_111a91
	ld hl, wc822
	res 5, [hl]
	res 0, [hl]
	ld hl, wc821
	res 4, [hl]
	ld a, $0
	ld [wc805], a
	ld a, $29
	ld [wc86a], a
	ld a, $1
	ld [wc806], a
	jr .asm_111aa8
.asm_111a91
	ld a, $29
	ld [wc86a], a
	xor a
	ld [wc806], a
	ld [wc86b], a
	ld [wc80b], a
	ld [wc800], a
	ld a, $8
	ld [wc807], a
.asm_111aa8
	call ResetReceivePacketBuffer
	call Function11164f
	ld hl, wc822
	res 5, [hl]
	res 0, [hl]
	ei
	jp Function111b3b

Function111ab9:
	ld a, $80
	jr Function111a42

Function111abd:
	ld a, [wc814]
	or a
	jr nz, .asm_111acb
	ld a, [wMobileSDK_ReceivePacketBuffer]
	xor $80
	jp Function111a42
.asm_111acb
	ld hl, wc819
	inc [hl]
	ld a, $3
	cp [hl]
	jr z, .asm_111afe
	call ResetReceivePacketBuffer
	ld a, $3
	ld [wc800], a
	xor a
	ld hl, wc80a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wc815
	ld a, [wc820]
	ld [hli], a
	ld a, [wc81f]
	ld [hli], a
	ld a, [wc822]
	bit 0, a
	jr z, .asm_111af9
	ld a, $b
	jr .asm_111afb
.asm_111af9
	ld a, $20
.asm_111afb
	ld [hli], a
	jr .asm_111b1c
.asm_111afe
	ld hl, wc806
	xor a
	ld [hli], a
	ld [wc800], a
	ld a, $6
	ld [hl], a
	ld hl, wc821
	set 1, [hl]
	ld a, $15
	ld [wc80f], a
	ld a, $2
	ld [wc810], a
	xor a
	ld [wc810 + 1], a
.asm_111b1c
	ld a, $f1
	jp Function111a42

Function111b21:
	ld hl, wc803
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ldh [rSB], a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e

Function111b2e:
	ld hl, wc822
	set 1, [hl]
	ld a, (0 << rSC_ON) | (1 << rSC_CGB) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CGB) | (1 << rSC_CLOCK)
	ldh [rSC], a

Function111b3b:
	ret

Function111b3c:
	xor a
	ld [wc819], a
	ld [wc80b], a
	ld hl, wc9b1
	ld [hli], a
	ld [hl], a
	ld [wc800], a
	ld hl, wc822
	res 5, [hl]
	bit 0, [hl]
	jr z, .asm_111b59
	ld a, [wMobileSDK_ReceivePacketBufferAlt]
	jr .asm_111b5c
.asm_111b59
	ld a, [wMobileSDK_ReceivePacketBuffer]
.asm_111b5c

	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jr nz, .asm_111b62
	ld a, MOBILE_COMMAND_TRANSFER_DATA | $80
.asm_111b62
	ld b, a

	ld hl, Function111e28
	push hl
	cp MOBILE_COMMAND_ERROR | $80
	jp z, GetErrorCode
	ld a, [wMobileSDK_SendCommandID]
	cp -1
	jp z, Function111ef8
	cp MOBILE_COMMAND_TRANSFER_DATA | $80
	jp z, Function111c17
	cp MOBILE_COMMAND_DNS_QUERY | $80
	jp z, Function111d23
	cp MOBILE_COMMAND_OPEN_TCP_CONNECTION | $80
	jr z, .asm_111bbe
	cp MOBILE_COMMAND_CLOSE_TCP_CONNECTION | $80
	jr z, .asm_111bbe
	cp MOBILE_COMMAND_HANG_UP_TELEPHONE | $80
	jr z, .asm_111be0
	cp MOBILE_COMMAND_READ_CONFIGURATION_DATA | $80
	jr z, .asm_111bf0
	cp MOBILE_COMMAND_WRITE_CONFIGURATION_DATA | $80
	jp z, Function111c06
	cp MOBILE_COMMAND_TELEPHONE_STATUS | $80
	jp z, Function111d70
	cp MOBILE_COMMAND_ISP_LOGIN | $80
	jr z, .asm_111bd0
	cp MOBILE_COMMAND_ISP_LOGOUT | $80
	jr z, .asm_111bca
	cp MOBILE_COMMAND_BEGIN_SESSION | $80
	jp z, ParseResponse_BeginSession
	cp MOBILE_COMMAND_WAIT_FOR_TELEPHONE_CALL | $80
	jp z, Function111d65
	cp MOBILE_COMMAND_DIAL_TELEPHONE | $80
	jp z, Function111d65
	ld hl, wc822
	res 0, [hl]
	ld a, $a
	ld [wc807], a
	xor a
	ld [wc800], a
	ret

.asm_111bbe
	ld a, [wMobileSDK_ReceivePacketBuffer + 4]
	ld [wc86c], a
	ld a, $4
	ld [wc807], a
	ret

.asm_111bca
	ld a, $3
	ld [wc807], a
	ret

.asm_111bd0
	ld a, $4
	ld [wc807], a
	ld de, wc823
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	ld b, $4
	jp MobileSDK_CopyBytes

.asm_111be0
	ld a, $2
	ld [wc807], a
	ld hl, wc822
	res 4, [hl]
	ld hl, wc821
	res 4, [hl]
	ret

.asm_111bf0
	ld hl, wc829
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_ReceivePacketBuffer + 3 ; packet size
	ld a, [hli]
	dec a
	ld b, a
	inc hl
	call MobileSDK_CopyBytes
	ld a, $2
	ld [wc807], a
	ret

Function111c06:
	ld de, wc872
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	ld b, $2
	call MobileSDK_CopyBytes
	ld a, $2
	ld [wc807], a
	ret

Function111c17:
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jp z, Function111d07
	ld a, [wc86e + 1]
	ld b, a
	ld a, [wc86e]
	or b
	jp z, Function111d07
	ld hl, wc82b
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	dec a
	jp z, Function111d07
	ld c, a
	ld a, [wc822]
	bit 4, a
	jp z, Function111cc2
	ld a, [wc992]
	or a
	jr nz, .asm_111c89
	ld a, [wMobileSDK_ReceivePacketBuffer + 5]
	or a
	jr z, .asm_111c50
	cp $81
	jr c, .asm_111c52
.asm_111c50
	ld a, $80
.asm_111c52
	ld b, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	dec a
	dec a
	cp b
	jr c, .asm_111c6e
.asm_111c5b
	ld hl, wc821
	set 3, [hl]
	ld hl, wc993
	ld a, $1
	ld [hli], a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	dec a
	ld [hl], a
	jp Function111d07
.asm_111c6e
	ld hl, wc992
	or a
	jr z, .asm_111c83
	ld [hld], a
	ld [hl], b
	ld b, a
	ld hl, wMobileSDK_ReceivePacketBuffer + 6
	ld de, wc880
	call MobileSDK_CopyBytes
	jp Function111d07
.asm_111c83
	ld a, $ff
	ld [hld], a
	ld [hl], b
	jr Function111d07
.asm_111c89
	cp $ff
	jr nz, .asm_111c9d
	ld hl, wc991
	ld a, [hli]
	ld b, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	xor a
	ld [hl], a
.asm_111c9d
	ld hl, wc991
	ld a, [hli]
	sub [hl]
	ld b, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	ld b, a
	ld l, [hl]
	ld h, $0
	add l
	ld [wc992], a
	ld de, wc880
	add hl, de
	ld e, l
	ld d, h
	ld hl, wMobileSDK_ReceivePacketBuffer + 5
	call MobileSDK_CopyBytes
	jr Function111d07

Function111cc2:
	xor a
	cp d
	jr nz, .asm_111cda
	ld a, c
	cp e
	jr c, .asm_111cda
	jr z, .asm_111cda
	ld a, [wc821]
	set 2, a
	ld [wc821], a
	ld a, c
	sub e
	ld c, e
	ld e, a
	jr .asm_111ce1
.asm_111cda
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
.asm_111ce1
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	ld hl, wMobileSDK_ReceivePacketBuffer + 5
	ld a, c
	or a
	jr z, Function111d07
	ld b, a
	call MobileSDK_CopyBytes
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld [hl], d
	ld de, $3
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, Function111d07
	inc [hl]

Function111d07:
	ld a, [wc822]
	bit 4, a
	jr z, .asm_111d1c
	bit 7, a
	jr z, .asm_111d1c
	ld hl, wc822
	res 7, [hl]
	ld hl, wc821
	res 0, [hl]
.asm_111d1c
	ld a, [wc805]
	ld [wc807], a
	ret

Function111d23:
	ld a, [wc829]
	ld e, a
	ld a, [wc829 + 1]
	ld d, a
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	ld b, $4
	call MobileSDK_CopyBytes
	ld a, $4
	ld [wc807], a
	ret

ParseResponse_BeginSession:
	ld de, wMobileSDK_ReceivePacketBuffer + 3
	ld hl, MobilePacket_BeginSession + 5
	ld b, 1 + STRLEN("NINTENDO")
.check_loop
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .check_done
	inc hl
	dec b
	jr nz, .check_loop
.check_done
	ld a, b
	or a
	jr nz, .done

	ld a, [wMobileSDK_ReceivePacketBuffer + 14] ; device type
	cp $80
	jr c, .fail
	cp $90
	jr nc, .fail
.done
	ld [wMobileSDK_AdapterType], a
	ld a, $2
	ld [wc807], a
	ret
.fail
	xor a
	jr .done

Function111d65:
	ld a, $3
	ld [wc807], a
	ld hl, wc821
	set 4, [hl]
	ret

Function111d70:
	ld hl, wc822
	bit 0, [hl]
	jr z, .asm_111dc0
	ld a, [wc805]
	ld [wc807], a
	ld a, [wMobileSDK_ReceivePacketBufferAlt + 4]
	ld b, a
	call Function111dd9
	call Function111e15
	res 0, [hl]
	ld a, b
	cp $7
	jr z, .asm_111da9
	or a
	ret nz
	ld hl, wc821
	res 4, [hl]
	set 1, [hl]
	ld a, [wc822]
	bit 4, a
	jr nz, .asm_111dbb
	ld a, $23
	ld [wc80f], a
	ld a, $6
	ld [wc807], a
	ret
.asm_111da9
	ld hl, wc821
	res 4, [hl]
	set 1, [hl]
	ld a, $11
	ld [wc80f], a
	ld a, $6
	ld [wc807], a
	ret
.asm_111dbb
	xor a
	ld [wc807], a
	ret
.asm_111dc0
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 4]
	ld b, a
	call Function111dd9
	call Function111e15
	ld a, b
	ld [hl], a
	ld a, [wc805]
	ld [wc807], a
	ret

Function111dd9:
	cp $ff
	jr z, .asm_111de7
	or a
	ret z
	cp $4
	jr z, .asm_111dea
	cp $5
	jr z, .asm_111e12
.asm_111de7
	ld b, $7
	ret
.asm_111dea
	ld b, $5
	ld a, [wc822]
	bit 0, a
	jr z, .asm_111df8
	ld a, [wc86a]
	jr .asm_111dfb
.asm_111df8
	ld a, [wc985]
.asm_111dfb
	cp $4
	ret z
	cp $1c
	ret z
	cp $1a
	ret z
	dec b
	cp $3
	ret z
	ld b, $1
	ld a, [wc822]
	bit 4, a
	ret z
	inc b
	ret
.asm_111e12
	ld b, $3
	ret

Function111e15:
	ld a, b
	and $7
	rrca
	rrca
	rrca
	push hl
	ld l, a
	ld a, [wc821]
	and $1f
	or l
	ld [wc821], a
	pop hl
	ret

Function111e28:
	jp ResetReceivePacketBuffer

GetErrorCode:
; Converts an error packet into a BCD error code
	ld a, [wMobileSDK_SendCommandID]
	cp -1
	jp z, Function111ef8
	ld a, [wc86a]
	cp $d
	jr z, .asm_111e48
	cp $2a
	jr z, .asm_111e48
	ld a, $6
	ld [wc807], a
	ld hl, wc821
	set 1, [hl]
.asm_111e48
	ld a, [wc822]
	bit 0, a
	jr z, .asm_111e54
	ld hl, wMobileSDK_ReceivePacketBufferAlt + 4
	jr .asm_111e57
.asm_111e54
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
.asm_111e57
	ld a, [hli]
	ld [wc80e], a
	cp MOBILE_COMMAND_BEGIN_SESSION
	jr z, .adapter_not_plugged_in
	cp MOBILE_COMMAND_DIAL_TELEPHONE
	jr z, .dial_telephone
	cp MOBILE_COMMAND_HANG_UP_TELEPHONE
	jr z, .hang_up_logout
	cp MOBILE_COMMAND_TRANSFER_DATA
	jr z, .transfer_data
	cp MOBILE_COMMAND_READ_CONFIGURATION_DATA
	jr z, .read_configuration_data
	cp MOBILE_COMMAND_ISP_LOGIN
	jr z, .isp_login
	cp MOBILE_COMMAND_ISP_LOGOUT
	jr z, .hang_up_logout
	cp MOBILE_COMMAND_OPEN_TCP_CONNECTION
	jr z, .open_tcp_connection
	cp MOBILE_COMMAND_CLOSE_TCP_CONNECTION
	jr z, .close_tcp_connection
	cp MOBILE_COMMAND_DNS_QUERY
	jr z, .dns_query
	ld a, [hl]

.store_error_code
	ld [wc80f], a
	ret

.adapter_not_plugged_in
	ld a, $10
	jr .store_error_code

.dial_telephone
	ld a, [hl]
	or $0
	jr z, .asm_111e9d
	cp $2
	jr z, .asm_111e99
	ld a, $13
	jr .store_error_code
.asm_111e99
	ld a, $17
	jr .store_error_code
.asm_111e9d
	ld a, $12
	jr .store_error_code

.hang_up_logout
	ld hl, wc821
	res 1, [hl]
	res 4, [hl]
	ld a, $2
	ld [wc807], a
	ret

.transfer_data
	ld a, [hl]
	cp $1
	jr nz, .asm_111ed3
	ld a, [wc822]
	bit 4, a
	jr z, .asm_111ed3
	res 4, a
	ld [wc822], a
	ld hl, wc821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $23
	ld [wc80f], a
	ld a, $6
	ld [wc807], a
	ret
.asm_111ed3
	ld hl, wc822
	res 5, [hl]
	ld a, $24
	jr .store_error_code

.read_configuration_data
	ld a, $14
	jr .store_error_code

.isp_login
	ld a, $22
	jr .store_error_code

.open_tcp_connection
	ld hl, wc821
	res 1, [hl]

.dns_query
	ld a, $24
	jr .store_error_code

.close_tcp_connection
	ld hl, wc821
	res 1, [hl]
	ld a, $3
	ld [wc807], a
	ret

Function111ef8:
	ld a, [wc805]
	ld [wc807], a
	ret

PacketSendEmptyBody:
	ld de, 10

Function111f02:
	ld [wMobileSDK_SendCommandID], a
	ld b, $5

PacketSendBytes:
; hl = bytes
; de = size
; b = ?
	call Function1100b4
	ret c
	ld a, [wc800]
	cp $0
	jr z, .asm_111f17
	call Function110226
	scf
	ret
.asm_111f17
	ldh a, [rSC]
	and 1 << rSC_ON
	jr nz, .asm_111f17
	di
	ld a, [wMobileSDK_SendCommandID]
	cp $ff
	jr z, .asm_111f35
	ld a, l
	ld [wc81c], a
	ld a, h
	ld [wc81d], a
	ld a, e
	ld [wc81a], a
	ld a, d
	ld [wc81b], a
.asm_111f35
	ld a, e
	ld [wc801], a
	ld a, d
	ld [wc802], a
	ld a, l
	ld [wc803], a
	ld a, h
	ld [wc804], a
	ld hl, wc807
	ld a, [hl]
	cp b
	jr z, .asm_111f4f
	ld [wc805], a
.asm_111f4f
	ld a, b
	ld [wc807], a
	xor a
	ld [wc806], a
	ld a, $1
	ld [wc800], a
	ld hl, wc822
	set 5, [hl]
	ei
	ret

Function111f63:
	push de
	ld hl, 0
	ld c, b
	xor a
	cp b
	jr z, .asm_111f71
.asm_111f6c
	call Function111f8d
	jr nz, .asm_111f6c

.asm_111f71
	ld b, $4
.asm_111f73
	call Function111f8d
	jr nz, .asm_111f73
	ld e, l
	ld d, h
	ld hl, $000a
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hl], a
	ld e, c
	ld d, b
	ret

Function111f8d:
	dec de
	ld a, [de]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	ret

Function111f97:
	ld hl, wc822
	bit 0, [hl]
	ret nz
	ld a, [wc807]
	cp $2
	jr c, .done
	cp $5
	jr z, .done
	cp $6
	jr nz, .hang_up
	ld a, [wc80f]
	cp $22
	jr z, .done
	cp $23
	jr z, .done
	cp $26
	jr z, .done
	swap a
	and $f
	cp $1
	jr z, .done
	cp $0
	jr z, .done
	cp $8
	jr nz, .hang_up
.done
	scf
	ret
.hang_up
	ld b, $5
	ld hl, wMobileSDK_SendCommandID
	ld a, [hl]
	cp -1
	jr z, .begin_session
	ld a, MOBILE_COMMAND_TELEPHONE_STATUS | $80
	ld [hl], a
	ld hl, MobilePacket_TelephoneStatus
	ld de, MobilePacket_TelephoneStatus.End - MobilePacket_TelephoneStatus
	call PacketSendBytes
	ld hl, wc822
	set 0, [hl]
	ret
.begin_session
	ld hl, MobilePacket_BeginSession
	ld de, MobilePacket_BeginSession.End - MobilePacket_BeginSession
	jp PacketSendBytes

	ds 14

MobilePacket_Idle:
	db $4b
.End

MobilePacket_BeginSession:
	db $99, $66, MOBILE_COMMAND_BEGIN_SESSION, $00, $00, $08, "NINTENDO", $02, $77, $80, $00
.End

MobilePacket_EndSession:
	db $99, $66, MOBILE_COMMAND_END_SESSION, $00, $00, $00, $00, $11, $80, $00
.End

MobilePacket_DialTelephone:
	db $99, $66, MOBILE_COMMAND_DIAL_TELEPHONE, $00, $00, $00
.End

MobilePacket_HangUpTelephone:
	db $99, $66, MOBILE_COMMAND_HANG_UP_TELEPHONE, $00, $00, $00, $00, $13, $80, $00
.End

MobilePacket_TelephoneStatus:
	db $99, $66, MOBILE_COMMAND_TELEPHONE_STATUS, $00, $00, $00, $00, $17, $80, $00
.End

MobilePacket_ISPLogin:
	db $99, $66, MOBILE_COMMAND_ISP_LOGIN, $00, $00
.End

MobilePacket_ISPLogout:
	db $99, $66, MOBILE_COMMAND_ISP_LOGOUT, $00, $00, $00, $00, $22, $80, $00
.End

MobilePacket_ReadConfigurationDataPart1:
	db $99, $66, MOBILE_COMMAND_READ_CONFIGURATION_DATA, $00, $00, $02, $00, $60, $00, $7b, $80, $00
.End

MobilePacket_ReadConfigurationDataPart2:
	db $99, $66, MOBILE_COMMAND_READ_CONFIGURATION_DATA, $00, $00, $02, $60, $60, $00, $db, $80, $00
.End

MobilePacket_WriteConfigurationData:
	db $99, $66, MOBILE_COMMAND_WRITE_CONFIGURATION_DATA, $00, $00
.End

MobilePacket_DNSQuery:
	db $99, $66, MOBILE_COMMAND_DNS_QUERY, $00, $00
.End

MobilePacket_WaitForTelephoneCall:
	db $99, $66, MOBILE_COMMAND_WAIT_FOR_TELEPHONE_CALL, $00, $00, $00, $00, $14, $80, $00
.End

MobilePacket_TransferData:
	db $99, $66, MOBILE_COMMAND_TRANSFER_DATA, $00, $00, $01, $ff, $01, $15, $80, $00
.End

MobilePacket_OpenTCPConnection:
	db $99, $66, MOBILE_COMMAND_OPEN_TCP_CONNECTION, $00, $00, $06
.End

MobilePacket_CloseTCPConnection:
	db $99, $66, MOBILE_COMMAND_CLOSE_TCP_CONNECTION, $00, $00, $01
.End

Unknown_112089:
	db -20, $14, $c9
	db -28, $0f, $0e
	db -32, $0c, $53
	db -60, $07, $94
	db -80, $05, $ee
	db -20, $10, $b4
	db -28, $0c, $dd

Unknown_11209e:
	db "HELO ", 0
Unknown_1120a4:
	db "MAIL FROM:<", 0
Unknown_1120b0:
	db "RCPT TO:<", 0
Unknown_1120ba:
	db "DATA\r\n", 0
Unknown_1120c1:
	db "QUIT\r\n", 0
Unknown_1120c8:
	db "USER ", 0
Unknown_1120ce:
	db "PASS ", 0
Unknown_1120d4:
	db "STAT\r\n", 0
Unknown_1120db:
	db "LIST 00000\r\n", 0
Unknown_1120e8:
	db "RETR 00000\r\n", 0
Unknown_1120f5:
	db "DELE 00000\r\n", 0
Unknown_112102:
	db "TOP 00000 0\r\n", 0
Unknown_112110:
	db "GET ", 0
Unknown_112115:
	db " HTTP/1.0\r\n", 0
Unknown_112121:
	db "User-Agent: CGB-", 0
Unknown_112132:
	db "\r\n\r\n", 0
Unknown_112137:
	db "POST ", 0
Unknown_11213d:
	db "Content-Length: ", 0

Function11214e:
	ld a, [wc822]
	bit 5, a
	ret nz
	ld a, [wc86a]
	cp $a
	ret c
	ld c, a
	cp $d
	jr z, .asm_112187
	cp $f
	jr z, .asm_112196
	cp $29
	jr z, .asm_112175
	cp $2a
	jr z, .asm_112175
	cp $28
	jr z, .asm_112175
.asm_11216f
	ld a, [wc807]
	cp $6
	ret z
.asm_112175
	ld b, $0
	sla c
	ld hl, Jumptable_1121ac - 2 * $a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wc86b
	inc [hl]
	ld a, [hl]
	ret
.asm_112187
	ld c, a
	ld a, [wc86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, wc821
	res 1, [hl]
	jr .asm_112175
.asm_112196
	ld c, a
	ld a, [wc80f]
	cp $24
	jr nz, .asm_11216f
	ld a, [wc86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, wc821
	res 1, [hl]
	jr .asm_112175

Jumptable_1121ac:
	dw Function1121f6
	dw Function112271
	dw Function112373
	dw Function1123b6
	dw Function1123e1
	dw Function112451
	dw Function112715
	dw Function11273a
	dw Function11299c
	dw Function112d33
	dw Function112d33
	dw Function112840
	dw Function1128db
	dw Function112969
	dw Function112a56
	dw Function112b71
	dw Function112bec
	dw Function112bbb
	dw Function112bec
	dw Function112b71
	dw Function1134cb
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function113519
	dw Function113519
	dw Function113519
	dw Function113e42
	dw Function113ef2
	dw Function113f2d
	dw Function1121f6
	dw Function1134cb
	dw Function113672
	dw Function113626

Function1121f6:
	dec a
	jr z, .asm_1121fe
	dec a
	jr z, .asm_112210
	dec [hl]
	ret

.asm_1121fe
	ld a, [wMobileSDK_AdapterType]
	or a
	jr z, .asm_112206
	jr Mobile_EndSession

.asm_112206
	ld a, $10
	call Function11225d
	res 0, [hl]
	set 1, [hl]
	ret

.asm_112210
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMobileSDK_AdapterType]
	cp $88
	jr c, .asm_112249
	sub $88
	ld [hl], a

	; There aren't more than four adapters
	cp $4
	jr c, .asm_112226
	ld a, $3
.asm_112226

	; The green adapter was scrapped, so the red adapter is the third
	cp $3
	jr nz, .asm_11222b
	dec a
.asm_11222b

	ld b, a
	ld a, $4
	sub b
	ld d, a
	rlca
	add d
	ld c, a
	xor a
	cp b
	jr z, .asm_11223a
	ld a, $3
	xor b

.asm_11223a
	ld hl, wc871
	ld [hld], a
	ld [hl], c
	ld a, [wc86a]
	cp $a
	jr nz, Function112251
	jp Function1116a0

.asm_112249
	ld a, $10
	call Function11225d
	jp Function1116a4

Function112251:
	xor a
	ld [wc821], a
	ld [wc807], a
	inc a
	ld [wc86a], a
	ret

Function11225d:
	ld [wc80f], a
	ld a, $5
	ld [wc86a], a
	ld hl, wc821
	ret

Mobile_EndSession:
	ld a, MOBILE_COMMAND_END_SESSION | $80
	ld hl, MobilePacket_EndSession
	jp PacketSendEmptyBody

Function112271:
	dec a
	jr z, .asm_11228c
	dec a
	jr z, .asm_112292
	dec a
	jr z, .asm_1122a1
	dec a
	jp z, .asm_112309
	dec a
	jp z, .asm_112326
	dec a
	jp z, .asm_112335
	dec a
	jp z, .asm_112342
	dec [hl]
	ret

.asm_11228c
	ld hl, MobilePacket_ReadConfigurationDataPart1
	jp Function11236b

.asm_112292
	ld hl, wc829
	ld a, LOW(wc8ca + 22)
	ld [hli], a
	ld a, HIGH(wc8ca + 22)
	ld [hli], a
	ld hl, MobilePacket_ReadConfigurationDataPart2
	jp Function11236b

.asm_1122a1
	ld hl, wc880
	ld a, [hli]
	cp "M"
	jr nz, .asm_1122f5
	ld a, [hld]
	cp "A"
	jr nz, .asm_1122f5
	ld b, $be
	ld de, 0
.asm_1122b3
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_1122b3
	ld a, [hli]
	cp d
	jr nz, .asm_1122fc
	ld a, [hl]
	cp e
	jr nz, .asm_1122fc
	ld hl, wc884
	ld de, wc836
	ld b, $8
	call MobileSDK_CopyBytes
	ld hl, wc8ca
	ld b, $2c
	call MobileSDK_CopyBytes
	ld a, [wMobileSDK_PacketBuffer + 50]
	ld c, a
	sub $8
	ld e, a
	ld d, 0
	ld hl, wMobileSDK_PacketBuffer + 51
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc836
	ld b, $8
	call MobileSDK_CopyBytes
	ld b, c
	call Function111f63
	jr Function11235a

.asm_1122f5
	ld a, $25
	ld [wc872], a
	jr .asm_112301

.asm_1122fc
	ld a, $14
	ld [wc872], a

.asm_112301
	ld a, $6
	ld [wc86b], a
	jp Mobile_EndSession

.asm_112309
	ld a, [wc821]
	and $e0
	jr nz, .asm_112314
	ld b, $92
	jr Function11234b

.asm_112314
	cp $e0
	ld a, $11
	jr z, .asm_11231b
	inc a

.asm_11231b
	ld [wc872], a
	ld a, $6
	ld [wc86b], a
	jp Mobile_EndSession

.asm_112326
	ld d, a
	ld a, [wMobileSDK_PacketBuffer + 50]
	add $a
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 45
	ld a, $a1
	jp Function111f02

.asm_112335
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	set 5, [hl]
	ret

.asm_112342
	ld a, [wc872]
	call Function11225d
	jp Function1116a4

Function11234b:
	ld a, [wMobileSDK_PacketBuffer + 5]
	add $a
	ld e, a
	ld d, 0
	ld hl, wMobileSDK_PacketBuffer
	ld a, b
	jp Function111f02

Function11235a:
	ld hl, wc86e
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hl], a
	ld a, MOBILE_COMMAND_TELEPHONE_STATUS | $80
	ld hl, MobilePacket_TelephoneStatus
	jp PacketSendEmptyBody

Function11236b:
	ld a, $99
	ld de, $000c
	jp Function111f02

Function112373:
	dec a
	jr z, Function11235a
	dec a
	jr z, .asm_112381
	dec a
	jr z, .asm_11239b
	dec a
	jr z, .asm_1123ad
	dec [hl]
	ret

.asm_112381
	ld a, [wc821]
	and $e0
	jr nz, .asm_11238c
	ld b, $92
	jr Function11234b

.asm_11238c
	cp $e0
	ld a, $11
	jr z, .asm_112393
	inc a

.asm_112393
	ld a, $3
	ld [wc86b], a
	jp Mobile_EndSession

.asm_11239b
	ld hl, wc822
	set 4, [hl]
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	set 6, [hl]
	ret

.asm_1123ad
	ld a, [wc872]
	call Function11225d
	jp Function1116a4

Function1123b6:
	dec a
	jr z, .wait_for_call
	dec a
	jr z, .asm_1123c6
	ret

.asm_1123bd
	dec [hl]

.wait_for_call
	ld a, MOBILE_COMMAND_WAIT_FOR_TELEPHONE_CALL | $80
	ld hl, MobilePacket_WaitForTelephoneCall
	jp PacketSendEmptyBody

.asm_1123c6
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $ee
	jr z, .asm_1123bd
	ld hl, wc822
	set 4, [hl]
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	set 6, [hl]
	set 5, [hl]
	ret

Function1123e1:
	dec a
	jr z, .asm_1123f2
	dec a
	jr z, .asm_11240a
	dec a
	jr z, .asm_112416
	dec a
	jr z, .asm_11241e
	dec a
	jr z, .asm_112421
	dec [hl]
	ret

.asm_1123f2
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, .asm_112408
	call Function1127e1
	jr z, .asm_112408
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 32
	jp Function1127c5

.asm_112408
	jr Function112430

.asm_11240a
	xor a
	ld [wc86d], a
	ld a, MOBILE_COMMAND_ISP_LOGOUT | $80
	ld hl, MobilePacket_ISPLogout
	jp PacketSendEmptyBody

.asm_112416
	ld a, MOBILE_COMMAND_HANG_UP_TELEPHONE | $80
	ld hl, MobilePacket_HangUpTelephone
	jp PacketSendEmptyBody

.asm_11241e
	jp Mobile_EndSession

.asm_112421
	ld hl, wc822
	res 4, [hl]
	ld hl, wc821
	ld a, [hl]
	and $f
	ld [hl], a
	jp Function1116a0

Function112430:
	ld a, $3
	ld [wc807], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_CloseTCPConnection
	ld b, MobilePacket_CloseTCPConnection.End - MobilePacket_CloseTCPConnection
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	inc b
	call Function111f63
	ld a, $a4
	ld hl, wMobileSDK_PacketBuffer
	jp Function111f02

Function112451:
	dec a
	jr z, .asm_112458
	dec a
	jr z, .asm_112496
	ret

.asm_112458
	ld b, $6
	ld de, wMobileSDK_PacketBuffer + 92
	call Function111f63
	ld a, [wc86e]
	inc a
	cp $3
	jr nz, .asm_11248b
	ld a, [wMobileSDK_ReceivePacketBuffer + 128]
	or a
	jr z, .asm_11248b
	ld hl, wc995
	ld a, [hli]
	cp $99
	jr nz, .asm_112480
	ld a, [hli]
	cp $66
	jr nz, .asm_112480
	ld a, [hli]
	cp $23
	jr z, .asm_11248b

.asm_112480
	ld hl, wMobileSDK_PacketBuffer + 80
	ld de, wc995
	ld b, $10
	call MobileSDK_CopyBytes

.asm_11248b
	ld a, $a3
	ld de, $0010
	ld hl, wMobileSDK_PacketBuffer + 80
	jp Function111f02

.asm_112496
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $a3
	jr z, .asm_1124ce
	ld a, [wc822]
	bit 3, a
	jr z, .asm_1124ab
	dec [hl]
	ld a, $3
	ld [wc807], a
	ret

.asm_1124ab
	ld a, [wc9af]
	cp $5
	jr c, .asm_1124b8
	ld hl, wc821
	set 1, [hl]
	ret

.asm_1124b8
	dec [hl]
	ld hl, wc9af
	inc [hl]
	ld hl, wc822
	set 3, [hl]
	ld hl, wc815
	ld a, [wc820]
	ld [hli], a
	ld a, [wc81f]
	ld [hl], a
	ret

.asm_1124ce
	xor a
	ld [wc9af], a
	ld a, [wc86e]
	inc a
	ld [wc86d], a
	dec a
	jp z, Function11261c
	dec a
	jp z, Function112654
	dec a
	jp z, Function112597
	dec a
	jp z, Function112566
	call Function1125c7
	push de
	ld de, wc880
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $1
	ld [wc86e], a
	ld a, $fa
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	pop de
	ld a, $1
	ld [wc994], a
	call Function11269b
	ld a, $5
	ld [wc86b], a
	call Function112534
	ld a, [wc9a5]
	or a
	jr z, .asm_112521
	ld a, $1

.asm_112521
	add $23
	ld [wc86a], a
	ld a, [wc98a]
	cp $2
	jr nz, .asm_112531
	xor a
	ld [wc9a5], a

.asm_112531
	jp Function1125bf

Function112534:
	ld b, $fa
	ld hl, wc880
	xor a
.asm_11253a
	ld [hli], a
	dec b
	jr nz, .asm_11253a
	ld a, [wc876]
	ld [wc87c], a
	ld a, [wc877]
	ld [wc87d], a
	ld a, [wc87a]
	ld [wc87e], a
	ld a, [wc87b]
	ld [wc87f], a
	ld a, c
	ld [wMobileSDK_PacketBuffer + 17], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 12
	jp Function111f02

Function112566:
	call Function1125c7
	ld a, [wMobileSDK_PacketBuffer + 19]
	and $1
	or a
	jr nz, .asm_11257d
	ld a, [wc98a]
	cp $2
	jr nz, .asm_11257d
	ld a, $1
	ld [wc994], a

.asm_11257d
	call Function11269b
	ld a, $5
	ld [wc86b], a
	call Function112534
	ld a, [wc9a5]
	or a
	jr z, .asm_112590
	ld a, $1

.asm_112590
	add $21
	ld [wc86a], a
	jr Function1125bf

Function112597:
	call Function1125c7
	call Function11269b
	ld a, $5
	ld [wc86b], a
	call Function112534
	ld a, [wc98f]
	ld b, a
	ld a, [wc994]
	and $1
	add $13
	bit 0, b
	jr z, .asm_1125bc
	sub $13
	add $1f
	dec b
	sla b
	add b

.asm_1125bc
	ld [wc86a], a

Function1125bf:
	ld hl, wc821
	set 0, [hl]
	res 2, [hl]
	ret

Function1125c7:
	ld hl, wc872
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [wc994]
	and $1
	xor $1
	ld [wc86b], a
	ld hl, wc827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, LOW(wc880)
	ld [hli], a
	ld a, HIGH(wc880)
	ld [hli], a
	dec bc
	dec bc
	ld a, $fa
	ld [hli], a
	ld a, $0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer + 12
	ld hl, MobilePacket_TransferData
	ld b, $5
	call MobileSDK_CopyBytes
	inc de
	ld a, [wc86c]
	ld [de], a
	inc de
	ret

Function11261c:
	xor a
	ld [wc86b], a
	ld a, [wc86c]
	ld [wMobileSDK_PacketBuffer + 118], a
	ld de, wMobileSDK_PacketBuffer + 102
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	call Function112724
	ld a, [wMobileSDK_PacketBuffer + 117]
	ld b, a
	ld de, wMobileSDK_PacketBuffer + 118
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld hl, wMobileSDK_PacketBuffer + 96
	call Function1127c5
	ld a, $11
	ld [wc86a], a

Function11264e:
	ld hl, wc821
	set 0, [hl]
	ret

Function112654:
	xor a
	ld [wc86b], a
	ld a, [wc86c]
	ld [wMobileSDK_PacketBuffer + 102], a
	ld [wMobileSDK_PacketBuffer + 166], a
	ld de, wMobileSDK_PacketBuffer + 134
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	call Function112724
	ld a, [wMobileSDK_PacketBuffer + 165]
	ld b, a
	ld de, wMobileSDK_PacketBuffer + 166
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld a, [wMobileSDK_PacketBuffer + 101]
	ld b, a
	ld de, wMobileSDK_PacketBuffer + 102
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld hl, wMobileSDK_PacketBuffer + 128
	call Function1127c5
	ld a, $12
	ld [wc86a], a
	jr Function11264e

Function11269b:
	ld bc, $0001
	ld hl, Unknown_112110
	ld a, [wc994]
	or a
	call nz, Function1126ac
	call MobileSDK_CopyString
	ret

Function1126ac:
	ld hl, Unknown_112137
	ret

Function1126b0:
	ld hl, Unknown_112115
	jp MobileSDK_CopyString

Function1126b6:
	ld hl, Unknown_112121
	call MobileSDK_CopyString
	ld hl, $013f
	ld b, $4
	call MobileSDK_CopyBytes
	ld a, $2d
	ld [de], a
	inc de
	ld a, [$014c]
	and $f0
	swap a
	or $30
	ld [de], a
	inc de
	ld a, [$014c]
	and $f
	or $30
	ld [de], a
	inc de
	ld a, $7
	add c
	ld c, a
	ld hl, Unknown_112132
	jp MobileSDK_CopyString

Function1126e6:
	xor a
	ld [wc86b], a
	ld hl, Unknown_11213d
	call MobileSDK_CopyString
	ld hl, wc9a5
	ld b, $5
.asm_1126f5
	ld a, [hl]
	cp $30
	jr nz, .asm_112701
	inc hl
	dec b
	ld a, $1
	cp b
	jr nz, .asm_1126f5

.asm_112701
	push bc
	call MobileSDK_CopyBytes
	ld a, $d
	ld [de], a
	inc de
	ld a, $a
	ld [de], a
	inc de
	pop bc
	ld a, b
	add $2
	add c
	ld c, a
	or c
	ret

Function112715:
	xor a
	ld [wc86c], a
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	ret

Function112724:
	ld a, $ff
	ld [wc86e], a

Function112729:
	push hl
	ld hl, wc82c
	xor a
	ld [hld], a
	ld a, $ff
	ld [hld], a
	ld a, HIGH(wc880)
	ld [hld], a
	ld a, LOW(wc880)
	ld [hl], a
	pop hl
	ret

Function11273a:
	dec a
	jr z, .asm_112752
	dec a
	jr z, .asm_11278f
	dec a
	jr z, .asm_112744
	ret

.asm_112744
	xor a
	ld [wc86d], a
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

.asm_112752
	call Function1127e1
	jr nz, .asm_11277a
	ld hl, wc880
	call Function112b11
	ld a, $2
	cp d
	jr nz, .asm_1127b7
	ld a, $20
	cp e
	jr nz, .asm_1127b7
	call Function112724
	ld a, [wMobileSDK_PacketBuffer + 117]
	add $a
	ld e, a
	ld d, 0
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 112
	jp Function111f02

.asm_11277a
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, Function1127cd
	ld hl, wc86b
	dec [hl]
	xor a
	ld [wMobileSDK_ReceivePacketBuffer + 3], a
	ld hl, wMobileSDK_PacketBuffer + 96
	jp Function1127c5

.asm_11278f
	call Function1127e1
	jr nz, .asm_11277a
	ld hl, wc880
	call Function112b11
	ld a, $2
	cp d
	jr nz, .asm_1127b7
	ld a, $50
	cp e
	jr nz, .asm_1127b7
	ld a, $3
	ld [wc86a], a
	ld hl, wc821
	ld a, [hl]
	and $d6
	or $80
	ld [hl], a
	xor a
	ld [wc98a], a
	ret

.asm_1127b7
	ld hl, wc810
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $2
	ld [wc86b], a
	jp Function112430

Function1127c5:
	ld de, $000b
	ld a, $95
	jp Function111f02

Function1127cd:
	ld hl, wc810
	xor a
	ld [hli], a
	ld [hl], a
	xor a
	ld [wc86d], a
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function1127e1:
	call Function112807
	ld hl, wc832

Function1127e7:
	ld a, [hli]
	cp $d
	ret nz
	ld a, [hl]
	cp $a
	ret nz
	ld a, $20
	ld [hl], a
	ret

Function1127f3:
	call Function112807
	ld hl, wc82f
	ld a, [hli]
	cp $d
	ret nz
	ld a, [hli]
	cp $a
	ret nz
	ld a, [hli]
	cp $2e
	ret nz
	jr Function1127e7

Function112807:
	push bc
	push de
	ld hl, wMobileSDK_ReceivePacketBuffer + 3
	ld a, [hl]
	dec a
	jr z, .asm_11282d
	ld c, a
	cp $5
	jr nc, .asm_112830
	ld a, $5
	sub c
	ld b, a
	ld e, c
	ld d, $0
	ld hl, wc82f
	add hl, de
	ld de, wc82f
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_ReceivePacketBuffer + 5
	ld b, c
.asm_11282a
	call MobileSDK_CopyBytes

.asm_11282d
	pop de
	pop bc
	ret

.asm_112830
	sub $5
	ld c, a
	ld b, 0
	ld hl, wMobileSDK_ReceivePacketBuffer + 5
	add hl, bc
	ld b, $5
	ld de, wc82f
	jr .asm_11282a

Function112840:
	dec a
	jr z, .asm_112844
	ret

.asm_112844
	call Function1127e1
	jr nz, .asm_1128ab
	ld hl, wc880
	ld a, [hli]
	cp $32
	jr nz, Function1128bd
	ld a, [hli]
	cp $35
	jr nz, Function1128bd
	call Function112724
	ld hl, wc87c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_11289d
	push hl
	ld hl, wc86b
	dec [hl]
	ld bc, $0001
	ld de, wMobileSDK_PacketBuffer + 19
	ld hl, Unknown_1120b0
	call MobileSDK_CopyString
	pop hl
	ld a, $80
	call MobileSDK_CopyStringLen
	ld a, $3e
	ld [de], a
	inc de
	inc c
	ld a, l
	ld [wc87c], a
	ld a, h
	ld [wc87d], a
	call Function11295e
	ld a, c
	ld [wMobileSDK_PacketBuffer + 17], a
	ld b, c
	call Function111f63
	ld hl, wMobileSDK_PacketBuffer + 12
	ld d, $0
	ld e, c
	ld a, $95
	jp Function111f02

.asm_11289d
	ld a, $3
	ld [wc86a], a
	call Function1128d3
	ld a, $1
	ld [wc98a], a
	ret

.asm_1128ab
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function1127cd
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer
	jp Function1127c5

Function1128bd:
	ld hl, wc880
	call Function112b11
	ld hl, wc810
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function1128d3:
	ld hl, wc821
	res 0, [hl]
	res 2, [hl]
	ret

Function1128db:
	dec a
	jr z, .asm_112947
	dec a
	jr z, .asm_1128e5
	dec a
	jr z, .asm_112913
	ret

.asm_1128e5
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function1127cd
	call Function113482
	ld a, [wc86e + 1]
	or a
	jr nz, .asm_112901
	ld a, $3
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	ret

.asm_112901
	call Function112724
	ld de, wMobileSDK_PacketBuffer + 5
	ld a, $1
	ld [de], a
	inc de
	inc de
	ld b, $1
	call Function111f63
	jr .asm_112941

.asm_112913
	call Function1127e1
	jr nz, .asm_11293d
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function1127cd
	ld hl, wc880
	call Function112b11
	ld a, d
	cp $2
	jr nz, .asm_11295b
	ld a, e
	cp $50
	jr nz, .asm_11295b
	ld a, $3
	ld [wc86a], a
	call Function1128d3
	xor a
	ld [wc98a], a
	ret

.asm_11293d
	ld hl, wc86b
	dec [hl]

.asm_112941
	ld hl, wMobileSDK_PacketBuffer
	jp Function1127c5

.asm_112947
	call Function1127e1
	jr nz, .asm_11293d
	ld hl, wc880
	call Function112b11
	ld a, d
	cp $3
	jr nz, .asm_11295b
	ld a, e
	cp $54
	ret z

.asm_11295b
	jp Function1128bd

Function11295e:
	ld a, $d
	ld [de], a
	inc de
	inc c
	ld a, $a
	ld [de], a
	inc de
	inc c
	ret

Function112969:
	dec a
	jr z, .asm_112970
	dec a
	jr z, .asm_112989
	ret

.asm_112970
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, .asm_112986
	call Function1127e1
	jr z, .asm_112986
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 32
	jp Function1127c5

.asm_112986
	jp Function112430

.asm_112989
	xor a
	ld [wc86d], a
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	res 7, [hl]
	set 5, [hl]
	ret

Function11299c:
	dec a
	jr z, .asm_1129aa
	dec a
	jr z, .asm_1129c9
	dec a
	jr z, .asm_1129e7
	dec a
	jp z, .asm_112a1d
	ret

.asm_1129aa
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [wc880]
	cp $2b
	jr nz, .asm_112a0f
	call Function112724
	ld a, [wMobileSDK_PacketBuffer + 101]
	add $a
	ld e, a
	ld d, 0
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 96
	jp Function111f02

.asm_1129c9
	ld d, a
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [wc880]
	cp $2b
	jr nz, .asm_112a0f
	call Function112724
	ld a, [wMobileSDK_PacketBuffer + 165]
	add $a
	ld e, a
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 160
	jp Function111f02

.asm_1129e7
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [wc880]
	cp $2b
	jr nz, .asm_112a0f
	ld a, $4
	ld [wc86a], a
	call Function1128d3
	set 7, [hl]
	ret

.asm_1129fe
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, Function112a42
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 128
	jp Function1127c5

.asm_112a0f
	ld a, [wc86b]
	ld [wMobileSDK_PacketBuffer + 32], a
	ld a, $3
	ld [wc86b], a
	jp Function112430

.asm_112a1d
	xor a
	ld [wc86d], a
	ld de, $0002
	ld a, [wMobileSDK_PacketBuffer + 32]
	cp $1
	jr z, .asm_112a2c
	inc de
.asm_112a2c

Function112a2c:
	ld hl, wc821
	set 1, [hl]
	res 0, [hl]
	ld hl, wc80f
	ld a, $31
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $5
	ld [wc86a], a
	ret

Function112a42:
	ld hl, wc810
	xor a
	ld [hli], a
	ld [hl], a
	xor a
	ld [wc86d], a
	ld a, $31
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function112a56:
	dec a
	jr z, .asm_112a5a
	ret

.asm_112a5a
	call Function1127e1
	jr nz, .asm_112a95
	ld hl, wc880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112aa6
.asm_112a67
	ld a, [hli]
	cp $20
	jr nz, .asm_112a67
	call Function112aac
	ld a, [wc86e]
	ld c, a
	ld a, [wc86e + 1]
	ld b, a
	ld a, e
	ld [bc], a
	inc bc
	ld a, d
	ld [bc], a
	call Function112aac
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $4
	ld [wc86a], a
	jp Function1128d3

.asm_112a95
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, Function112a42
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 128
	jp Function1127c5

.asm_112aa6
	ld de, $0005
	jp Function112a2c

Function112aac:
	ld a, [wc872]
	push af
	ld a, [wc873]
	push af
	ld a, [wc874]
	push af
	ld bc, 0
	ld de, 0
.asm_112abe
	ld a, [hli]
	cp $d
	jr z, .asm_112b04
	cp $20
	jr z, .asm_112b04
	and $f
	ld b, a
	sla e
	rl d
	rl c
	ld a, e
	ld [wc872], a
	ld a, d
	ld [wc873], a
	ld a, c
	ld [wc874], a
	sla e
	rl d
	rl c
	sla e
	rl d
	rl c
	ld a, [wc872]
	add e
	ld e, a
	ld a, [wc873]
	adc d
	ld d, a
	ld a, [wc874]
	adc c
	ld c, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $0
	adc c
	ld c, a
	jr .asm_112abe

.asm_112b04
	pop af
	ld [wc874], a
	pop af
	ld [wc873], a
	pop af
	ld [wc872], a
	ret

Function112b11:
	ld a, [wc872]
	push af
	ld a, [wc873]
	push af
	ld a, [wc874]
	push af
	ld bc, $0300
	ld de, wc872
	call .asm_112b60
	call nc, .asm_112b60
	call nc, .asm_112b60
	dec hl
.asm_112b2d
	ld a, [hli]
	cp "\r"
	jr z, .asm_112b36
	cp " "
	jr nz, .asm_112b2d

.asm_112b36
	push hl
	ld hl, wc872
	ld de, 0
	ld a, b
	or a
	jr z, .asm_112b49
	dec a
	jr z, .asm_112b4b
	dec a
	jr z, .asm_112b4f
	jr .asm_112b52

.asm_112b49
	ld a, [hli]
	ld d, a

.asm_112b4b
	ld a, [hli]
	swap a
	ld e, a

.asm_112b4f
	ld a, [hli]
	or e
	ld e, a

.asm_112b52
	pop hl
	pop af
	ld [wc874], a
	pop af
	ld [wc873], a
	pop af
	ld [wc872], a
	ret

.asm_112b60:
	ld a, [hli]
	cp "0"
	jr c, .asm_112b6f
	cp "9" + 1
	jr nc, .asm_112b6f
	and $f
	ld [de], a
	inc de
	dec b
	ret

.asm_112b6f
	scf
	ret

Function112b71:
	dec a
	jr z, .asm_112b75
	ret

.asm_112b75
	call Function1127e1
	jr nz, .asm_112ba3
	ld hl, wc880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112bb5
.asm_112b82
	ld a, [hli]
	cp $20
	jr nz, .asm_112b82
.asm_112b87
	ld a, [hli]
	cp $20
	jr nz, .asm_112b87
	call Function112aac
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $4
	ld [wc86a], a
	jp Function1128d3

.asm_112ba3
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function112a42
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 128
	jp Function1127c5

.asm_112bb5
	ld de, $0004
	jp Function112a2c

Function112bbb:
	dec a
	jr z, .asm_112bbf
	ret

.asm_112bbf
	call Function1127e1
	jr nz, .asm_112bd4
	ld hl, wc880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112be6
	ld a, $4
	ld [wc86a], a
	jp Function1128d3

.asm_112bd4
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function112a42
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 128
	jp Function1127c5

.asm_112be6
	ld de, $0004
	jp Function112a2c

Function112bec:
	dec a
	jr z, .asm_112bf7
	dec a
	jp z, .asm_112cdb
	dec a
	ret nz
	dec [hl]
	ret

.asm_112bf7
	ld a, [wc880]
	cp $2d
	jr nz, .asm_112c03
	call Function1127e1
	jr z, .asm_112c0b

.asm_112c03
	ld a, [wc821]
	bit 2, a
	jp z, .asm_112cef

.asm_112c0b
	ld hl, wc86b
	inc [hl]
	ld hl, wc880
	ld a, [hli]
	cp $2b
	jp nz, Function112d20
	ld b, $7f
.asm_112c1a
	ld a, [hli]
	dec b
	cp $a
	jr nz, .asm_112c1a
	push hl
	ld hl, wc98f
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, b
	ld [wc82d], a
	ld a, [hli]
	ld h, [hl]
	sub b
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr nc, .asm_112c56
	cp $ff
	jr nz, .asm_112c56
	ld hl, wc991
	ld a, [hli]
	ld c, a
	inc hl
	ld a, b
	sub c
	ld [hli], a
	ld a, [wc82b]
	ld [hl], a
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	pop hl
	ld b, c
	jp MobileSDK_CopyBytes

.asm_112c56
	ld [wc993], a
	ld a, [wc82b]
	ld c, a
	ld [wc994], a
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr nc, .asm_112c9f
	cp $ff
	jr nz, .asm_112c9f
	ld a, c
	ld [wMobileSDK_ReceivePacketBuffer + 1], a
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	sub c
	pop hl
	ld c, l
	pop hl
	push af
	call MobileSDK_CopyBytes
	pop af
	push de
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	ld e, a
	ld d, 0
	add hl, de
	pop de
	ld b, c
	call MobileSDK_CopyBytes
	ld a, [wMobileSDK_ReceivePacketBuffer + 1]
	sub c
	ld [wc994], a
	ld hl, wc827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc991]
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_112c9f
	ld [wc994], a
	ld a, l
	ld [wc82b], a
	ld a, h
	ld [wc82c], a
	pop hl
	pop hl
	call MobileSDK_CopyBytes
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	sub c
	push de
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	ld e, a
	ld d, 0
	add hl, de
	pop de
	ld b, c
	call MobileSDK_CopyBytes
	ld a, [wc82d]
	add c
	ld [wc82d], a
	ld a, [wc82e]
	adc 0
	ld [wc82e], a
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld hl, wc821
	res 2, [hl]

.asm_112cdb
	ld a, [wc821]
	bit 2, a
	jr z, .asm_112cea
	ld a, $2
	ld [wc86b], a
	jp .asm_112d09

.asm_112cea
	call Function1127f3
	jr z, .asm_112d01

.asm_112cef
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp z, Function112a42
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer + 128
	jp Function1127c5

.asm_112d01
	ld a, $4
	ld [wc86a], a
	call Function1128d3

.asm_112d09
	ld a, [wc86e]
	ld l, a
	ld a, [wc86e + 1]
	or l
	ret z
	ld hl, wc827
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wc82d
	ld b, $2
	jp MobileSDK_CopyBytes

Function112d20:
	ld a, [wc86a]
	cp $1a
	jr nz, .asm_112d2d
	ld de, $0004
	jp Function112a2c

.asm_112d2d
	ld de, $0004
	jp Function112a2c

Function112d33:
	dec a
	jr z, .asm_112d87
	dec a
	jr z, .asm_112d9f
	dec a
	jp z, .asm_112e46
	dec a
	jr z, .asm_112d4d
	dec a
	jp z, Function113317
	dec a
	jp z, Function113386
	dec a
	jp .asm_112e46

.asm_112d4c ; unreferenced
	ret

.asm_112d4d
	ld a, [wc86a]
	cp $23
	jr z, .asm_112d6d
	cp $1f
	jr z, .asm_112d60
	cp $20
	jr z, .asm_112d6d
	cp $22
	jr nz, .asm_112d82

.asm_112d60
	ld hl, wc98b
	ld a, [hli]
	cp $1
	jr nz, .asm_112d82
	ld a, [hl]
	cp $4
	jr nz, .asm_112d82

.asm_112d6d
	ld hl, wc86e
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wc82b
	ld [hli], a
	ld [hl], a
	ld hl, wc821
	res 2, [hl]
	ld hl, wc86b
	dec [hl]
	dec [hl]

.asm_112d82
	ld hl, wc86b
	dec [hl]
	ret

.asm_112d87
	call Function113482
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63

.asm_112d9f
	ld a, [wc821]
	bit 2, a
	jr z, .asm_112dab
	ld a, $3
	ld [hl], a
	jr .asm_112dc1

.asm_112dab
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp MOBILE_COMMAND_TRANSFER_DATA_END | $80
	jr z, .asm_112dc1
	ld hl, wc86b
	dec [hl]
	ld de, $000b
	ld hl, wMobileSDK_PacketBuffer
	ld b, $5
	jp PacketSendBytes

.asm_112dc1
	ld a, [wc989]
	cp $2
	jr nc, .asm_112df2
	call Function112f61
	bit 2, a
	ret nz
	cp $3
	jr z, .asm_112e38
	cp $1
	jr nz, .asm_112df2
	ld a, [wc86a]
	cp $1f
	jr z, .asm_112de1
	cp $20
	jr nz, .asm_112df2

.asm_112de1
	ld hl, wc98b
	ld a, [hli]
	cp $1
	jr nz, .asm_112df2
	ld a, $4
	cp [hl]
	jr nz, .asm_112df2
	xor a
	ld [wc990], a

.asm_112df2
	ld a, [wc86e]
	ld l, a
	ld a, [wc86e + 1]
	or l
	ret z
	ld a, [wc86a]
	cp $13
	jr z, .asm_112e21
	cp $14
	jr z, .asm_112e21
	cp $20
	ret z
	cp $22
	ret z
	cp $23
	ret z
	cp $1f
	jr nz, .asm_112e21
	ld hl, wc98b
	ld a, [hli]
	cp $0
	ret nz
	ld a, $2
	cp [hl]
	ret nz
	ld a, [wc86a]

.asm_112e21
	cp $24
	jr nz, .asm_112e2a
	ld hl, wc878
	jr .asm_112e2d

.asm_112e2a
	ld hl, wc827

.asm_112e2d
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wc82d
	ld b, $2
	jp MobileSDK_CopyBytes

.asm_112e38
	ld hl, wc821
	set 1, [hl]
	res 0, [hl]
	ld de, wc98b
	ld a, $24
	jr .asm_112e95

.asm_112e46
	ld a, [wc86a]
	cp $1f
	jr z, .asm_112ea6
	cp $20
	jr z, .asm_112ea6
	ld a, [wc98a]
	cp $1
	jr z, .asm_112e65
	ld a, [wc86a]
	cp $21
	jp z, .asm_112eea
	cp $22
	jp z, .asm_112eea

.asm_112e65
	ld a, [wc990]
	or a
	jp z, .asm_112f3d
.asm_112e6c
	ld hl, wc98c
	ld a, [hld]
	cp $3
	jr nz, .asm_112e7f
	ld a, [hl]
	or a
	jr z, .asm_112e7f
	cp $3
	jr nc, .asm_112e7f
	call Function1133fe

.asm_112e7f
	ld hl, wc821
	set 1, [hl]
	res 0, [hl]
	ld de, wc98b
	ld a, [wc990]
	cp $1
	ld a, $32
	jr z, .asm_112e95
	inc de
	inc de
	inc a

.asm_112e95
	ld [wc80f], a
	ld hl, wc810
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld a, $5
	ld [wc86a], a
	ret

.asm_112ea6
	ld hl, wc98b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $0
	jr nz, .asm_112ec1
	ld a, $2
	cp h
	jr nz, .asm_112ec1
	ld a, [wc98d]
	ld b, a
	ld a, [wc98e]
	or b
	jr nz, .asm_112e6c
	jr .asm_112f3d

.asm_112ec1
	ld a, $1
	cp l
	jr nz, .asm_112e6c
	ld a, $4
	cp h
	jr nz, .asm_112e6c
	ld a, [wc9a5]
	or a
	jr nz, .asm_112efb
	ld a, [wc86e]
	ld l, a
	ld a, [wc86e + 1]
	or l
	jr nz, .asm_112efb
	ld a, $2
	ld [wc86a], a
	xor a
	ld [wc86d], a
	ld hl, wc821
	res 0, [hl]
	ret

.asm_112eea
	ld hl, wc98b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $0
	jp nz, .asm_112e6c
	ld a, $2
	cp h
	jp nz, .asm_112e6c

.asm_112efb
	ld a, [wc98d]
	ld b, a
	ld a, [wc98e]
	cp b
	jp nz, .asm_112e6c
	or a
	jr z, .asm_112f13
	cp $1
	jp nz, .asm_112e6c
	ld a, $1
	ld [wc993], a

.asm_112f13
	ld a, [wc86b]
	cp $7
	jr z, .asm_112f3d
	ld hl, wc98f
	inc [hl]
	ld a, $f
	ld [wc86a], a
	ld a, $1
	ld [wc86b], a
	ld a, [wc86d]
	ld [wc86e], a
	xor a
	ld [wc989], a
	ld a, $a3
	ld de, $0010
	ld hl, wc995
	jp Function111f02

.asm_112f3d
	ld a, [wc993]
	cp $1
	jr nz, .asm_112f52
	ld a, $2
	ld [wc990], a
	ld hl, wc98d
	dec a
	ld [hli], a
	ld [hl], a
	jp .asm_112e7f

.asm_112f52
	ld a, $2
	ld [wc86a], a
	xor a
	ld [wc86d], a
	ld hl, wc821
	res 0, [hl]
	ret

Function112f61:
	ld hl, wc989
	ld a, [hl]
	or a
	jr nz, .asm_112f8a
	inc [hl]
	ld hl, wc880
	ld de, $0008
	add hl, de
.asm_112f70
	ld a, [hli]
	cp $20
	jr z, .asm_112f70
	dec hl
	ld d, $0
	cp $32
	jr z, .asm_112f7d
	inc d

.asm_112f7d
	ld a, d
	ld [wc990], a
	call Function112b11
	ld hl, wc98b
	ld a, e
	ld [hli], a
	ld [hl], d

.asm_112f8a
	ld hl, wc880
	ld a, [wc82d]
	ld b, a
	or a
	jr nz, .asm_112fa1
	ld hl, wc98b
	ld a, $0
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [wc990], a
	ret

.asm_112fa1
	call Function112fd5
	call Function113008
	call Function113026
	call Function113054
	call Function113167
	call Function113180
	call Function113268
	jr c, .asm_112fc9
	ld a, $d
	cp [hl]
	jr z, .asm_112fc2
	ld a, $a
	cp [hl]
	jr nz, .asm_112fa1

.asm_112fc2
	ld hl, wc990
	res 2, [hl]
	jr .asm_112fce

.asm_112fc9
	ld hl, wc990
	set 2, [hl]

.asm_112fce
	call Function11306b
	ld a, [wc990]
	ret

Function112fd5:
	ld de, Unknown_113001
	push hl
	call Function113281
	jr nc, .asm_112fe0
	pop hl
	ret

.asm_112fe0
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_112fe6
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_112fe6
	pop hl
	ld c, b
	ld a, [wc833]
	ld e, a
	ld a, [wc834]
	ld d, a
	or e
	jr z, .asm_112ffe
	call MobileSDK_CopyBytes
	xor a
	ld [de], a

.asm_112ffe
	pop hl
	pop bc
	ret

Unknown_113001:
	db "date: ", 0

Function113008:
	ld de, Unknown_1132a6
	push hl
	call Function113273
	jr nc, .asm_113013
	pop hl
	ret

.asm_113013
	call Function112b11
	ld hl, wc98d
	ld a, e
	ld [hli], a
	ld [hl], d
	pop hl
	ld a, d
	or e
	ret z
	ld a, $2
	ld [wc990], a
	ret

Function113026:
	ld de, Unknown_1132b2
	push hl
	call Function113273
	jr nc, .asm_113031
	pop hl
	ret

.asm_113031
	pop hl
	push bc
	push hl
	push hl
	ld b, $0
.asm_113037
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113037
	pop hl
	ld c, b
	ld de, wMobileSDK_PacketBuffer + 18
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 18
	ld de, wc9b5
	ld b, c
	call MobileSDK_CopyBytes
	xor a
	ld [de], a
	pop hl
	pop bc
	ret

Function113054:
	ld de, Unknown_1132bf
	push hl
	call Function113273
	jr nc, .asm_11305f
	pop hl
	ret

.asm_11305f
	push bc
	ld de, wc9b5
	ld b, $30
	call Function1136c1
	pop bc
	pop hl
	ret

Function11306b:
	ld hl, wc880
	ld a, [wc82d]
	ld b, a

Function113072:
	call Function113268
	jp nc, Function113089
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jp nz, Function1131a9
	push hl
	ld hl, wc990
	res 2, [hl]
	pop hl
	jr Function113095

Function113089:
	ld a, [hl]
	cp $d
	jr z, .asm_113094
	cp $a
	jr z, Function113095
	jr Function113072

.asm_113094
	inc hl

Function113095:
	inc hl
	push bc
	ld a, [wc872]
	ld b, a
	ld a, [wc873]
	or b
	pop bc
	jr z, .asm_1130b3
	ld a, [wc86a]
	cp $23
	jr z, .asm_1130b3
	cp $20
	jr z, .asm_1130b3
	cp $22
	jr z, .asm_1130b3
	jr .asm_1130d6

.asm_1130b3
	xor a
	ld hl, wc86e
	ld [hli], a
	ld [hl], a
	ld hl, wc821
	res 2, [hl]
	ld a, [wc86a]
	cp $13
	jr z, .asm_1130c8
	cp $14
	ret nz

.asm_1130c8
	ld a, $6
	ld [wc86b], a
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	ret z
	jp Function112430

.asm_1130d6
	ld a, [wc82b]
	ld c, a
	dec b
	dec b
	ld a, b
	ld [wc82d], a
	jr z, .asm_11310d
	ld a, [wc873]
	ld d, a
	ld a, [wc872]
	ld e, a
	dec de
	dec de
	xor a
	or d
	jr nz, .asm_1130f5
	ld a, e
	cp b
	jp c, Function113206

.asm_1130f5
	ld a, e
	sub b
	ld [wc82b], a
	ld a, d
	sbc $0
	ld [wc82c], a
	ld a, [wc874]
	ld e, a
	ld a, [wc875]
	ld d, a
	inc de
	inc de
	call MobileSDK_CopyBytes

.asm_11310d
	ld a, [wMobileSDK_ReceivePacketBuffer]
	cp $9f
	jr z, .asm_113150
	ld a, [wMobileSDK_ReceivePacketBuffer + 3]
	or a
	jr z, .asm_113150
	ld l, c
	sub c
	ld c, a
	ld a, l
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	add hl, bc
	ld b, a
	push de
	ld a, [wc82b]
	ld e, a
	ld a, [wc82c]
	ld d, a
	xor a
	or d
	jr nz, .asm_113135
	ld a, e
	cp b
	jp c, Function113245

.asm_113135
	pop de
	push hl
	ld hl, wc82d
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ld c, b
	pop hl
	call MobileSDK_CopyBytes
	ld hl, wc82b
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc $0
	ld [hl], a

.asm_113150
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld hl, wc821
	res 2, [hl]
	ld a, $1
	ld [wc86b], a
	ld a, $2
	ld [wc989], a
	ret

Function113167:
	ld de, Unknown_1132ff
	push hl
	call Function113273
	jr nc, .asm_113172
	pop hl
	ret

.asm_113172
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_113178
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113178
	jr Function113197

Function113180:
	ld de, Unknown_11330c
	push hl
	call Function113273
	jr nc, .asm_11318b
	pop hl
	ret

.asm_11318b
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_113191
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113191

Function113197:
	pop hl
	ld c, b
	ld de, wMobileSDK_PacketBuffer + 16
	ld a, b
	ld [de], a
	inc de
	dec b
	dec b
	call MobileSDK_CopyBytes
	xor a
	ld [de], a
	pop hl
	pop bc
	ret

Function1131a9:
	ld hl, wc979
	ld de, wc880
	ld b, $0
	ld c, b
	ld a, [hl]
	cp $a
	jr z, .asm_1131c4
.asm_1131b7
	ld a, [hld]
	inc b
	cp $a
	jr nz, .asm_1131b7
	inc hl
	inc hl
	dec b
	ld c, b
	call MobileSDK_CopyBytes

.asm_1131c4
	ld a, [wc82b]
	ld b, a
	add c
	ld c, a
	push bc
	ld a, $ff
	sub b
	ld c, a
	ld b, 0
	ld hl, wMobileSDK_ReceivePacketBuffer + 4
	add hl, bc
	pop bc
	call MobileSDK_CopyBytes
	ld a, c
	ld [wc82d], a
	ld a, $fa
	sub c
	ld [wc82b], a
	ld hl, wc829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld l, e
	ld h, d
	ld de, wc97a
.asm_1131ef
	xor a
	ld [hli], a
	ld a, l
	cp e
	jr nz, .asm_1131ef
	ld a, d
	cp h
	jr nz, .asm_1131ef
	ld hl, wc821
	res 2, [hl]
	ld hl, wc86b
	dec [hl]
	dec [hl]
	ld a, $4
	ret

Function113206:
	ld a, b
	sub e
	ld [wc991], a
	ld a, [wc821]
	bit 2, a
	ld a, c
	jr nz, .asm_113214
	xor a

.asm_113214
	ld [wc992], a
	ld b, e
	ld c, e
	ld a, [wc874]
	ld e, a
	ld a, [wc875]
	ld d, a
	inc de
	inc de
	call MobileSDK_CopyBytes
	ld a, [wc991]
	ld [wc993], a
	ld b, a
	ld de, wc880
	call MobileSDK_CopyBytes
	ld hl, wc82d
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, wc821
	set 2, [hl]
	ld a, $3
	ld [wc86b], a
	ret

Function113245:
	ld a, b
	sub e
	ld [wc992], a
	ld [wc82b], a
	ld b, e
	ld c, e
	pop de
	call MobileSDK_CopyBytes
	ld hl, wc82d
	ld a, c
	add [hl]
	ld [hli], a
	ld a, $0
	adc [hl]
	ld [hl], a
	ld hl, wc821
	set 2, [hl]
	ld a, $3
	ld [wc86b], a
	ret

Function113268:
.asm_113268
	dec b
	ld a, [hli]
	cp $a
	ret z
	xor a
	or b
	jr nz, .asm_113268
	scf
	ret

Function113273:
	ld c, $0
.asm_113275
	ld a, [de]
	inc de
	or a
	ret z
	xor [hl]
	inc hl
	or c
	ld c, a
	jr z, .asm_113275
	scf
	ret

Function113281:
	ld c, $0
	push hl
	ld l, e
	ld h, d
	pop de
.asm_113287
	ld a, [de]
	inc de
	call Function11329d
	xor [hl]
	inc hl
	or c
	ld c, a
	xor a
	cp [hl]
	jr z, .asm_113298
	cp c
	jr z, .asm_113287
	scf

.asm_113298
	push hl
	ld l, e
	ld h, d
	pop de
	ret

Function11329d:
	cp $41
	ret c
	cp $5b
	ret nc
	or $20
	ret

Unknown_1132a6:
	db "Gb-Status: ", 0
Unknown_1132b2:
	db "Gb-Auth-ID: ", 0
Unknown_1132bf:
	db "WWW-Authenticate: GB00 name=", $22, 0
Unknown_1132dd:
	db "Content-Type: application/x-cgb", $d, "\n", 0
Unknown_1132ff:
	db "URI-header: ", 0
Unknown_11330c:
	db "Location: ", 0

Function113317:
	ld a, $1
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer + 18
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	call Function1126b0
	ld hl, Unknown_1132dd
	ld a, [wc9a5]
	or a
	call nz, MobileSDK_CopyString
	ld a, [wc86a]
	cp $22
	jr nz, .asm_113344
	ld a, [wc98a]
	cp $2
	jr nz, .asm_113351
	jr .asm_113348

.asm_113344
	cp $24
	jr nz, .asm_113351

.asm_113348
	ld a, [wc9a5]
	or a
	jr z, .asm_11336a
	call Function1133de

.asm_113351
	ld hl, wc9b5
	call MobileSDK_CopyString
	call Function1126b6
	ld a, c
	ld [wMobileSDK_PacketBuffer + 17], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 12
	jp Function111f02

.asm_11336a
	ld hl, Unknown_113372
	call MobileSDK_CopyString
	jr .asm_113351

Unknown_113372:
	db "Content-Length: 0", $d, "\n", 0

Function113386:
	call Function113482
	ld a, $1
	ld [wc86b], a
	ld de, wMobileSDK_PacketBuffer
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, wMobileSDK_PacketBuffer + 12
	ld hl, MobilePacket_TransferData
	ld b, $6
	call MobileSDK_CopyBytes
	ld a, [wc86d]
	cp $3
	jp nz, Function113317
	ld de, wMobileSDK_PacketBuffer + 18
	ld a, [wc86c]
	ld [de], a
	inc de
	ld bc, $0001
	call Function1126b0
	ld a, [wc994]
	or a
	call nz, Function1133de
	call Function1126b6
	ld a, c
	ld [wMobileSDK_PacketBuffer + 17], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, wMobileSDK_PacketBuffer + 12
	jp Function111f02

Function1133de:
	call Function1126e6
	xor a
	ld [wc86b], a
	ld a, [wc9aa]
	ld [wc87c], a
	ld a, [wc9ab]
	ld [wc87d], a
	ld a, [wc9ac]
	ld [wc87e], a
	ld a, [wc9ad]
	ld [wc87f], a
	ret

Function1133fe:
	ld hl, wMobileSDK_PacketBuffer + 17
	ld a, [hli]
	cp "h"
	jr nz, .asm_113432
	ld a, [hli]
	cp "t"
	jr nz, .asm_113432
	ld a, [hli]
	cp "t"
	jr nz, .asm_113432
	ld a, [hli]
	cp "p"
	jr nz, .asm_113432
	ld a, [hli]
	cp ":"
	jr nz, .asm_113432
	ld a, [hli]
	cp "/"
	jr nz, .asm_113432
	ld a, [hli]
	cp "/"
	jr nz, .asm_113432
	ld hl, wMobileSDK_PacketBuffer + 16
	ld de, wc880
	ld a, [hli]
	ld b, a
	call MobileSDK_CopyBytes
	xor a
	ld [de], a
	ret

.asm_113432
	ld a, [wMobileSDK_PacketBuffer + 17]
	cp "/"
	jr z, .asm_113460
	ld de, wc880
	ld hl, wc9b5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call MobileSDK_CopyString
	ld l, e
	ld h, d
.asm_11344c
	ld a, [hld]
	cp "/"
	jr nz, .asm_11344c
	inc hl
	inc hl
	ld e, l
	ld d, h
.asm_113455
	ld hl, wMobileSDK_PacketBuffer + 16
	ld a, [hli]
	ld b, a
	call MobileSDK_CopyBytes
	xor a
	ld [de], a
	ret

.asm_113460
	ld de, wc880
	ld hl, wc9b5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp "/"
	jr z, .asm_113478
	ld b, $7
	call MobileSDK_CopyBytes

.asm_113478
	ld a, [hli]
	ld [de], a
	inc de
	cp "/"
	jr nz, .asm_113478
	dec de
	jr .asm_113455

Function113482:
	ld hl, wc87f
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, b
	or c
	ret z
	pop hl
	ld hl, rSC
	add hl, bc
	jr c, .asm_113496
	xor a
	ld l, a
	ld h, a

.asm_113496
	ld e, l
	ld d, h
	ld hl, wc87f
	ld a, d
	ld [hld], a
	ld a, e
	ld [hld], a
	jr nc, .asm_1134a3
	ld c, $fe

.asm_1134a3
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, c
	inc a
	ld [wMobileSDK_PacketBuffer + 5], a
	ld de, wMobileSDK_PacketBuffer + 7
	ld b, c
	call MobileSDK_CopyBytes
	ld a, l
	ld [wc87c], a
	ld a, h
	ld [wc87d], a
	ld b, c
	inc b
	call Function111f63
	ld hl, wc86b
	dec [hl]
	ld hl, wMobileSDK_PacketBuffer
	ld a, $95
	jp Function111f02

Function1134cb:
	dec a
	jr z, .asm_1134d9
	dec a
	jr z, .asm_1134f4
	dec a
	jr z, .asm_1134fc
	dec a
	jr z, .asm_11350e
	dec [hl]
	ret

.asm_1134d9
	ld a, [wMobileSDK_ReceivePacketBuffer + 4]
	cp $0
	jr z, .asm_1134f0
	cp $ff
	jr z, .asm_1134f0
	ld a, [wc985]
	ld [wc86a], a
	ld hl, wc821
	res 0, [hl]
	ret

.asm_1134f0
	inc [hl]
	inc [hl]
	jr .asm_1134fc

.asm_1134f4
	ld a, MOBILE_COMMAND_TELEPHONE_STATUS | $80
	ld hl, MobilePacket_TelephoneStatus
	jp PacketSendEmptyBody

.asm_1134fc
	ld hl, wc86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMobileSDK_ReceivePacketBuffer + 6]
	cp $f0
	jr c, .asm_11350b
	set 7, [hl]

.asm_11350b
	jp Mobile_EndSession

.asm_11350e
	ld a, [wc86a]
	cp $1e
	jp nz, Function112251
	jp Function1116a0

Function113519:
	dec a
	jr z, .asm_113527
	dec a
	jr z, .asm_11352d
	dec a
	jr z, .asm_11353c
	dec a
	jr z, .asm_11353f
	dec [hl]
	ret

.asm_113527
	ld hl, MobilePacket_ReadConfigurationDataPart1
	jp Function11236b

.asm_11352d
	ld hl, wc829
	ld a, LOW(wc8ca + 22)
	ld [hli], a
	ld a, HIGH(wc8ca + 22)
	ld [hli], a
	ld hl, MobilePacket_ReadConfigurationDataPart2
	jp Function11236b

.asm_11353c
	jp Mobile_EndSession

.asm_11353f
	ld hl, wc880
	ld a, [hli]
	cp "M"
	jr nz, .asm_113586
	ld a, [hld]
	cp "A"
	jr nz, .asm_113586
	ld b, $be
	ld de, 0
.asm_113551
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_113551
	ld a, [hli]
	cp d
	jr nz, .asm_11358a
	ld a, [hl]
	cp e
	jr nz, .asm_11358a
	ld a, [wc86e]
	ld e, a
	ld a, [wc86e + 1]
	ld d, a
	ld hl, .asm_11357e
	push hl
	ld a, [wc86a]
	cp $25
	jr z, Function1135ba
	cp $26
	jr z, Function11359d
	cp $27
	jr z, Function1135ad
.asm_11357e
	ld a, $1
	ld [wc835], a
	jp Function1116a0

.asm_113586
	ld a, $25
	jr .asm_11358c

.asm_11358a
	ld a, $14

.asm_11358c
	call Function11225d
	jp Function1116a4

Function113592:
	push de
	ld l, e
	ld h, d
	xor a
	ld [hl], a
	inc de
	call MobileSDK_CopyBytes
	pop de
	ret

Function11359d:
	ld b, $20
	call Function113592
	ld a, $21
	ld hl, wc88c
	call MobileSDK_CopyStringLen
	xor a
	ld [de], a
	ret

Function1135ad:
	ld b, $1e
	call Function113592
	ld a, $1f
	ld hl, wc8ac
	jp MobileSDK_CopyStringLen

Function1135ba:
	ld b, $65
	call Function113592
	ld hl, wc8f6
	call Function1135eb
	ld a, $11
	ld hl, wc8fe
	call MobileSDK_CopyStringLen
	inc de
	ld hl, wc90e
	call Function1135eb
	ld a, $11
	ld hl, wc916
	call MobileSDK_CopyStringLen
	inc de
	ld hl, wc926
	call Function1135eb
	ld a, $11
	ld hl, wc92e
	jp MobileSDK_CopyStringLen

Function1135eb:
	ld b, $8
.asm_1135ed
	ld a, [hl]
	swap a
	and $f
	cp $f
	jr z, .asm_11361c
	or $30
	cp $3a
	call z, Function113620
	cp $3b
	call z, Function113623
	ld [de], a
	inc de
	ld a, [hli]
	and $f
	cp $f
	jr z, .asm_11361c
	or $30
	cp $3a
	call z, Function113620
	cp $3b
	call z, Function113623
	ld [de], a
	inc de
	dec b
	jr nz, .asm_1135ed

.asm_11361c
	xor a
	ld [de], a
	inc de
	ret

Function113620:
	ld a, $23
	ret

Function113623:
	ld a, $2a
	ret

Function113626:
	dec a
	jr z, .asm_113634
	dec a
	jr z, .asm_113639
	dec a
	jr z, .asm_11366c
	dec a
	jr z, .asm_11366f
	dec [hl]
	ret

.asm_113634
	ld b, $9a
	jp Function11234b

.asm_113639
	ld a, [wc882]
	or a
	jr nz, .asm_113642
	inc [hl]
	jr .asm_11366c

.asm_113642
	ld de, wMobileSDK_PacketBuffer + 5
	ld c, a
	inc a
	ld [de], a
	inc de
	ld a, $80
	ld [de], a
	inc de
	ld hl, wc880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, c
	call MobileSDK_CopyBytes
	ld b, c
	inc b
	call Function111f63
	ld a, [wMobileSDK_PacketBuffer + 5]
	add $a
	ld e, a
	ld d, 0
	ld a, $9a
	ld hl, wMobileSDK_PacketBuffer
	jp Function111f02

.asm_11366c
	jp Mobile_EndSession

.asm_11366f
	jp Function1116a0

Function113672:
	dec a
	jr z, .asm_113680
	dec a
	jr z, .asm_113686
	dec a
	jr z, .asm_1136bb
	dec a
	jr z, .asm_1136be
	dec [hl]
	ret

.asm_113680
	ld hl, wMobileSDK_PacketBuffer
	jp Function11236b

.asm_113686
	ld a, [wc882]
	or a
	jr z, .asm_113693
	cp $81
	jr nc, .asm_113693
	inc [hl]
	jr .asm_1136bb

.asm_113693
	ld hl, wMobileSDK_PacketBuffer + 7
	sub $80
	ld [hld], a
	ld a, $80
	ld [hl], a
	ld de, wMobileSDK_PacketBuffer + 8
	ld b, $2
	call Function111f63
	ld hl, wc880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0080
	add hl, de
	ld e, h
	ld a, l
	ld hl, wc829
	ld [hli], a
	ld [hl], e
	ld hl, wMobileSDK_PacketBuffer
	jp Function11236b

.asm_1136bb
	jp Mobile_EndSession

.asm_1136be
	jp Function1116a0

Function1136c1:
	xor a
	ld [wMobileSDK_PacketBuffer + 225], a
	ld a, l
	ld [wMobileSDK_PacketBuffer + 192], a
	ld a, h
	ld [wMobileSDK_PacketBuffer + 193], a
	ld hl, wMobileSDK_PacketBuffer + 194
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld hl, wMobileSDK_PacketBuffer + 192
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 32
	ld b, $30
	ld c, b
	call MobileSDK_CopyBytes
	ld hl, wc97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_1136eb
	ld a, [hli]
	or a
	jr nz, .asm_1136eb
	call MobileSDK_CopyString
	ld a, $37
	cp c
	inc a
	jr nc, .asm_1136ff
	ld a, $2
	ld [wMobileSDK_PacketBuffer + 225], a
	ld a, $78

.asm_1136ff
	sub c
	ld b, a
	ld a, $80
	ld [de], a
	inc de
	xor a
.asm_113706
	dec b
	jr z, .asm_11370d
	ld [de], a
	inc de
	jr .asm_113706

.asm_11370d
	or a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld l, e
	ld h, d
	ld b, $6
	xor a
.asm_113725
	ld [hli], a
	dec b
	jr nz, .asm_113725
	ld de, wMobileSDK_PacketBuffer + 160
	ld hl, Unknown_113b7e
	ld b, $10
	call MobileSDK_CopyBytes

.asm_113734
	ld hl, wMobileSDK_PacketBuffer + 197
	ld a, LOW(MD5_K_Table)
	ld [hli], a
	ld a, HIGH(MD5_K_Table)
	ld [hl], a
	ld hl, wMobileSDK_PacketBuffer + 199
	ld a, LOW(Unknown_113a70)
	ld [hli], a
	ld a, HIGH(Unknown_113a70)
	ld [hl], a
	ld hl, wMobileSDK_PacketBuffer + 160
	ld de, wMobileSDK_PacketBuffer + 209
	ld b, $10
	call MobileSDK_CopyBytes

.asm_113751
	ld hl, wMobileSDK_PacketBuffer + 199
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
	push hl
	call Function113909
	ld hl, wMobileSDK_PacketBuffer + 176
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a32
	pop hl
	ld a, [hli]
	ld d, [hl]
	inc hl
	ld e, a
	push hl
	ld a, [wMobileSDK_PacketBuffer + 225]
	bit 0, a
	jr z, .asm_11377c
	ld hl, $0040
	add hl, de
	ld e, l
	ld d, h

.asm_11377c
	ld hl, wMobileSDK_PacketBuffer + 32
	add hl, de
	ld e, l
	ld d, h
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a32
	ld hl, wMobileSDK_PacketBuffer + 197
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a32
	pop hl
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wMobileSDK_PacketBuffer + 199], a
	ld a, h
	ld [wMobileSDK_PacketBuffer + 200], a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a40
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a32
	ld hl, wMobileSDK_PacketBuffer + 176
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 197
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	inc hl
endr
	ld a, h
	ld [wMobileSDK_PacketBuffer + 198], a
	ld a, l
	ld [wMobileSDK_PacketBuffer + 197], a
	cp $8e ; LOW(MD5_K_Table + $100) ???
	jp nz, .asm_113751
	ld de, wMobileSDK_PacketBuffer + 209
	ld hl, wMobileSDK_PacketBuffer + 160
	call Function113a32
	ld de, wMobileSDK_PacketBuffer + 213
	call Function113a32
	ld de, wMobileSDK_PacketBuffer + 217
	call Function113a32
	ld de, wMobileSDK_PacketBuffer + 221
	call Function113a32
	ld hl, wMobileSDK_PacketBuffer + 225
	bit 1, [hl]
	jr z, .asm_1137fc
	dec [hl]
	jp .asm_113734

.asm_1137fc
	ld hl, wMobileSDK_PacketBuffer + 32
	ld de, wMobileSDK_PacketBuffer + 80
	ld bc, $0030
	call Function113d66
	ld hl, wMobileSDK_PacketBuffer + 194
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, Unknown_113a55
	call MobileSDK_CopyString
	ld hl, wMobileSDK_PacketBuffer + 80
	ld bc, $0020
	call Function113c8e
	ld a, l
	ld [wMobileSDK_PacketBuffer + 194], a
	ld a, h
	ld [wMobileSDK_PacketBuffer + 195], a
	ld b, $12
	ld hl, wMobileSDK_PacketBuffer + 80
	ld de, wMobileSDK_PacketBuffer + 32
.asm_11382d
	ld a, $40
	and [hl]
	rlca
	ld c, a
	ld a, [hli]
	bit 4, a
	jr z, .asm_113839
	set 6, c

.asm_113839
	bit 2, a
	jr z, .asm_11383f
	set 5, c

.asm_11383f
	bit 0, a
	jr z, .asm_113845
	set 4, c

.asm_113845
	ld a, [hli]
	bit 6, a
	jr z, .asm_11384c
	set 3, c

.asm_11384c
	bit 4, a
	jr z, .asm_113852
	set 2, c

.asm_113852
	bit 2, a
	jr z, .asm_113858
	set 1, c

.asm_113858
	bit 0, a
	jr z, .asm_11385e
	set 0, c

.asm_11385e
	ld a, c
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11382d
	ld b, $12
	ld hl, wMobileSDK_PacketBuffer + 115
	ld de, wMobileSDK_PacketBuffer + 67
.asm_11386c
	ld a, $2
	and [hl]
	rrca
	ld c, a
	ld a, [hld]
	bit 3, a
	jr z, .asm_113878
	set 1, c

.asm_113878
	bit 5, a
	jr z, .asm_11387e
	set 2, c

.asm_11387e
	bit 7, a
	jr z, .asm_113884
	set 3, c

.asm_113884
	ld a, [hld]
	bit 1, a
	jr z, .asm_11388b
	set 4, c

.asm_11388b
	bit 3, a
	jr z, .asm_113891
	set 5, c

.asm_113891
	bit 5, a
	jr z, .asm_113897
	set 6, c

.asm_113897
	bit 7, a
	jr z, .asm_11389d
	set 7, c

.asm_11389d
	ld a, c
	ld [de], a
	dec de
	dec b
	jr nz, .asm_11386c
	ld b, $10
	ld de, wMobileSDK_PacketBuffer + 80
	ld hl, wMobileSDK_PacketBuffer + 160
	call MobileSDK_CopyBytes
	ld bc, $0010
	ld hl, wc97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call MobileSDK_CopyString
	ld a, $24
	sub c
	ld b, a
	ld l, e
	ld h, d
	ld a, $ff
.asm_1138c2
	ld [hli], a
	dec b
	jr nz, .asm_1138c2
	xor a
	ld [hl], a
	ld b, $24
	ld hl, wMobileSDK_PacketBuffer + 32
	ld de, wMobileSDK_PacketBuffer + 80
.asm_1138d0
	ld a, [de]
	inc de
	xor [hl]
	ld c, $0
	bit 0, a
	jr z, .asm_1138db
	set 3, c

.asm_1138db
	bit 3, a
	jr z, .asm_1138e1
	set 6, c

.asm_1138e1
	bit 6, a
	jr z, .asm_1138e7
	set 0, c

.asm_1138e7
	and $b6
	or c
	ld [hli], a
	dec b
	jr nz, .asm_1138d0
	ld hl, wMobileSDK_PacketBuffer + 194
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 32
	ld bc, $0024
	call Function113c8e
	ld a, $22
	ld [hli], a
	ld a, $d
	ld [hli], a
	ld a, $a
	ld [hli], a
	xor a
	ld [hl], a
	ret

Function113909:
	call Function11391e
	ld a, c
	and $f0
	swap a
	or a
	jr z, Function11392f
	dec a
	jr z, Function113973
	dec a
	jp z, Function1139b7
	jp Function1139de

Function11391e:
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_113b70
	add hl, de
	ld de, wMobileSDK_PacketBuffer + 176
	ld b, $8
	jp MobileSDK_CopyBytes

Function11392f:
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 184
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 180
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a0b
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 188
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 188
	call Function113a1f
	ld hl, wMobileSDK_PacketBuffer + 182
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 188
	call Function113a0b
	ld hl, wMobileSDK_PacketBuffer + 184
	ld de, wMobileSDK_PacketBuffer + 188
	call Function113a15
	ret

Function113973:
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 184
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 182
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a0b
	ld hl, wMobileSDK_PacketBuffer + 182
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 188
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 188
	call Function113a1f
	ld hl, wMobileSDK_PacketBuffer + 180
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 188
	call Function113a0b
	ld hl, wMobileSDK_PacketBuffer + 184
	ld de, wMobileSDK_PacketBuffer + 188
	call Function113a15
	ret

Function1139b7:
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 184
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 180
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a28
	ld hl, wMobileSDK_PacketBuffer + 182
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a28
	ret

Function1139de:
	ld hl, wMobileSDK_PacketBuffer + 182
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMobileSDK_PacketBuffer + 184
	ld b, $4
	call MobileSDK_CopyBytes
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a1f
	ld hl, wMobileSDK_PacketBuffer + 178
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a15
	ld hl, wMobileSDK_PacketBuffer + 180
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wMobileSDK_PacketBuffer + 184
	call Function113a28
	ret

Function113a0b:
	ld b, $4
.asm_113a0d
	ld a, [de]
	inc de
	and [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a0d
	ret

Function113a15:
	ld b, $4
.asm_113a17
	ld a, [de]
	inc de
	or [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a17
	ret

Function113a1f:
	ld b, $4
.asm_113a21
	ld a, [hl]
	cpl
	ld [hli], a
	dec b
	jr nz, .asm_113a21
	ret

Function113a28:
	ld b, $4
.asm_113a2a
	ld a, [de]
	inc de
	xor [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a2a
	ret

Function113a32:
	ld a, [de]
	inc de
	add [hl]
	ld [hli], a
	ld b, $3
.asm_113a38
	ld a, [de]
	inc de
	adc [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a38
	ret

Function113a40:
.asm_113a40
	or a
	push hl
	ld a, [hli]
	rla
	ld a, [hl]
	rla
	ld [hli], a
	ld a, [hl]
	rla
	ld [hli], a
	ld a, [hl]
	rla
	ld [hl], a
	pop hl
	ld a, [hl]
	rla
	ld [hl], a
	dec b
	jr nz, .asm_113a40
	ret

Unknown_113a55:
	db "Authorization: GB00 name=", $22, 0

Unknown_113a70:
	db $00, $00, $00, $07, $06, $04, $00, $0c, $04, $08, $00, $11, $02, $0c, $00, $16
	db $00, $10, $00, $07, $06, $14, $00, $0c, $04, $18, $00, $11, $02, $1c, $00, $16
	db $00, $20, $00, $07, $06, $24, $00, $0c, $04, $28, $00, $11, $02, $2c, $00, $16
	db $00, $30, $00, $07, $06, $34, $00, $0c, $04, $38, $00, $11, $02, $3c, $00, $16
	db $10, $04, $00, $05, $16, $18, $00, $09, $14, $2c, $00, $0e, $12, $00, $00, $14
	db $10, $14, $00, $05, $16, $28, $00, $09, $14, $3c, $00, $0e, $12, $10, $00, $14
	db $10, $24, $00, $05, $16, $38, $00, $09, $14, $0c, $00, $0e, $12, $20, $00, $14
	db $10, $34, $00, $05, $16, $08, $00, $09, $14, $1c, $00, $0e, $12, $30, $00, $14
	db $20, $14, $00, $04, $26, $20, $00, $0b, $24, $2c, $00, $10, $22, $38, $00, $17
	db $20, $04, $00, $04, $26, $10, $00, $0b, $24, $1c, $00, $10, $22, $28, $00, $17
	db $20, $34, $00, $04, $26, $00, $00, $0b, $24, $0c, $00, $10, $22, $18, $00, $17
	db $20, $24, $00, $04, $26, $30, $00, $0b, $24, $3c, $00, $10, $22, $08, $00, $17
	db $30, $00, $00, $06, $36, $1c, $00, $0a, $34, $38, $00, $0f, $32, $14, $00, $15
	db $30, $30, $00, $06, $36, $0c, $00, $0a, $34, $28, $00, $0f, $32, $04, $00, $15
	db $30, $20, $00, $06, $36, $3c, $00, $0a, $34, $18, $00, $0f, $32, $34, $00, $15
	db $30, $10, $00, $06, $36, $2c, $00, $0a, $34, $08, $00, $0f, $32, $24, $00, $15

Unknown_113b70:
	dw wMobileSDK_PacketBuffer + 160
	dw wMobileSDK_PacketBuffer + 164
	dw wMobileSDK_PacketBuffer + 168
	dw wMobileSDK_PacketBuffer + 172
	dw wMobileSDK_PacketBuffer + 160
	dw wMobileSDK_PacketBuffer + 164
	dw wMobileSDK_PacketBuffer + 168

Unknown_113b7e:
	db $01, $23, $45, $67, $89, $ab, $cd, $ef
	db $fe, $dc, $ba, $98, $76, $54, $32, $10

MD5_K_Table:
	dl $d76aa478, $e8c7b756, $242070db, $c1bdceee
	dl $f57c0faf, $4787c62a, $a8304613, $fd469501
	dl $698098d8, $8b44f7af, $ffff5bb1, $895cd7be
	dl $6b901122, $fd987193, $a679438e, $49b40821
	dl $f61e2562, $c040b340, $265e5a51, $e9b6c7aa
	dl $d62f105d, $02441453, $d8a1e681, $e7d3fbc8
	dl $21e1cde6, $c33707d6, $f4d50d87, $455a14ed
	dl $a9e3e905, $fcefa3f8, $676f02d9, $8d2a4c8a
	dl $fffa3942, $8771f681, $6d9d6122, $fde5380c
	dl $a4beea44, $4bdecfa9, $f6bb4b60, $bebfbc70
	dl $289b7ec6, $eaa127fa, $d4ef3085, $04881d05
	dl $d9d4d039, $e6db99e5, $1fa27cf8, $c4ac5665
	dl $f4292244, $432aff97, $ab9423a7, $fc93a039
	dl $655b59c3, $8f0ccc92, $ffeff47d, $85845dd1
	dl $6fa87e4f, $fe2ce6e0, $a3014314, $4e0811a1
	dl $f7537e82, $bd3af235, $2ad7d2bb, $eb86d391

Function113c8e:
	ld a, c
	ld [wMobileSDK_PacketBuffer + 201], a
	ld a, b
	ld [wMobileSDK_PacketBuffer + 202], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	xor a
	ld [wMobileSDK_PacketBuffer + 207], a

.asm_113ca0
	ld b, $3
	push hl
	ld hl, wMobileSDK_PacketBuffer + 203
.asm_113ca6
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_113ca6
	ld a, [wMobileSDK_PacketBuffer + 201]
	ld c, a
	ld a, [wMobileSDK_PacketBuffer + 202]
	ld b, a
	xor a
	or b
	jr nz, .asm_113ccf
	ld a, $2
	cp c
	jr c, .asm_113ccf
	push hl
	dec hl
	ld a, c
	ld [wMobileSDK_PacketBuffer + 207], a
.asm_113cc3
	xor a
	ld [hld], a
	inc c
	ld a, $3
	cp c
	jr nz, .asm_113cc3
	pop hl
	ld bc, $0003

.asm_113ccf
	dec bc
	dec bc
	dec bc
	ld a, c
	ld [wMobileSDK_PacketBuffer + 201], a
	ld a, b
	ld [wMobileSDK_PacketBuffer + 202], a
	push de
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	ld d, a
	srl a
	srl a
	ld [hli], a
	ld a, $3
	and d
	ld d, a
	ld a, $f0
	and b
	or d
	swap a
	ld [hli], a
	ld a, $f
	and b
	ld d, a
	ld a, c
	and $c0
	or d
	rlca
	rlca
	ld [hli], a
	ld a, $3f
	and c
	ld [hld], a
	dec hl
	dec hl
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [wMobileSDK_PacketBuffer + 201]
	cp $0
	jp nz, .asm_113ca0
	ld a, [wMobileSDK_PacketBuffer + 202]
	cp $0
	jp nz, .asm_113ca0
	ld a, [wMobileSDK_PacketBuffer + 207]
	cp $0
	jr z, .asm_113d43
	push hl
	dec hl
	ld b, a
.asm_113d39
	ld a, $3d
	ld [hld], a
	inc b
	ld a, $3
	cp b
	jr nz, .asm_113d39
	pop hl

.asm_113d43
	ld a, $0
	ld [hl], a
	ret

Function113d47:
	cp $1a
	jr c, .asm_113d5a
	cp $34
	jr c, .asm_113d5d
	cp $3e
	jr c, .asm_113d60
	cp $3e
	jr z, .asm_113d63
	ld a, $2f
	ret

.asm_113d5a
	add $41
	ret

.asm_113d5d
	add $47
	ret

.asm_113d60
	sub $4
	ret

.asm_113d63
	ld a, $2b
	ret

Function113d66:
	ld a, c
	ld [wMobileSDK_PacketBuffer + 201], a
	ld a, b
	ld [wMobileSDK_PacketBuffer + 202], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b
.asm_113d74
	ld a, [wMobileSDK_PacketBuffer + 202]
	or a
	jr nz, .asm_113d82
	ld a, [wMobileSDK_PacketBuffer + 201]
	cp $4
	jp c, .asm_113e26

.asm_113d82
	ld b, $4
	push hl
	ld hl, wMobileSDK_PacketBuffer + 203
.asm_113d88
	ld a, [de]
	inc de
	call .decodeBase64Character
	ld [hli], a
	dec b
	jr nz, .asm_113d88
	ld a, [wMobileSDK_PacketBuffer + 201]
	ld c, a
	ld a, [wMobileSDK_PacketBuffer + 202]
	ld b, a
rept 4
	dec bc
endr
	ld a, b
	or c
	jr z, .asm_113dae
.asm_113da1
	ld a, [de]
	cp $d
	jr z, .asm_113daa
	cp $a
	jr nz, .asm_113dae

.asm_113daa
	inc de
	dec bc
	jr .asm_113da1

.asm_113dae
	ld a, c
	ld [wMobileSDK_PacketBuffer + 201], a
	ld a, b
	ld [wMobileSDK_PacketBuffer + 202], a
	push de
	dec hl
	ld d, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	sla b
	sla b
	sla b
	rla
	sla b
	rla
	ld [hli], a
	ld [hl], b
	inc hl
	rrc c
	rrc c
	ld [hl], c
	dec hl
	ld a, $f
	and c
	or [hl]
	ld [hli], a
	ld a, [hli]
	and $c0
	or [hl]
	dec hl
	ld [hld], a
	dec hl
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ld a, [wMobileSDK_PacketBuffer + 201]
	or a
	jr nz, .asm_113d74
	ld a, [wMobileSDK_PacketBuffer + 202]
	or a
	jp nz, .asm_113d74
	xor a
	ld [hl], a
	ret

.decodeBase64Character:
	cp "+"
	jr c, .asm_113e24
	jr z, .asm_113e31
	cp "/"
	jr c, .asm_113e24
	jr z, .asm_113e34
	cp "0"
	jr c, .asm_113e24
	cp "9" + 1
	jr c, .asm_113e37
	cp "="
	jr c, .asm_113e24
	jr z, .asm_113e3a
	cp "A"
	jr c, .asm_113e24
	cp "Z" + 1
	jr c, .asm_113e3c
	cp "a"
	jr c, .asm_113e24
	cp "z" + 1
	jr c, .asm_113e3f

.asm_113e24
	pop hl
	pop hl
.asm_113e26
	ld hl, wc821
	set 1, [hl]
	ld a, $20
	ld [wc80f], a
	ret

.asm_113e31
	ld a, $3e
	ret

.asm_113e34
	ld a, $3f
	ret

.asm_113e37
	add $4
	ret

.asm_113e3a
	xor a
	ret

.asm_113e3c
	sub $41
	ret

.asm_113e3f
	sub $47
	ret

Function113e42:
	dec a
	jr z, .asm_113e4f
	dec a
	jr z, .asm_113e85
	dec a
	jr z, .asm_113ea8
	dec a
	jr z, .asm_113eb0
	ret

.asm_113e4f
	ld a, [wc807]
	cp $8
	jr nz, .asm_113e58
.asm_113e56
	dec [hl]
	ret

.asm_113e58
	xor a
	ld [wc86d], a
	ld a, $2
	ld [wc86a], a
	ld hl, wc821
	ld a, [hl]
	and $10
	set 5, a
	ld [hl], a
	jp Function113eb8

.asm_113e6d
	ld a, [wc86d]
	or a
	ld a, [wMobileSDK_ReceivePacketBuffer]
	jr z, .asm_113e81
	cp $9f
	jr z, .asm_113e85
	cp $a4
	jr z, .asm_113e85
.asm_113e7e
	jp Function112430

.asm_113e81
	cp $a3
	jr z, .asm_113e7e

.asm_113e85
	xor a
	ld [wc86d], a
	ld [wMobileSDK_SendCommandID], a
	ld a, $2
	ld [wc86a], a
	ld a, $3
	ld [wc807], a
	ld hl, wc821
	ld a, [hl]
	and $10
	set 5, a
	ld [hl], a
	ld hl, wc822
	bit 0, [hl]
	call z, Function111f97
	ret

.asm_113ea8
	ld a, [wc807]
	cp $8
	jr z, .asm_113e56
	ret

.asm_113eb0
	ld a, $1
	ld [wc86b], a
	jp .asm_113e6d

Function113eb8:
	ld a, $ff
	ld [wMobileSDK_SendCommandID], a
	ld hl, wc822
	res 5, [hl]
	res 0, [hl]
	jp Function111f97

Function113ec7: ; unreferenced
	ld hl, wc822
	ld a, [hl]
	push af
	res 3, [hl]
	res 0, [hl]
	ld hl, wc81a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hld]
	dec hl
	xor $80
	ld [wMobileSDK_SendCommandID], a
	ld b, $5
	call PacketSendBytes
	pop af
	bit 0, a
	ret z
	ld hl, wc822
	set 0, [hl]
	ret

Function113ef2:
	dec a
	jr z, .asm_113efa
	dec a
	jr z, .asm_113f03
	dec [hl]
	ret

.asm_113efa
	ld a, [wc807]
	cp $8
	jr nz, Function113eb8
	dec [hl]
	ret

.asm_113f03
	ld a, $26
	call Function11225d
	ld a, $2a
	ld [wc86a], a
	ld hl, wc820
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc815
	ld e, a
	ld [hli], a
	ld a, d
	ld [hl], a
	xor a
	ld [wc800], a
	ld hl, wMobileSDK_PacketBuffer
	ld a, $2
	ld [hli], a
	dec a
	ld [hl], a
	ret

Function113f2d:
	dec a
	jr z, .asm_113f35
	dec a
	jr z, .asm_113f4f
	dec [hl]
	ret

.asm_113f35
	ld a, [wc807]
	cp $8
	jr nz, .asm_113f3e
	dec [hl]
	ret

.asm_113f3e
	xor a
	ld [wMobileSDK_ReceivePacketBuffer], a
	ld [wMobileSDK_ReceivePacketBufferAlt], a
	ld a, [wMobileSDK_SendCommandID]
	cp $91
	jr z, .asm_113f4f
	jp Function113eb8

.asm_113f4f
	xor a
	ld [wc86d], a
	ld hl, wc821
	set 0, [hl]
	ld hl, wc822
	xor a
	ld [hl], a
	xor a
	ld [wc80b], a
	xor a
	ld [wMobileSDK_PacketBuffer], a
	ld hl, wc820
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc815
	ld e, a
	ld [hli], a
	ld a, d
	ld [hl], a
	xor a
	ld [wc800], a
	ld hl, wMobileSDK_PacketBuffer
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	ret
