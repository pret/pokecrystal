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
	sjump PhoneScript_HangupText_Male

.Rollout:
	farwritetext JackRolloutTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Solarbeam:
	farwritetext JackSolarbeamTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Stomp:
	farwritetext JackStompTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Gust:
	farwritetext JackGustTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Twister:
	farwritetext JackTwisterTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Earthquake:
	farwritetext JackEarthquakeTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Magnitude:
	farwritetext JackMagnitudeTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.Sandstorm:
	farwritetext JackSandstormTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.SunnyDay:
	farwritetext JackSunnyDayTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male

.RainDance:
	farwritetext JackRainDanceTriviaText
	buttonsound
	sjump PhoneScript_HangupText_Male
