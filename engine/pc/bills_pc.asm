CheckCurPartyMonFainted:
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
	ld b, $0
.loop
	ld a, [wCurPartyMon]
	cp b
	jr z, .skip
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	dec hl

.skip
	inc b
	ld a, [wPartyCount]
	cp b
	jr z, .done
	add hl, de
	jr .loop

.done
	scf
	ret

.notfainted
	and a
	ret

SwapStorageBoxSlots:
; Swaps slots from de to bc. Preserves de, while bc is changed to a proper slot
; if c is 0, otherwise preserved. Equivalent to bc->de except c may be 0 to mean
; "put anywhere in the party/box". Returns the following in a:
; 0: Successful swap
; 1: Save is required to perform the swap
; 2: The party is full
; 3: The box is full
; 4: Doing this would remove the last healthy mon in party
; 5: Can't move partymon to Box, because they're holding Mail.
	; Compare source->dest to see if we're "moving" something with itself.
	ld h, -1
	ld a, b
	cp d
	ld a, c
	jr nz, .not_equal
	ld h, e
	cp e
	jr nz, .not_equal
.done
	xor a
	ret
.not_equal
	; Convert destination slot 0 to a real destination, if we can.
	push de
	and a ; a is c from beforehand.
	jr nz, .got_dest

	ld e, PARTY_LENGTH
	ld a, b
	and a
	jr z, .dest_loop
	ld e, MONS_PER_BOX
