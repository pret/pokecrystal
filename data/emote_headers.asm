emote_header: MACRO
; graphics pointer, length, starting tile
	dw \1
	db \2 tiles, BANK(\1)
	dw VTiles1 tile \3
ENDM

; entries correspond to EMOTE_* constants
	emote_header ShockEmote,     4, $78
	emote_header QuestionEmote,  4, $78
	emote_header HappyEmote,     4, $78
	emote_header SadEmote,       4, $78
	emote_header HeartEmote,     4, $78
	emote_header BoltEmote,      4, $78
	emote_header SleepEmote,     4, $78
	emote_header FishEmote,      4, $78
	emote_header JumpShadowGFX,  1, $7c
	emote_header FishingRodGFX,  2, $7c
	emote_header BoulderDustGFX, 2, $7e
	emote_header GrassRustleGFX, 1, $7e
