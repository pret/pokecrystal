; http://forums.glitchcity.info/index.php?topic=7509.msg206449#msg206449

	dab PlayersHouseDoll1Script ; related to "My Room" in Stadium 2?

Function1f4003: ; unreferenced
	ld a, BANK(s6_a000)
	call OpenSRAM
	ld hl, .news_data
	ld de, s6_a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_1.bin"

Function1f4dbe: ; unreferenced
	ld a, BANK(s6_a000)
	call OpenSRAM
	ld hl, .news_data
	ld de, s6_a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_2.bin"

Function1f5d9f: ; unreferenced
	ld a, BANK(s6_a000)
	call OpenSRAM
	ld hl, .news_data
	ld de, s6_a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_3.bin"