.dest_loop
	inc c
	call GetStorageBoxMon
	jr z, .got_dest
	ld a, c
	cp h
	jr nz, .dest_next

	; We encountered our current entry while seeking for blank entries. This
	; basically makes this a no-op (since there's no earlier blank entry), so
	; return early.
	pop de
	jr .done

.dest_next
	cp e
	jr nz, .dest_loop

	; Party (or Box) is full
	pop de
	cp MONS_PER_BOX
	ld a, 2
	ret c
	inc a
	ret

.got_dest
	pop de

	; Now that we have proper slots, preserve bcde from this point.
	push de
	push bc
	call .do_it
	pop bc
	pop de
	ret

.do_it
	; If d<b, swap bc and de. The reason for this is that we want to handle
	; party->box movement the same way as box->party.
	ld a, d
	cp b
	jr nc, .dont_swap
	push bc
	ld b, d
	ld c, e
	pop de
.dont_swap
	; At this point, b<=d. So if d is party, we're swapping party members, and
	; if b is nonparty (i.e. >0), we're swapping between box slots.
	; Otherwise, we're swapping a party slot bc to box slot de.
	ld a, d
	and a
	jr z, .party_swap
	ld a, b
	and a
	jr nz, .box_swap

	; We're swapping a party and box slot. First, verify that we're not losing
	; our last healthy mon and that the partymon isn't holding Mail.
	push de
	push bc
	ld a, c

	; This is required for CheckCurPartyMonFainted
	dec a
	ld [wCurPartyMon], a

	; Is the party slot occupied? Also writes the partymon to wBufferMon.
	call GetStorageBoxMon
	jr z, .not_last_healthy

	; Check if the partymon is holding Mail. We can't store Mail in a Box.
	ld a, [wBufferMonItem]
	call ItemIsMail_a
	ld a, 5
	jr c, .pop_bcde_and_return

	; Otherwise, check if it is our last healthy mon.
	newfarcall CheckCurPartyMonFainted
	jr nc, .not_last_healthy

	; Doing this would lose us our last healthy mon, so abort.
	ld a, 4
.pop_bcde_and_return
	pop bc
	pop de
	ret

.not_last_healthy
	pop bc

	; Try to allocate a new pokedb pointer, unless the party slot was empty.
	ld de, 0 ; in case we're blanking the box slot
	ld a, [wBufferMonSlot]
	and a
	call nz, NewStoragePointer
	jr nc, .found_new_pokedb

	; The pokedb is full, we need to save first.
	pop de
	ld a, 1
	ret

.found_new_pokedb
	call AddStorageMon

	; Get the current pokedb pointer in the box slot for writing to party.
	pop hl ; Box slot
	push bc ; Party slot
	ld b, h
	ld c, l
	push de ; New pokedb pointer
	call GetStorageBoxPointer
	ld h, d
	ld l, e
	pop de
	push hl ; Previous pokedb pointer
	call SetStorageBoxPointer

	; Now, write previous pointer to party, then we're done.
	pop de
	pop bc
	call SetStorageBoxPointer
	xor a
	ret

.party_swap
	; Check if we're placing a mon in a blank party slot. This means we're
	; shifting every other party member upwards, placing the held mon last.
	ld a, [wPartyCount]
	cp c
	jr c, .shift
	call SwapPartyMons
	xor a
	ret

.shift
	; Shift the held mon until it's last in the party.
	ld c, e
	call ShiftPartySlotToEnd
	xor a
	ret

.box_swap
	; Swaps 2 box pointers between box slot A in bc and slot B in de

	push de ; Slot B
	call GetStorageBoxPointer ; de = A's pointer
	pop hl ; hl = Slot B

	push bc ; Slot A
	ld b, h
	ld c, l ; bc = Slot B
	push de ; A's pointer
	call GetStorageBoxPointer ; de = B's pointer
	ld h, d
	ld l, e ; hl = B's pointer
	pop de ; de = A's pointer
	push hl
	call SetStorageBoxPointer ; Set Slot B (bc) to have A's pointer (de)
	pop de ; de = B's pointer
	pop bc ; bc = Slot A
	call SetStorageBoxPointer ; Set Slot A (bc) to have B's pointer (de)

	; We're done
	xor a
	ret

SwapPartyMonMail:
	push hl
	push de
	push bc
	dec c
	dec e
	ld d, c
	jr DoMailSwap

SwapPartyMons:
; Swap 1-indexed partymon c and e. Preserves bc, de, hl.
; TODO: this is more efficient than SwitchPartyMons, maybe make it use this.
	push hl
	push de
	push bc
	dec c
	dec e
	ld d, c

	; Swap partymon struct
	ld hl, wPartyMon1
	ld c, PARTYMON_STRUCT_LENGTH
	call DoPartySwap

	; Swap nickname
	ld hl, wPartyMonNicknames
	ld c, MON_NAME_LENGTH
	call DoPartySwap

	; Swap OT name
	ld hl, wPartyMonOTs
	ld c, NAME_LENGTH
	call DoPartySwap

	; Swap alt species
	ld hl, wPartySpecies
	ld c, 1
	call DoPartySwap

	; fallthrough
DoMailSwap:
	; Swap Mail
	ld a, BANK(sPartyMon1Mail)
	call OpenSRAM
	ld hl, sPartyMon1Mail
	ld bc, MAIL_STRUCT_LENGTH
	call DoPartySwap
	call CloseSRAM
	jp PopBCDEHL

DoPartySwap:
; Swaps bc bytes between hl+d*bc and hl+e*bc
	; Get pointers to swap
	push de
	push hl
	ld a, d
	call AddNTimes
	ld a, e
	ld d, h
	ld e, l
	pop hl
	call AddNTimes

	; Now hl and de points to which bytes to swap
	push de
	ld de, wSwitchMonBuffer
	push bc
	push hl
	call CopyBytes
	pop de
	pop bc
	pop hl
	push hl
	push bc
	call CopyBytes
	pop bc
	pop de
	ld hl, wSwitchMonBuffer
	call CopyBytes
	pop de
	ret

NewStorageBoxPointer:
; Sets bcde to an unused box storage location. Preserves wBufferMon. Returns:
; nc|z: Active box has free space
; nc|nz: Active box full, space found elsewhere
; c|z: Storage System filled completely.
; c|nz: Storage System has space, but the database is full. Save to free space.
	; Figure out if we have space in the storage system. Check active box first,
	; then other boxes in sequence until we loop back to the active box. We loop
	; upwards, despite downwards generally being more efficient for UI benefit,
	; since we want to place mons starting at the beginning of a box, rather
	; than the end).
	ld a, [wCurBox]
	inc a
	ld b, a
	ld d, NUM_BOXES
.outer_loop
	ld c, 1
.inner_loop
	push de
	call GetStorageBoxPointer
	ld a, e
	pop de
	and a
	jr z, .found_free_space
	ld a, c
	inc c
	cp MONS_PER_BOX
	jr nz, .inner_loop
	ld a, b
	inc b
	cp NUM_BOXES
	jr nz, .dont_wrap_box
	ld b, 1
.dont_wrap_box
	dec d
	jr nz, .outer_loop

	; Storage system completely filled.
	scf
	ret

.found_free_space
	; Check if there's a free database entry.
	call NewStoragePointer
	jr nc, .storage_ok

	; If we still have no space left, we need to save.
	or 1
	scf
	ret

.storage_ok
	; Returns z if the new storage was found in our active box, nz otherwise.
	; Always return nc.
	ld a, [wCurBox]
	inc a
	cp b
	ret z
	or 1
	ret

NewStoragePointer:
; Sets de to an unused pokedb entry. Returns c if none was found.
; Preserves wBufferMon.
	; Try twice, flushing the database if the first one failed.
	call .GetStorage
	ret nc
	call FlushStorageSystem
	; fallthrough
