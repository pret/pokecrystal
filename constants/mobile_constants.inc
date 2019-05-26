if !DEF(MOBILE_CONSTANTS_INC)
MOBILE_CONSTANTS_INC EQU 1

INCLUDE "macros/enum.inc"

; MobileEZChatCategoryPointers indexes (see mobile/fixed_words.inc)
	const_def
	const EZCHAT_POKEMON
	const EZCHAT_TYPES
	const EZCHAT_GREETINGS
	const EZCHAT_PEOPLE
	const EZCHAT_BATTLE
	const EZCHAT_EXCLAMATIONS
	const EZCHAT_CONVERSATION
	const EZCHAT_FEELINGS
	const EZCHAT_CONDITIONS
	const EZCHAT_LIFE
	const EZCHAT_HOBBIES
	const EZCHAT_ACTIONS
	const EZCHAT_TIME
	const EZCHAT_FAREWELLS
	const EZCHAT_THISANDTHAT

NUM_KANA EQU 45 ; length of SortedPokemon table (see mobile/fixed_words.inc)

MOBILE_LOGIN_PASSWORD_LENGTH EQU 17

endc
