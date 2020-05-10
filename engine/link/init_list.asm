InitList:
; This entire function is useless.
	ld a, [wInitListType]

	cp INIT_ENEMYOT_LIST
	jr nz, .check_party_ot_name
	ld hl, wOTPartyCount
	ld de, wOTPartyMonOT
	ld a, ENEMY_OT_NAME
	jr .done

.check_party_ot_name
	cp INIT_PLAYEROT_LIST
	jr nz, .check_mon_name
	ld hl, wPartyCount
	ld de, wPartyMonOT
	ld a, PARTY_OT_NAME
	jr .done

.check_mon_name
	cp INIT_MON_LIST
	jr nz, .check_item_name
	ld hl, wCurMart
	ld de, PokemonNames
	ld a, MON_NAME
	jr .done

.check_item_name
	cp INIT_BAG_ITEM_LIST
	jr nz, .check_ob_item_name
	ld hl, wNumItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done

.check_ob_item_name
	ld hl, wCurMart
	ld de, ItemNames
	ld a, ITEM_NAME
.done
	ld [wNamedObjectTypeBuffer], a
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, e
	ld [wUnusedD102], a
	ld a, d
	ld [wUnusedD102 + 1], a
	ld bc, ItemAttributes
	ld a, c
	ld [wItemAttributesPtr], a
	ld a, b
	ld [wItemAttributesPtr + 1], a
	ret