.GetStorage:
	ld d, 1
.outer_loop
	ld e, 1
.inner_loop
	call IsStorageUsed
	jr z, .found_free_space
	inc e
	ld a, e
	cp MONDB_ENTRIES + 1
	jr nz, .inner_loop
	inc d
	ld a, d
	cp 3
	ccf
	jr nc, .outer_loop
	ret
.found_free_space
	xor a
	ret

FlushStorageSystem:
; Frees up orphaned pokedb entries and reallocates used entries. Beware of soft-
; resets and make sure this process completes before loading up a game.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeDB1UsedEntries)
	ldh [rSVBK], a
	call .Function
	pop af
	ldh [rSVBK], a
	ret

.Function:
	push hl
	push de
	push bc

	; Clear used pokedb entries.
	xor a
	ld hl, wPokeDBUsedEntries
	ld bc, wPokeDBUsedEntriesEnd - wPokeDBUsedEntries
	call ByteFill

	; Now, set flags as per box usage.
	ld b, 1
.outer_loop
	ld c, 1
.inner_loop
	call GetStorageBoxPointer
	call _AllocateStorageFlag
	ld a, c
	inc c
	cp MONS_PER_BOX
	jr nz, .inner_loop
	ld a, b
	inc b
	cp NUM_BOXES * 2 ; current + backup
	jr nz, .outer_loop
	jp PopBCDEHL

GetStorageBoxPointer:
; Returns the pokedb bank+entry in de for box b, slot c.
	; Ensure that we're dealing with an actual box and not a partymon.
	ld a, b
	and a
.crash
	jr z, .crash

	ld a, BANK(sNewBox1)
	call OpenSRAM

	push hl
	push bc
	ld a, b
	ld hl, sNewBox1Entries - (sNewBox2 - sNewBox1)
	ld bc, sNewBox2 - sNewBox1
	call AddNTimes
	pop bc
	push bc
	dec c
	ld b, 0
	push hl
	add hl, bc
	ld e, [hl]
	pop hl
	ld c, sNewBox1Banks - sNewBox1Entries
	add hl, bc
	pop bc
	push bc
	dec c
	ld d, 1 ; will cause a useless bankswitch in flag checking, but that's OK
	ld b, CHECK_FLAG
	predef SmallFarFlagAction
	pop bc
	jr z, .got_bank
	inc d
.got_bank
	pop hl
	jp CloseSRAM

UpdateStorageBoxMonFromTemp:
; Updates storage pointed to by wBufferMonBox+wBufferMonSlot with content in
; wBufferMon. If this is part of a Box, this allocates a new entry.
; Returns z if successful.
	; Just run a simple copy if we're updating the party.
	ld a, [wBufferMonSlot]
	ld c, a
	ld a, [wBufferMonBox]
	ld b, a
	and a
	jp z, CopyBetweenPartyAndTemp

	; Otherwise, we need to allocate a new box entry.
	; Erase the current entry before trying to find a new one.
	; This code exists to gurantee that should the storage commit work once,
	; it will always continue to work for the same tempmon session without an
	; enforced save inbetween. Without it, the code could use up the last entry
	; the first write, then fail to reuse the same entry later.
	call GetStorageBoxPointer
	push de
	ld e, 0
	call SetStorageBoxPointer
	push bc
	call NewStoragePointer
	pop bc
	jr nc, .found_entry
	pop de

	; We failed to find a new entry. Restore the current box pointer.
	call SetStorageBoxPointer
	or 1
	ret

.found_entry
	call AddStorageMon
	call SetStorageBoxPointer
	pop de
	xor a
	ret

RemoveStorageBoxMon:
; Erases box b slot c. Done by simply just setting it to a null entry.
	ld e, 0
	; fallthrough
SetStorageBoxPointer:
; Sets box b slot c to have storage pointer de. If bc is a party slot, will
; fill it with the pokedb entry in de, or empty the slot (potentially shifting
; later party members upwards) if de is a null slot.
	push hl
	push de
	push bc

	; Are we dealing with a party slot?
	ld a, b
	and a
	jr z, .party

	; We're dealing with a box, so set box pointer appropriately.
	ld a, BANK(sNewBox1)
	call OpenSRAM

	; Get the correct box.
	ld a, b
	ld hl, sNewBox1Entries - (sNewBox2 - sNewBox1)
	ld bc, sNewBox2 - sNewBox1
	call AddNTimes
	pop bc
	push bc

	; Get the corret slot and write the db entry to it.
	dec c
	ld b, 0
	push hl
	add hl, bc
	ld [hl], e
	pop hl

	; Write the db bank.
	ld a, c
	ld c, sNewBox1Banks - sNewBox1Entries
	add hl, bc
	ld c, a
	ld b, RESET_FLAG
	dec d
	jr z, .got_flag_action
	ld b, SET_FLAG
