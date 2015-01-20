checkturn: macro
	db $01
	endm

checkobedience: macro
	db $02
	endm

usedmovetext: macro
	db $03
	endm

doturn: macro
	db $04
	endm

critical: macro
	db $05
	endm

damagestats: macro
	db $06
	endm

stab: macro
	db $07
	endm

damagevariation: macro
	db $08
	endm

checkhit: macro
	db $09
	endm

effect0x0a: macro
	db $0a
	endm

effect0x0b: macro
	db $0b
	endm

effect0x0c: macro
	db $0c
	endm

resulttext: macro
	db $0d
	endm

checkfaint: macro
	db $0e
	endm

criticaltext: macro
	db $0f
	endm

supereffectivetext: macro
	db $10
	endm

checkdestinybond: macro
	db $11
	endm

buildopponentrage: macro
	db $12
	endm

poisontarget: macro
	db $13
	endm

sleeptarget: macro
	db $14
	endm

draintarget: macro
	db $15
	endm

eatdream: macro
	db $16
	endm

burntarget: macro
	db $17
	endm

freezetarget: macro
	db $18
	endm

paralyzetarget: macro
	db $19
	endm

selfdestruct: macro
	db $1a
	endm

mirrormove: macro
	db $1b
	endm

statup: macro
	db $1c
	endm

statdown: macro
	db $1d
	endm

payday: macro
	db $1e
	endm

conversion: macro
	db $1f
	endm

resetstats: macro
	db $20
	endm

storeenergy: macro
	db $21
	endm

unleashenergy: macro
	db $22
	endm

forceswitch: macro
	db $23
	endm

endloop: macro
	db $24
	endm

flinchtarget: macro
	db $25
	endm

ohko: macro
	db $26
	endm

recoil: macro
	db $27
	endm

mist: macro
	db $28
	endm

focusenergy: macro
	db $29
	endm

confuse: macro
	db $2a
	endm

confusetarget: macro
	db $2b
	endm

heal: macro
	db $2c
	endm

transform: macro
	db $2d
	endm

screen: macro
	db $2e
	endm

poison: macro
	db $2f
	endm

paralyze: macro
	db $30
	endm

substitute: macro
	db $31
	endm

rechargenextturn: macro
	db $32
	endm

mimic: macro
	db $33
	endm

metronome: macro
	db $34
	endm

leechseed: macro
	db $35
	endm

splash: macro
	db $36
	endm

disable: macro
	db $37
	endm

cleartext: macro
	db $38
	endm

charge: macro
	db $39
	endm

checkcharge: macro
	db $3a
	endm

traptarget: macro
	db $3b
	endm

effect0x3c: macro
	db $3c
	endm

rampage: macro
	db $3d
	endm

checkrampage: macro
	db $3e
	endm

constantdamage: macro
	db $3f
	endm

counter: macro
	db $40
	endm

encore: macro
	db $41
	endm

painsplit: macro
	db $42
	endm

snore: macro
	db $43
	endm

conversion2: macro
	db $44
	endm

lockon: macro
	db $45
	endm

sketch: macro
	db $46
	endm

defrostopponent: macro
	db $47
	endm

sleeptalk: macro
	db $48
	endm

destinybond: macro
	db $49
	endm

spite: macro
	db $4a
	endm

falseswipe: macro
	db $4b
	endm

healbell: macro
	db $4c
	endm

kingsrock: macro
	db $4d
	endm

triplekick: macro
	db $4e
	endm

kickcounter: macro
	db $4f
	endm

thief: macro
	db $50
	endm

arenatrap: macro
	db $51
	endm

nightmare: macro
	db $52
	endm

defrost: macro
	db $53
	endm

curse: macro
	db $54
	endm

protect: macro
	db $55
	endm

spikes: macro
	db $56
	endm

foresight: macro
	db $57
	endm

perishsong: macro
	db $58
	endm

startsandstorm: macro
	db $59
	endm

endure: macro
	db $5a
	endm

checkcurl: macro
	db $5b
	endm

