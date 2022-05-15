MagikarpLengths:
; [wMagikarpLength] = z * 100 + (bc - x) / y
; First argument is the bc threshold as well as x.
; Second argument is y.
; In reality, due to the bug at .BCLessThanDE,
; the threshold is determined by only register b.
	dwb   110, 1 ; not used unless the bug is fixed
	dwb   310, 2
	dwb   710, 4
	dwb  2710, 20
	dwb  7710, 50
	dwb 17710, 100
	dwb 32710, 150
	dwb 47710, 150
	dwb 57710, 100
	dwb 62710, 50
	dwb 64710, 20
	dwb 65210, 5
	dwb 65410, 2
	dwb 65510, 1 ; not used