.got_flag_action
	predef SmallFarFlagAction
	jr .done

.party
	; Get the mon from the pokedb for party writing.
	call GetStorageMon
	jr nz, .not_empty

	; First, shift this partymon to the end, effectively shifting everything
	; past it upwards.
	call ShiftPartySlotToEnd

	; Then delete the partymon.
	ld hl, wPartyCount
	dec [hl]
	ld c, [hl]
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld [hl], -1
	jr .done

.not_empty
	; If this slot was previously empty, we'll append it to the party end.
	ld a, [wPartyCount]
	cp c
	jr nc, .partyslot_not_empty
	inc a
	ld c, a
	ld [wPartyCount], a

.partyslot_not_empty
	; b is 0 from earlier, from referencing the party.
	call CopyBetweenPartyAndTemp
.done
	call CloseSRAM
	jp PopBCDEHL

ShiftPartySlotToEnd:
; Shift party slot c until the end.
	ld a, [wPartyCount]
	cp c
	ret z
	ld e, c
	inc c
	call SwapPartyMons
	jr ShiftPartySlotToEnd

CopyBetweenPartyAndTemp:
; Copies between partymon c (1-indexed) and temp. Doesn't preserve registers.
; Note that this will not update the party count if adding a new mon.
; If bit 7 of b is set, copies between wOTPartyMons instead of wPartyMons.
; If bit 0 of b is set, copies from party to temp, otherwise the reverse.
	dec c
	ld hl, wPartyMon1
	ld de, wBufferMon
	ld a, PARTYMON_STRUCT_LENGTH
	call .Copy

	ld hl, wPartyMonNicknames
	ld de, wBufferMonNickname
	ld a, MON_NAME_LENGTH
	call .Copy

	ld hl, wPartyMonOTs
	ld de, wBufferMonOT
	ld a, NAME_LENGTH
	call .Copy

	ld hl, wPartySpecies
	ld de, wBufferMonAltSpecies
	ld a, 1
	; fallthrough
.Copy:
; Copies c bytes from hl+c*a to de if b is 1, otherwise the reverse.
	push bc
	bit 7, b
	jr z, .got_party

	; Copies from OT party instead.
	push bc
	ld bc, wOTPartyMons - wPartyMons
	add hl, bc
	pop bc
.got_party
	ld b, 0
	push af
	call AddNTimes
	pop af
	pop bc
	push bc
	ld c, a
	bit 0, b
	call z, SwapHLDE
	ld b, 0
	call CopyBytes
	pop bc
	ret

AddStorageMon:
; Adds wBufferMon to storage pointed to with de. Does nothing if e is 0, meaning
; a null entry. Returns a fatal error (crash) if the entry is occupied.
	; Do nothing if we're pointing towards null storage.
	ld a, e
	and a
	ret z

	; Allocate the entry. Return a fatal error if the entry was already set.
	call AllocateStorageFlag
.crash
	jr nz, .crash
	push hl
	push de
	push bc

	; Encode the tempmon for adding, but decode it afterwards to leave it in
	; the same state.
	push de
	call EncodeBufferMon
	pop de
	call OpenPokeDB

	ld d, h
	ld e, l
	ld hl, wEncodedBufferMon
	ld bc, SAVEMON_STRUCT_LENGTH
	call CopyBytes

	call DecodeBufferMon
	call CloseSRAM
	jp PopBCDEHL

OpenPokeDB:
; Opens pokedb bank and sets hl to relevant entry in de.
	push bc
	ld a, d
	dec a
	ld hl, .Bank1Pointers
	jr z, .got_bank
	ld hl, .Bank2Pointers
.got_bank
	ld a, e
	dec a
.loop
	ld c, a
	sub [hl]
	inc hl
	jr c, .found_table
	inc hl
	inc hl
	inc hl
	jr .loop
.found_table
	ld a, [hli]
	call OpenSRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	ld a, SAVEMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ret

MACRO pokedb_section
	; TODO: ideally the game should check that each of the tables' cumulative
	; section sizes match MONDB_ENTRIES
	db (\1End - \1Mons) / SAVEMON_STRUCT_LENGTH
	dba \1
ENDM

.Bank1Pointers:
	pokedb_section sNewBoxMons1
.Bank2Pointers:
	pokedb_section sNewBoxMons2

