InitList: ; 50db9
	ld a, [wInitListType]

	cp INIT_ENEMYOT_LIST
	jr nz, .check_party_ot_name
	ld hl, OTPartyCount
	ld de, OTPartyMonOT
	ld a, ENEMY_OT_NAME
	jr .done

.check_party_ot_name
	cp INIT_PLAYEROT_LIST
	jr nz, .check_mon_name
	ld hl, PartyCount
	ld de, PartyMonOT
	ld a, PARTY_OT_NAME
	jr .done

.check_mon_name
	cp INIT_MON_LIST
	jr nz, .check_item_name
	ld hl, CurMart
	ld de, PokemonNames
	ld a, PKMN_NAME
	jr .done

.check_item_name
	cp INIT_BAG_ITEM_LIST
	jr nz, .check_ob_item_name
	ld hl, NumItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done

.check_ob_item_name
	ld hl, CurMart
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
