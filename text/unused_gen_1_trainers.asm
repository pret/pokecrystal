GetGen1TrainerClassName: ; 50a28
; XXX
	ld hl, .Strings
	ld a, [TrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret

.Strings: ; 50a42
; Untranslated trainer class names from Red.
	dw .Youngster
	dw .BugCatcher
	dw .Lass
	dw OTClassName
	dw .JrTrainerM
	dw .JrTrainerF
	dw .Pokemaniac
	dw .SuperNerd
	dw OTClassName
	dw OTClassName
	dw .Burglar
	dw .Engineer
	dw .Jack
	dw OTClassName
	dw .Swimmer
	dw OTClassName
	dw OTClassName
	dw .Beauty
	dw OTClassName
	dw .Rocker
	dw .Juggler
	dw OTClassName
	dw OTClassName
	dw .Blackbelt
	dw OTClassName
	dw .ProfOak
	dw .Chief
	dw .Scientist
	dw OTClassName
	dw .Rocket
	dw .CooltrainerM
	dw .CooltrainerF
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName
	dw OTClassName

.Youngster:    db "たんパン@"
.BugCatcher:   db "むしとり@"
.Lass:         db "ミニスカ@"
.JrTrainerM:   db "ボーイ@"
.JrTrainerF:   db "ガール@"
.Pokemaniac:   db "マニア@"
.SuperNerd:    db "りかけい@"
.Burglar:      db "どろぼう@"
.Engineer:     db "ォヤジ@"
.Jack:         db "ジャック@"
.Swimmer:      db "かいパン@"
.Beauty:       db "おねえさん@"
.Rocker:       db "グループ@"
.Juggler:      db "ジャグラー@"
.Blackbelt:    db "からて@"
.ProfOak:      db "ォーキド@"
.Chief:        db "チーフ@"
.Scientist:    db "けんきゅういん@"
.Rocket:       db "だんいん@"
.CooltrainerM: db "エりート♂@"
.CooltrainerF: db "エりート♀@"