EncodeBufferMon:
; Encodes party_struct wBufferMon in-place to savemon_struct wEncodedBufferMon.
; Bytes identical to both structs do not need encoding.

	; Convert 4 PP bytes to 1 PP Up byte.
	ld hl, wBufferMonPP
	ld b, NUM_MOVES
	ld d, h
	ld e, l
.loop
	ld a, [de]
	srl [hl]
	srl [hl]
	and %11000000
	or [hl]
	ld [hl], a
	inc de
	dec b
	jr nz, .loop

	; Shift everything after PP Ups backwards.
	ld hl, wBufferMonHappiness
	ld de, wEncodedBufferMonHappiness
	ld bc, wEncodedBufferMonAltSpecies - wEncodedBufferMonHappiness
	call CopyBytes

	ld a, [wBufferMonAltSpecies]
	ld [wEncodedBufferMonAltSpecies], a

	; Move name-related bytes.
	ld hl, wBufferMonNickname
	ld de, wEncodedBufferMonNickname
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld hl, wBufferMonOT
	ld de, wEncodedBufferMonOT
	ld bc, PLAYER_NAME_LENGTH - 1
	call CopyBytes

	; Convert nickname+OT characters into reversible 7bit.
	ld hl, wEncodedBufferMonNickname
	ld b, wEncodedBufferMonEnd - wEncodedBufferMonNickname
.charmap_loop
	ld a, [hl]
	; " " ($7f) -> $46
	ld c, $46 | ~%01111111
	cp " "
	jr z, .replace
	; "@" ($50) -> $47
	inc c
	cp "@"
	jr z, .replace
	; "<START>" ($00) -> $48
	inc c
	and a ; cp "<START>"
	jr nz, .removebit
.replace
	ld a, c
.removebit
	and %01111111
	ld [hli], a
	dec b
	jr nz, .charmap_loop
	; fallthrough
ChecksumBufferMon:
; Calculate and write a checksum and to BufferMon. Use a nonzero baseline to
; avoid a complete null content from having 0 as a checksum.
; Returns z if an existing checksum is identical to the written checksum.
	; savemon struct except for nickname
	ld bc, wEncodedBufferMon
	ld hl, 127
	lb de, SAVEMON_NICKNAME, 0
	call .DoChecksum

	; nickname + OT. This skips one CRC multiplier due to a double-increase.
	; Counterintuitive but harmless (originally a mistake, but fixing would
	; needlessly break saves...).
	ld bc, wEncodedBufferMonNickname
	ld d, $80 | (SAVEMON_STRUCT_LENGTH - SAVEMON_NICKNAME)
	call .DoChecksum

	; Compare and write the result
	ld d, h
	ld e, l

	; Checksum is 16bit, further ones are padded with zeroes.
	; The padding being nonzero is also counted as invalid.
	ld b, 0 ; used for checksum error detection
	ld hl, wEncodedBufferMonNickname
	ld c, SAVEMON_STRUCT_LENGTH - SAVEMON_NICKNAME
.WriteChecksum:
	ld a, [hl]
	and %01111111
	sla e
	rl d
	jr nc, .not_set
	or %10000000
.not_set
	cp [hl]
	ld [hli], a
	jr z, .checksum_valid
	inc b
.checksum_valid
	dec c
	jr nz, .WriteChecksum
	ld a, b
	and a
	ret

.DoChecksum:
	inc e
	dec d
	bit 6, d
	ret nz
	ld a, [bc]
	inc bc
	bit 7, d
	jr z, .not_7bit
	and %01111111
.not_7bit
	push bc
	ld b, 0
	ld c, a
	ld a, e
	call AddNTimes
	pop bc
	jr .DoChecksum

DecodeBufferMon:
; Decodes BufferMon. Returns nz. Sets carry in case of invalid checksum.
	; First, run a checksum check. Don't use the result until we've done
	; character replacements back to their original state
	call ChecksumBufferMon
	push af

	; Reverse the 7bit character encoding back to its original state.
	ld hl, wEncodedBufferMonNickname
	ld b, wEncodedBufferMonEnd - wEncodedBufferMonNickname
.charmap_loop
	ld a, [hl]
	or $80
	sub $c6
	ld c, " "
	jr z, .replace
	dec a
	ld c, "@"
	jr z, .replace
	dec a
	jr z, .replace_a ; a is "<START>" ($00) iff the zero flag is set

	; Reverse the previous decrements
	add $c8
.replace_a
	ld c, a
.replace
	ld [hl], c
	inc hl
	dec b
	jr nz, .charmap_loop

	; Copy nickname and OT back to its original place. We need to do this backwards
	; due to overlap between wEncodedBufferMon(Nickname|OT) and wBufferMon(Nickname|OT).
	ld hl, wEncodedBufferMonOT + PLAYER_NAME_LENGTH - 2
	ld de, wBufferMonOT + PLAYER_NAME_LENGTH - 1
	lb bc, 2, PLAYER_NAME_LENGTH - 1

