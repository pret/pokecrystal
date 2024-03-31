; These lists determine the battle music and victory music, and whether to
; award HAPPINESS_GYMBATTLE for winning.

; Note: CHAMPION and RED are unused for battle music checks, since they are
; accounted for prior to the list check.

GymLeaders:
	db FALKNER
	db WHITNEY
	db BUGSY
	db MORTY
	db PRYCE
	db JASMINE
	db CHUCK
	db CLAIR
	db LANCE
	db RED
	db CAL
	db GIOVANNI
; fallthrough
KantoGymLeaders:
    db WILL
	db BRUNO
	db KAREN
	db KOGA
	db AGATHA
	db LORELEI
	db LT_SURGE
	db ERIKA
	db JANINE
	db SABRINA
	db MISTY
	db BROCK
	db BLAINE
	db BLUE
	db -1
