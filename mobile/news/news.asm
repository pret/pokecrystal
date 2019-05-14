; http://forums.glitchcity.info/index.php?topic=7509.msg206449#msg206449


SECTION "mobile/news/news.asm@Unreferenced_Function1f4003", ROMX

	db $cc, $6b, $1e ; unused

Unreferenced_Function1f4003:
	ld a, $6
	call GetSRAMBank
	ld hl, .news_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_1.bin"


SECTION "mobile/news/news.asm@Unreferenced_Function1f4dbe", ROMX

Unreferenced_Function1f4dbe:
	ld a, $6
	call GetSRAMBank
	ld hl, .news_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_2.bin"


SECTION "mobile/news/news.asm@Function1f5d9f", ROMX

Function1f5d9f:
	ld a, $6
	call GetSRAMBank
	ld hl, .news_data
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_3.bin"