.outer_loop
	ld a, "@"
	ld [de], a
	dec de
.inner_loop
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .inner_loop

	; If this is the first time we leave the loop, do mon nickname now.
	dec b
	ld de, wBufferMonNickname + MON_NAME_LENGTH - 1
	ld c, MON_NAME_LENGTH - 1
	jr nz, .outer_loop

	; Shift data past PP to leave room for PP data.
	; AltSpecies is after stats when decoded, so handle that first separately.
	ld hl, wEncodedBufferMonAltSpecies
	ld de, wBufferMonAltSpecies
	ld a, [hld]
	ld [de], a
	ld de, wBufferMonLevel
	lb bc, NUM_MOVES, wEncodedBufferMonLevel - wEncodedBufferMonPPUps
.reverse_copybytes_loop
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .reverse_copybytes_loop

	; Write PP Up data.
	ld a, [hl]
.pp_loop
	push af
	and %11000000
	ld [de], a
	pop af
	add a
	add a
	dec de
	dec b
	jr nz, .pp_loop

	pop af
	jr z, SetTempPartyMonData

	ld hl, BadEgg
	ld de, wBufferMon
	ld bc, BadEggEnd - BadEgg
	call CopyBytes
	call SetTempPartyMonData
	scf
	ret

INCLUDE "data/pc/bad_egg.asm"

SetTempPartyMonData:
	; Calculate stats
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld b, TRUE
	ld hl, wBufferMonStatExp - 1
	ld de, wBufferMonMaxHP
	ld a, [wBufferMonLevel]
	ld [wCurPartyLevel], a
	predef CalcMonStats

	; Reset status condition
	xor a
	ld [wBufferMonStatus], a

	; Set HP to full
	ld hl, wBufferMonMaxHP
	ld de, wBufferMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	; Eggs have 0 current HP
	ld a, [wBufferMonAltSpecies]
	cp EGG
	jr nz, .not_egg
	xor a
	ld [de], a
	dec de
	ld [de], a

.not_egg
	ld hl, wBufferMonMoves
	ld de, wBufferMonPP
	newfarcall RestoreBufferPP
	or 1
	ret

EnsureStorageSpace:
; Returns z if we have at least a unallocated pokedb entries left. This exists
; because flushing incurs a significant performance penalty, so this function
; avoids it when checking storage if we can get away with it.
	ld b, a

	; First, check if we have enough entries without flushing.
	push bc
	call _CheckFreeDatabaseEntries
	pop bc
	cp b
	sbc a
	ret z

	; Try again, this time with flushing.
	push bc
	call CheckFreeDatabaseEntries
	pop bc
	cp b
	sbc a
	ret

CheckFreeDatabaseEntries:
; Returns amount of unused database entries left, or 255 if 255+. We don't
; really care if we have 255 or 314 entries left, only if we're running low.
	; Flush the storage system of duplicate entries.
	call FlushStorageSystem
	; fallthrough
_CheckFreeDatabaseEntries:
	; Now, count used entries.
	ldh a, [rSVBK]
	push bc
	push af
	ld a, BANK(wPokeDB1UsedEntries)
	ldh [rSVBK], a
	call .Function
	ld c, a
	pop af
	ldh [rSVBK], a
	ld a, c
	pop bc
	ret

.Function:
	ld hl, wPokeDB1UsedEntries
	call .CountEntries
	push bc
	ld hl, wPokeDB2UsedEntries
	call .CountEntries
	pop bc
	add c
	ret nc
	ld a, 255
	ret

.CountEntries:
	ld b, (MONDB_ENTRIES + 7) / 8
	call CountSetBits
	cpl
	add MONDB_ENTRIES + 1
	ld c, a
	ret

InitializeBoxes:
; Initializes the Storage System boxes as empty with default names and themes.
	ld a, BANK(sNewBox1)
	call OpenSRAM
	ld b, NUM_BOXES
	ld hl, sNewBox1
.name_loop
	push bc
	ld e, b
	ld bc, sNewBox1Name - sNewBox1
	xor a
	call ByteFill
	push hl
	push de
	ld de, .Box
	call CopyName2
	dec hl
	pop de
	ld a, NUM_BOXES + 1
	sub e
	sub 10
	jr c, .next
	ld [hl], "1"
	inc hl
	sub 10
