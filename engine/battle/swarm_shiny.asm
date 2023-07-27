GenerateSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp LANDMARK_ROUTE_35
	jr z, .yanma
	cp LANDMARK_DARK_CAVE
	jr z, .dunsparce
	cp LANDMARK_ROUTE_32
	jr z, .qwilfish
	jr .skipshine

.yanma
	ld a, [wCurPartySpecies]
	cp YANMA
	jr nz, .skipshine
	jr .rollshiny
.dunsparce
	ld a, [wCurPartySpecies]
	cp DUNSPARCE
	jr nz, .skipshine
	jr .rollshiny
.qwilfish
	ld a, [wCurPartySpecies]
	cp QWILFISH
	jr nz, .skipshine
	;fallthrough
.rollshiny
	call Random
	cp 7 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 7 ; adjust to desired percentage
	jr nc, .skipshine
	ld b, ATKDEFDV_SHINYF
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs

.skipshine:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ret