; AI_SMART encourages Sunny Day if it also knows these moves.

SunnyDayMoves:
; BUG: "Smart" AI does not encourage Sunny Day when it knows Solar Beam, Flame Wheel, or Moonlight (see docs/bugs_and_glitches.md)
	db FIRE_PUNCH
	db EMBER
	db FLAMETHROWER
	db FIRE_SPIN
	db FIRE_BLAST
	db SACRED_FIRE
	db MORNING_SUN
	db SYNTHESIS
	db -1 ; end