.next
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld c, sNewBox2 - sNewBox1Name
	add hl, bc
	pop bc
	dec b
	jr nz, .name_loop

	; Sanity check backup boxes. We want to leave them alone for the most part
	; in case the player chose to start a new game, at least until they save.
	; However, if this is a brand new game, the SRAM might be filled with
	; garbage data. Ensure that box slots don't reference entries past
	; MONDB_ENTRIES since that would lead to odd behaviour when trying to check
	; flags in FlushStorageSystem (which needs to care about both active and
	; backup boxes).
	ld b, NUM_BOXES
	ld hl, sBackupNewBox1Entries
.outer_backup_loop
	ld c, MONS_PER_BOX
.inner_backup_loop
	ld a, [hl]
	cp MONDB_ENTRIES + 1
	jr c, .valid_entry
	xor a
.valid_entry
	ld [hli], a
	dec c
	jr nz, .inner_backup_loop
	ld de, sBackupNewBox2 - sBackupNewBox1 - MONS_PER_BOX
	add hl, de
	dec b
	jr nz, .outer_backup_loop

	ld de, BillsPC_DefaultBoxThemes
	ld hl, sNewBox1Theme
.theme_loop
	ld a, [de]
	inc de
	inc a
	jr z, .done
	dec a
	ld [hl], a
	ld bc, sNewBox2 - sNewBox1
	add hl, bc
	jr .theme_loop
.done
	call CloseSRAM

	; In case we reset the game mid-flush and then chose to start a new game,
	; ensure that all entries are allocated properly.
	jp FlushStorageSystem
.Box:
	db "BOX @"

INCLUDE "data/pc/default_box_themes.asm"

_PointBoxTheme:
; Return's [wCurBox]'s theme pointer in hl.
; Also opens [wCurBox]'s SRAM bank.
	ld a, BANK(sNewBox1)
	call OpenSRAM
	ld hl, sNewBox1Theme
	ld a, [wCurBox]
	ld bc, sNewBox2 - sNewBox1
	jp AddNTimes

GetBoxTheme:
; Returns [wCurBox]'s theme in a.
	call _PointBoxTheme
	ld a, [hl]
	jp CloseSRAM

SetBoxTheme:
; Sets [wCurBox]'s theme to a.
	push af
	call _PointBoxTheme
	pop af
	ld [hl], a
	jp CloseSRAM

GetCurBoxName:
; Writes name of current box to string buffer 1.
	ld a, [wCurBox]
	inc a
	ld b, a
	; fallthrough
GetBoxName:
; Writes name of box b to string buffer 1.
	ld c, 0
	call CopyBoxName

	; Ensure that there's a terminator at the end. This isn't included as part
	; of saved box name.
	ld a, "@"
	ld [wStringBuffer1 + BOX_NAME_LENGTH], a
	ret

SetBoxName:
; Writes name from string buffer 1 to box b.
	ld c, 1
	; fallthrough
CopyBoxName:
; Copies between box b and string buffer 1 depending on value of c.
; c=0: Copy from box b to string buffer 1.
; c=1: Copy from string buffer 1 to box b.
	ld a, BANK(sNewBox1)
	call OpenSRAM
	ld hl, sNewBox1Name
	ld a, b
	dec a
	push bc
	ld bc, sNewBox2 - sNewBox1
	call AddNTimes
	pop bc
	ld de, wStringBuffer1
	dec c
	call z, SwapHLDE
	ld bc, BOX_NAME_LENGTH
	call CopyBytes
	jp CloseSRAM

PrevStorageBoxMon:
; Reads wBufferMonBox+wBufferMonSlot and attempts to load a previous mon.
; Returns nz upon success, otherwise z. If there is no previous mon,
; wBufferMonBox+wBufferMonSlot is unchanged.
	push bc
	ld a, [wBufferMonSlot]
	ld b, a
	ld c, a
.loop
	dec c
	jr z, .restore_slot
	push bc
	ld a, [wBufferMonBox]
	ld b, a
	call GetStorageBoxMon
	pop bc
	jr nz, .done
	jr .loop
.restore_slot
	ld a, b
	ld [wBufferMonSlot], a
.done
	pop bc
	ret

NextStorageBoxMon:
; Reads wBufferMonBox+wBufferMonSlot and attempts to load the next mon.
; Returns nz upon success, otherwise z. If there is no next mon,
; wBufferMonBox+wBufferMonSlot is unchanged.
	push bc
	ld a, [wBufferMonSlot]
	ld b, a
	ld c, a
.loop
	ld a, c
	inc c
	cp MONS_PER_BOX
	jr z, .restore_slot
