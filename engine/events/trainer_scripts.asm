TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	encountermusic
	jump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadmemtrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovement2 wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript:
	opentext
	trainertext $0
	waitbutton
	closetext
	loadmemtrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadvar wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter
