TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadtemptrainer
	encountermusic
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	sjump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadtemptrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	sjump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript:
	closetext
	loadtemptrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadmem wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
; Say the post-battle message
	loadtemptrainer
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	yesorno
	iftrue StartBattleWithMapTrainerScript
	closetext
	scripttalkafter
