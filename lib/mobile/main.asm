; A library included as part of the Mobile Adapter GB SDK.

INCBIN "baserom.gbc", $110000, $110fad - $110000

URIPrefix: ; 0x110fad
	ascii "http://"
HTTPDownloadURL: ; 0x110fb4
	ascii "gameboy.datacenter.ne.jp/cgb/download"
HTTPUploadURL: ; 0x110fd9
	ascii "gameboy.datacenter.ne.jp/cgb/upload"
HTTPUtilityURL: ; 0x110ffc
	ascii "gameboy.datacenter.ne.jp/cgb/utility"
HTTPRankingURL: ; 0x111020
	ascii "gameboy.datacenter.ne.jp/cgb/ranking"

INCBIN "baserom.gbc", $111044, $113f84 - $111044

