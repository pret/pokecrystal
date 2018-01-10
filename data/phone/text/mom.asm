MomPhoneGreetingText: ; 0x1b4000
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "Working hard?"
	done

MomPhoneLandmarkText: ; 0x1b4021
	text "Oh, so you're in"
	line "@"
	text_from_ram StringBuffer3
	text "…"

	para "Isn't that where"
	line "@"
	text_from_ram StringBuffer4
	text ""
	para "is? Did you go"
	line "take a look?"
	done

MomPhoneGenericAreaText: ; 0x1b406b
	text "Really, you're in"
	line "@"
	text_from_ram StringBuffer3
	text "?"

	para "I've never gone"
	line "there. That's kind"
	cont "of neat, <PLAYER>."
	done

MomPhoneNewBarkText: ; 0x1b40b1
	text "What? You're in"
	line "@"
	text_from_ram StringBuffer3
	text "?"

	para "Come see your MOM"
	line "sometime!"
	done

MomPhoneCherrygroveText: ; 0x1b40e4
	text "You're visiting"
	line "@"
	text_from_ram StringBuffer3
	text "?"

	para "How about coming"
	line "home for a bit?"
	done

MomOtherAreaText: ; 0x1b411c
	text "Wow, you're in"
	line "@"
	text_from_ram StringBuffer3
	text "?"

	para "Good luck on your"
	line "#MON quest!"
	done

MomDeterminedText: ; 0x1b4150
	text "That sounds really"
	line "tough."

	para "But, <PLAYER>, I"
	line "know you're really"

	para "determined. You'll"
	line "be OK, right?"
	done

MomCheckBalanceText: ; 0x1b41a7
	text "By the way, you've"
	line "saved up ¥@"
	text_from_ram StringBuffer3
	text "."

	para "Do you want to"
	line "keep on saving?"
	done

MomImportantToSaveText: ; 0x1b41ea
	text "It's important to"
	line "save your money."
	done

MomYoureNotSavingText: ; 0x1b420d
	text "Oh, <PLAYER>,"
	line "you're not saving"

	para "any money. Would"
	line "you like to save?"
	done

MomYouveSavedText: ; 0x1b4249
	text "By the way, you've"
	line "saved up ¥@"
	text_from_ram StringBuffer3
	text "."

	para "Want to start"
	line "saving again?"
	done

MomOKIllSaveText: ; 0x1b4289
	text "OK. I'll save your"
	line "money."
	done

MomPhoneWontSaveMoneyText: ; 0x1b42a3
	text "OK. I won't save"
	line "your money."
	done

MomPhoneHangUpText: ; 0x1b42c0
	text "<PLAYER>, keep it"
	line "up! I'm rooting"
	cont "for you, baby!"
	done

MomPhoneNoPokemonText: ; 0x1b42ea
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "Wasn't PROF.ELM"
	cont "waiting for you?"
	done

MomPhoneNoPokedexText: ; 0x1b431d
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "You're on a big"

	para "mission for PROF."
	line "ELM? Be good!"
	done

MomPhoneNoGymQuestText: ; 0x1b435f
	text "Hello?"

	para "Hi, <PLAYER>! If"
	line "you're done with"

	para "your errand come"
	line "on home, dear."
	done

MomPhoneLectureText: ; 0x1b43a1
	text "Hello?"

	para "…… <PLAYER>?"
	line "I heard from PROF."

	para "ELM that you went"
	line "on a long trip."

	para "I wish you would"
	line "have told me…"

	para "What about money?"
	line "Should I save it?"
	done