.get_storage
	push bc
	ld a, [wBufferMonBox]
	ld b, a
	call GetStorageBoxMon
	pop bc
	jr nz, .done
	; If we're dealing with a party, we ran past the amount of mons we have.
	ld a, [wBufferMonBox]
	and $7f
	jr nz, .loop
	; fallthrough
.restore_slot
	ld a, b
	ld [wBufferMonSlot], a
.done
	pop bc
	ret

GetStorageBoxMon:
; Reads storage bank+entry from box b slot c and put it in wBufferMon.
; This function supports handling the OT party by setting b to $80.
; If there is a checksum error, put Bad Egg data in wBufferMon instead.
; Returns c in case of a Bad Egg, z if the requested mon doesn't exist,
; nz|nc otherwise. If b==0, read from party list. c is 1-indexed.
	xor a
	ld [wBufferMonSlot], a
	; Check if we're reading party or box data.
	ld a, b
	ld [wBufferMonBox], a
	and $7f
	jr z, .read_party
	push de
	call GetStorageBoxPointer
	call GetStorageMon
	pop de
	ret z
	ld a, c
	ld [wBufferMonSlot], a
	ret

.read_party
	and a
	ld a, [wPartyCount]
	jr z, .got_partycount
	ld a, [wOTPartyCount]
.got_partycount
	cp c
	jr nc, .party_not_empty
	xor a
	ret
.party_not_empty
	ld a, c
	ld [wBufferMonSlot], a
	push hl
	push de
	push bc
	inc b
	call CopyBetweenPartyAndTemp

	; Calculate stats
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	or 1
	jp PopBCDEHL

GetStorageMon:
; Reads storage bank d, entry e and put it in wBufferMon.
; If there is a checksum error, put Bad Egg data in wBufferMon instead.
; Returns c in case of a Bad Egg, z if the requested mon doesn't exist,
; nz|nc otherwise.
	push hl
	push de
	push bc
	call IsStorageUsed
	jr z, .done ; entry not found

	call OpenPokeDB

	; Write to wEncodedBufferMon and then decode it.
	ld de, wEncodedBufferMon
	ld bc, SAVEMON_STRUCT_LENGTH
	call CopyBytes

	; Decode the result. This also returns a Bad Egg failsafe on a checksum
	; error.
	call DecodeBufferMon
.done
	call CloseSRAM
	jp PopBCDEHL

AllocateStorageFlag:
; Allocates the given storage flag. Returns nz if storage is already in use.
	call IsStorageUsed
	ret nz
	call _AllocateStorageFlag
	xor a
	ret

IsStorageUsed:
; Returns z if the given storage slot is unused. Preserves wBufferMon.
	ld a, CHECK_FLAG
	jr StorageFlagAction
_AllocateStorageFlag:
	ld a, SET_FLAG
	; fallthrough
StorageFlagAction:
; Performs flag action a on storage entry in de.
	; If we're dealing with a null entry (e=0), do nothing but pretend the
	; entry is unused if asked. Don't optimize away the xor a, since we
	; want to mimic the normal behaviour of the function.
	inc e
	dec e
	jr nz, .not_null
	xor a
	ret

.not_null
	push hl
	push de
	push bc
	ld b, a

	call .do_it
	; Stack call doesn't preserve flags.
	and a
	jp PopBCDEHL

.do_it
	ldh a, [rSVBK]
	push bc
	push af
	ld a, BANK(wPokeDB1UsedEntries)
	ldh [rSVBK], a
	call .Function
	pop af
	ldh [rSVBK], a
	ld a, c
	pop bc
	ret

.Function:
	ld a, d
	dec a
	ld hl, wPokeDB1UsedEntries
	jr z, .got_entries
	ld hl, wPokeDB2UsedEntries
.got_entries
	ld c, e
	dec c
	ld d, 0
	predef_jump SmallFarFlagAction

Special_CurBoxFullCheck:
; Returns [wScriptVar] = zero if wBufferMonBox == wCurBox
; Returns [wScriptVar] = nonzero if wBufferMonBox != wCurBox
	call CurBoxFullCheck
	ld [wScriptVar], a
	ret

CurBoxFullCheck:
; Requires wBufferMonBox to have sent mon box (returned in b)
; Returns z if wBufferMonBox == wCurBox (or wBufferMonBox = 0)
; Returns nz if wBufferMonBox != wCurBox
;   Also returns name of old wCurBox in wStringBuffer1
;   and sets wCurBox to wBufferMonBox in this case
	ld a, [wBufferMonBox]
	and a
	ret z
	dec a
	ld b, a
	ld a, [wCurBox]
	cp b
	ret z
	push bc
	call GetCurBoxName
	pop bc
	ld a, b
	ld [wCurBox], a
	or 1
	ret
