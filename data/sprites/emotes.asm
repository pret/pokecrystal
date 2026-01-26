MACRO emote
; graphics pointer, length, starting tile
	dw \1
	db \2 tiles, BANK(\1)
	dw vTiles0 tile \3
ENDM

Emotes:
; entries correspond to EMOTE_* constants
	table_width EMOTE_LENGTH
	emote ShockEmote,     4, $f8
	emote QuestionEmote,  4, $f8
	emote HappyEmote,     4, $f8
	emote SadEmote,       4, $f8
	emote HeartEmote,     4, $f8
	emote BoltEmote,      4, $f8
	emote SleepEmote,     4, $f8
	emote FishEmote,      4, $f8
	emote JumpShadowGFX,  1, $fc
	emote FishingRodGFX,  2, $fc
	emote BoulderDustGFX, 2, $fe
	emote GrassRustleGFX, 1, $fe
	assert_table_length NUM_EMOTES
