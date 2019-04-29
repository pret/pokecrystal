QueueScript::
; Push pointer hl in the current bank to wQueuedScriptBank.
	ldh a, [hROMBank]

FarQueueScript::
; Push pointer a:hl to wQueuedScriptBank.
	ld [wQueuedScriptBank], a
	ld a, l
	ld [wQueuedScriptAddr], a
	ld a, h
	ld [wQueuedScriptAddr + 1], a
	ret
