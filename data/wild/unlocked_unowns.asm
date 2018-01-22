UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .Set1 ; ENGINE_UNLOCKED_UNOWNS_A_TO_K
	dw .Set2 ; ENGINE_UNLOCKED_UNOWNS_L_TO_R
	dw .Set3 ; ENGINE_UNLOCKED_UNOWNS_S_TO_W
	dw .Set4 ; ENGINE_UNLOCKED_UNOWNS_X_TO_Z
.End

.Set1:
	;  A   B   C   D   E   F   G   H   I   J   K
	db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, -1
.Set2:
	;  L   M   N   O   P   Q   R
	db 12, 13, 14, 15, 16, 17, 18, -1
.Set3:
	;  S   T   U   V   W
	db 19, 20, 21, 22, 23, -1
.Set4:
	;  X   Y   Z
	db 24, 25, 26, -1
