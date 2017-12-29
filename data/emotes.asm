emote: MACRO
; graphics pointer, length, starting tile
	dw \1
	db \2 tiles, BANK(\1)
	dw vTiles1 tile \3
ENDM

Emotes: ; 144d
; entries correspond to EMOTE_* constants
	emote ShockEmote,     4, $78
	emote QuestionEmote,  4, $78
	emote HappyEmote,     4, $78
	emote SadEmote,       4, $78
	emote HeartEmote,     4, $78
	emote BoltEmote,      4, $78
	emote SleepEmote,     4, $78
	emote FishEmote,      4, $78
	emote JumpShadowGFX,  1, $7c
	emote FishingRodGFX,  2, $7c
	emote BoulderDustGFX, 2, $7e
	emote GrassRustleGFX, 1, $7e
; 14495
