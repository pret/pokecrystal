JackTriviaScript:
	random 11
	ifequal  0, .Thunder
	ifequal  1, .Rollout
	ifequal  2, .Solarbeam
	ifequal  3, .Stomp
	ifequal  4, .Gust
	ifequal  5, .Twister
	ifequal  6, .Earthquake
	ifequal  7, .Magnitude
	ifequal  8, .Sandstorm
	ifequal  9, .SunnyDay
	ifequal 10, .RainDance

.Thunder:
	farwritetext JackThunderTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Rollout:
	farwritetext JackRolloutTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Solarbeam:
	farwritetext JackSolarbeamTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Stomp:
	farwritetext JackStompTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Gust:
	farwritetext JackGustTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Twister:
	farwritetext JackTwisterTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Earthquake:
	farwritetext JackEarthquakeTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Magnitude:
	farwritetext JackMagnitudeTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.Sandstorm:
	farwritetext JackSandstormTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.SunnyDay:
	farwritetext JackSunnyDayTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male

.RainDance:
	farwritetext JackRainDanceTriviaText
	buttonsound
	jump PhoneScript_HangupText_Male