rolloutpower: macro
	db $5c
	endm

effect0x5d: macro
	db $5d
	endm

furycutter: macro
	db $5e
	endm

attract: macro
	db $5f
	endm

happinesspower: macro
	db $60
	endm

present: macro
	db $61
	endm

damagecalc: macro
	db $62
	endm

frustrationpower: macro
	db $63
	endm

safeguard: macro
	db $64
	endm

checksafeguard: macro
	db $65
	endm

getmagnitude: macro
	db $66
	endm

batonpass: macro
	db $67
	endm

pursuit: macro
	db $68
	endm

clearhazards: macro
	db $69
	endm

healmorn: macro
	db $6a
	endm

healday: macro
	db $6b
	endm

healnite: macro
	db $6c
	endm

hiddenpower: macro
	db $6d
	endm

startrain: macro
	db $6e
	endm

startsun: macro
	db $6f
	endm

attackup: macro
	db $70
	endm

defenseup: macro
	db $71
	endm

speedup: macro
	db $72
	endm

specialattackup: macro
	db $73
	endm

specialdefenseup: macro
	db $74
	endm

accuracyup: macro
	db $75
	endm

evasionup: macro
	db $76
	endm

attackup2: macro
	db $77
	endm

defenseup2: macro
	db $78
	endm

speedup2: macro
	db $79
	endm

specialattackup2: macro
	db $7a
	endm

specialdefenseup2: macro
	db $7b
	endm

accuracyup2: macro
	db $7c
	endm

evasionup2: macro
	db $7d
	endm

attackdown: macro
	db $7e
	endm

defensedown: macro
	db $7f
	endm

speeddown: macro
	db $80
	endm

specialattackdown: macro
	db $81
	endm

specialdefensedown: macro
	db $82
	endm

accuracydown: macro
	db $83
	endm

evasiondown: macro
	db $84
	endm

attackdown2: macro
	db $85
	endm

defensedown2: macro
	db $86
	endm

speeddown2: macro
	db $87
	endm

specialattackdown2: macro
	db $88
	endm

specialdefensedown2: macro
	db $89
	endm

accuracydown2: macro
	db $8a
	endm

evasiondown2: macro
	db $8b
	endm

statmessageuser: macro
	db $8c
	endm

statmessagetarget: macro
	db $8d
	endm

statupfailtext: macro
	db $8e
	endm

statdownfailtext: macro
	db $8f
	endm

effectchance: macro
	db $90
	endm

effect0x91: macro
	db $91
	endm

effect0x92: macro
	db $92
	endm

switchturn: macro
	db $93
	endm

fakeout: macro
	db $94
	endm

bellydrum: macro
	db $95
	endm

psychup: macro
	db $96
	endm

rage: macro
	db $97
	endm

doubleflyingdamage: macro
	db $98
	endm

doubleundergrounddamage: macro
	db $99
	endm

mirrorcoat: macro
	db $9a
	endm

checkfuturesight: macro
	db $9b
	endm

futuresight: macro
	db $9c
	endm

doubleminimizedamage: macro
	db $9d
	endm

skipsuncharge: macro
	db $9e
	endm

thunderaccuracy: macro
	db $9f
	endm

teleport: macro
	db $a0
	endm

beatup: macro
	db $a1
	endm

ragedamage: macro
	db $a2
	endm

effect0xa3: macro
	db $a3
	endm

allstatsup: macro
	db $a4
	endm

effect0xa5: macro
	db $a5
	endm

effect0xa6: macro
	db $a6
	endm

effect0xa7: macro
	db $a7
	endm

effect0xa8: macro
	db $a8
	endm

clearmissdamage: macro
	db $a9
	endm

movedelay: macro
	db $aa
	endm

hittarget: macro
	db $ab
	endm

tristatuschance: macro
	db $ac
	endm

supereffectivelooptext: macro
	db $ad
	endm

startloop: macro
	db $ae
	endm

curl: macro
	db $af
	endm

endturn: macro
	db $fe
	endm

endmove: macro
	db $ff
	endm

