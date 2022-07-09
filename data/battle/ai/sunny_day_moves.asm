; AI_SMART prefers these moves during harsh sunlight.

SunnyDayMoves:
; BUG: "Smart" AI does not encourage Solar Beam, Flame Wheel, or Moonlight during Sunny Day (see docs/bugs_and_glitches.md)
	db FIRE_PUNCH
	db EMBER
	db FLAMETHROWER
	db FIRE_SPIN
	db FIRE_BLAST
	db SACRED_FIRE
	db MORNING_SUN
	db SYNTHESIS
	db -1 ; end
