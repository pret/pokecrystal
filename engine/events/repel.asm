INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/text.inc"


SECTION "engine/events/repel", ROMX

RepelWoreOffScript::
	opentext
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end
