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
	readmem wRepelType
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
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