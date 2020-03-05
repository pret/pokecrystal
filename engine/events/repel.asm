RepelWoreOffScript::
	opentext
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end

UseAnotherRepelScript::
	opentext
	writetext .text
	yesorno
	iffalse .done
	callasm DoItemEffect
.done
	closetext
	end

.text:
	text_far _UseAnotherRepelText
	text_end
