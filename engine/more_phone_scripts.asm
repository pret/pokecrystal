UnknownScript_0xa0000:
	special RandomPhoneMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0013
	farscall UnknownScript_0xbe51e
	farjump UnknownScript_0xa003e

UnknownScript_0xa0013:
	farjump UnknownScript_0xa002e

UnknownScript_0xa0017:
	special RandomPhoneMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa002a
	farscall UnknownScript_0xbe5d0
	farjump UnknownScript_0xa0055

UnknownScript_0xa002a:
	farjump UnknownScript_0xa0036

UnknownScript_0xa002e:
	farscall UnknownScript_0xa007c
	farjump UnknownScript_0xa003e

UnknownScript_0xa0036:
	farscall UnknownScript_0xa0128
	farjump UnknownScript_0xa0055

UnknownScript_0xa003e:
	special Function2a51f
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0051
	farscall UnknownScript_0xa017a
	farjump UnknownScript_0xa0484

UnknownScript_0xa0051:
	farjump UnknownScript_0xa006c

UnknownScript_0xa0055:
	special Function2a51f
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xa0068
	farscall UnknownScript_0xa0226
	farjump UnknownScript_0xa053a

UnknownScript_0xa0068:
	farjump UnknownScript_0xa0074

UnknownScript_0xa006c:
	farscall UnknownScript_0xa0278
	farjump UnknownScript_0xa0484

UnknownScript_0xa0074:
	farscall UnknownScript_0xa0324
	farjump UnknownScript_0xa053a

UnknownScript_0xa007c:
	checkcode VAR_CALLERID
	if_equal $5, UnknownScript_0xa00c2
	if_equal $b, UnknownScript_0xa00c8
	if_equal $d, UnknownScript_0xa00ce
	if_equal $f, UnknownScript_0xa00d4
	if_equal $10, UnknownScript_0xa00da
	if_equal $11, UnknownScript_0xa00e0
	if_equal $13, UnknownScript_0xa00e6
	if_equal $14, UnknownScript_0xa00ec
	if_equal $17, UnknownScript_0xa00f2
	if_equal $18, UnknownScript_0xa00f8
	if_equal $1b, UnknownScript_0xa00fe
	if_equal $1c, UnknownScript_0xa0104
	if_equal $1d, UnknownScript_0xa010a
	if_equal $1e, UnknownScript_0xa0110
	if_equal $20, UnknownScript_0xa0116
	if_equal $21, UnknownScript_0xa011c
	if_equal $23, UnknownScript_0xa0122

UnknownScript_0xa00c2:
	farwritetext UnknownText_0x1740c0
	keeptextopen
	end

UnknownScript_0xa00c8:
	farwritetext UnknownText_0x174a24
	keeptextopen
	end

UnknownScript_0xa00ce:
	farwritetext UnknownText_0x174f2f
	keeptextopen
	end

UnknownScript_0xa00d4:
	farwritetext UnknownText_0x175530
	keeptextopen
	end

UnknownScript_0xa00da:
	farwritetext UnknownText_0x1757d4
	keeptextopen
	end

UnknownScript_0xa00e0:
	farwritetext UnknownText_0x175bc4
	keeptextopen
	end

UnknownScript_0xa00e6:
	farwritetext UnknownText_0x176a2f
	keeptextopen
	end

UnknownScript_0xa00ec:
	farwritetext UnknownText_0x176e5d
	keeptextopen
	end

UnknownScript_0xa00f2:
	farwritetext UnknownText_0x649dc
	keeptextopen
	end

UnknownScript_0xa00f8:
	farwritetext UnknownText_0x64cbd
	keeptextopen
	end

UnknownScript_0xa00fe:
	farwritetext UnknownText_0x65271
	keeptextopen
	end

UnknownScript_0xa0104:
	farwritetext UnknownText_0x65ab2
	keeptextopen
	end

UnknownScript_0xa010a:
	farwritetext UnknownText_0x65de4
	keeptextopen
	end

UnknownScript_0xa0110:
	farwritetext UnknownText_0x660be
	keeptextopen
	end

UnknownScript_0xa0116:
	farwritetext UnknownText_0x66980
	keeptextopen
	end

UnknownScript_0xa011c:
	farwritetext UnknownText_0x66afc
	keeptextopen
	end

UnknownScript_0xa0122:
	farwritetext UnknownText_0x66f9f
	keeptextopen
	end

UnknownScript_0xa0128:
	checkcode VAR_CALLERID
	if_equal $6, UnknownScript_0xa014a
	if_equal $c, UnknownScript_0xa0150
	if_equal $e, UnknownScript_0xa0156
	if_equal $12, UnknownScript_0xa015c
	if_equal $15, UnknownScript_0xa0162
	if_equal $1a, UnknownScript_0xa0168
	if_equal $1f, UnknownScript_0xa016e
	if_equal $24, UnknownScript_0xa0174

UnknownScript_0xa014a:
	farwritetext UnknownText_0x174688
	keeptextopen
	end

UnknownScript_0xa0150:
	farwritetext UnknownText_0x174c7f
	keeptextopen
	end

UnknownScript_0xa0156:
	farwritetext UnknownText_0x1752f5
	keeptextopen
	end

UnknownScript_0xa015c:
	farwritetext UnknownText_0x175fda
	keeptextopen
	end

UnknownScript_0xa0162:
	farwritetext UnknownText_0x1771fd
	keeptextopen
	end

UnknownScript_0xa0168:
	farwritetext UnknownText_0x64f74
	keeptextopen
	end

UnknownScript_0xa016e:
	farwritetext UnknownText_0x665ad
	keeptextopen
	end

UnknownScript_0xa0174:
	farwritetext UnknownText_0x6717a
	keeptextopen
	end

UnknownScript_0xa017a:
	checkcode VAR_CALLERID
	if_equal $5, UnknownScript_0xa01c0
	if_equal $b, UnknownScript_0xa01c6
	if_equal $d, UnknownScript_0xa01cc
	if_equal $f, UnknownScript_0xa01d2
	if_equal $10, UnknownScript_0xa01d8
	if_equal $11, UnknownScript_0xa01de
	if_equal $13, UnknownScript_0xa01e4
	if_equal $14, UnknownScript_0xa01ea
	if_equal $17, UnknownScript_0xa01f0
	if_equal $18, UnknownScript_0xa01f6
	if_equal $1b, UnknownScript_0xa01fc
	if_equal $1c, UnknownScript_0xa0202
	if_equal $1d, UnknownScript_0xa0208
	if_equal $1e, UnknownScript_0xa020e
	if_equal $20, UnknownScript_0xa0214
	if_equal $21, UnknownScript_0xa021a
	if_equal $23, UnknownScript_0xa0220

UnknownScript_0xa01c0:
	farwritetext UnknownText_0x174106
	keeptextopen
	end

UnknownScript_0xa01c6:
	farwritetext UnknownText_0x174a80
	keeptextopen
	end

UnknownScript_0xa01cc:
	farwritetext UnknownText_0x174f90
	keeptextopen
	end

UnknownScript_0xa01d2:
	farwritetext UnknownText_0x175591
	keeptextopen
	end

UnknownScript_0xa01d8:
	farwritetext UnknownText_0x175869
	keeptextopen
	end

UnknownScript_0xa01de:
	farwritetext UnknownText_0x175c24
	keeptextopen
	end

UnknownScript_0xa01e4:
	farwritetext UnknownText_0x176aef
	keeptextopen
	end

UnknownScript_0xa01ea:
	farwritetext UnknownText_0x176e9c
	keeptextopen
	end

UnknownScript_0xa01f0:
	farwritetext UnknownText_0x64a13
	keeptextopen
	end

UnknownScript_0xa01f6:
	farwritetext UnknownText_0x64cf3
	keeptextopen
	end

UnknownScript_0xa01fc:
	farwritetext UnknownText_0x65318
	keeptextopen
	end

UnknownScript_0xa0202:
	farwritetext UnknownText_0x65b29
	keeptextopen
	end

UnknownScript_0xa0208:
	farwritetext UnknownText_0x65e42
	keeptextopen
	end

UnknownScript_0xa020e:
	farwritetext UnknownText_0x6613c
	keeptextopen
	end

UnknownScript_0xa0214:
	farwritetext UnknownText_0x669b2
	keeptextopen
	end

UnknownScript_0xa021a:
	farwritetext UnknownText_0x66b3e
	keeptextopen
	end

UnknownScript_0xa0220:
	farwritetext UnknownText_0x66fc0
	keeptextopen
	end

UnknownScript_0xa0226:
	checkcode VAR_CALLERID
	if_equal $6, UnknownScript_0xa0248
	if_equal $c, UnknownScript_0xa024e
	if_equal $e, UnknownScript_0xa0254
	if_equal $12, UnknownScript_0xa025a
	if_equal $15, UnknownScript_0xa0260
	if_equal $1a, UnknownScript_0xa0266
	if_equal $1f, UnknownScript_0xa026c
	if_equal $24, UnknownScript_0xa0272

UnknownScript_0xa0248:
	farwritetext UnknownText_0x1746c3
	keeptextopen
	end

UnknownScript_0xa024e:
	farwritetext UnknownText_0x174cf6
	keeptextopen
	end

UnknownScript_0xa0254:
	farwritetext UnknownText_0x17536b
	keeptextopen
	end

UnknownScript_0xa025a:
	farwritetext UnknownText_0x17602d
	keeptextopen
	end

UnknownScript_0xa0260:
	farwritetext UnknownText_0x177237
	keeptextopen
	end

UnknownScript_0xa0266:
	farwritetext UnknownText_0x64fb2
	keeptextopen
	end

UnknownScript_0xa026c:
	farwritetext UnknownText_0x66605
	keeptextopen
	end

UnknownScript_0xa0272:
	farwritetext UnknownText_0x671a4
	keeptextopen
	end

UnknownScript_0xa0278:
	checkcode VAR_CALLERID
	if_equal $5, UnknownScript_0xa02be
	if_equal $b, UnknownScript_0xa02c4
	if_equal $d, UnknownScript_0xa02ca
	if_equal $f, UnknownScript_0xa02d0
	if_equal $10, UnknownScript_0xa02d6
	if_equal $11, UnknownScript_0xa02dc
	if_equal $13, UnknownScript_0xa02e2
	if_equal $14, UnknownScript_0xa02e8
	if_equal $17, UnknownScript_0xa02ee
	if_equal $18, UnknownScript_0xa02f4
	if_equal $1b, UnknownScript_0xa02fa
	if_equal $1c, UnknownScript_0xa0300
	if_equal $1d, UnknownScript_0xa0306
	if_equal $1e, UnknownScript_0xa030c
	if_equal $20, UnknownScript_0xa0312
	if_equal $21, UnknownScript_0xa0318
	if_equal $23, UnknownScript_0xa031e

UnknownScript_0xa02be:
	farwritetext UnknownText_0x174165
	keeptextopen
	end

UnknownScript_0xa02c4:
	farwritetext UnknownText_0x174b2d
	keeptextopen
	end

UnknownScript_0xa02ca:
	farwritetext UnknownText_0x174ffd
	keeptextopen
	end

UnknownScript_0xa02d0:
	farwritetext UnknownText_0x175611
	keeptextopen
	end

UnknownScript_0xa02d6:
	farwritetext UnknownText_0x1758e4
	keeptextopen
	end

UnknownScript_0xa02dc:
	farwritetext UnknownText_0x175c9f
	keeptextopen
	end

UnknownScript_0xa02e2:
	farwritetext UnknownText_0x176b45
	keeptextopen
	end

UnknownScript_0xa02e8:
	farwritetext UnknownText_0x176eee
	keeptextopen
	end

UnknownScript_0xa02ee:
	farwritetext UnknownText_0x64a71
	keeptextopen
	end

UnknownScript_0xa02f4:
	farwritetext UnknownText_0x64d4f
	keeptextopen
	end

UnknownScript_0xa02fa:
	farwritetext UnknownText_0x65399
	keeptextopen
	end

UnknownScript_0xa0300:
	farwritetext UnknownText_0x65bc8
	keeptextopen
	end

UnknownScript_0xa0306:
	farwritetext UnknownText_0x65eac
	keeptextopen
	end

UnknownScript_0xa030c:
	farwritetext UnknownText_0x6618c
	keeptextopen
	end

UnknownScript_0xa0312:
	farwritetext UnknownText_0x669ed
	keeptextopen
	end

UnknownScript_0xa0318:
	farwritetext UnknownText_0x66b8f
	keeptextopen
	end

UnknownScript_0xa031e:
	farwritetext UnknownText_0x67001
	keeptextopen
	end

UnknownScript_0xa0324:
	checkcode VAR_CALLERID
	if_equal $6, UnknownScript_0xa0346
	if_equal $c, UnknownScript_0xa034c
	if_equal $e, UnknownScript_0xa0352
	if_equal $12, UnknownScript_0xa0358
	if_equal $15, UnknownScript_0xa035e
	if_equal $1a, UnknownScript_0xa0364
	if_equal $1f, UnknownScript_0xa036a
	if_equal $24, UnknownScript_0xa0370

UnknownScript_0xa0346:
	farwritetext UnknownText_0x174734
	keeptextopen
	end

UnknownScript_0xa034c:
	farwritetext UnknownText_0x174d86
	keeptextopen
	end

UnknownScript_0xa0352:
	farwritetext UnknownText_0x1753c5
	keeptextopen
	end

UnknownScript_0xa0358:
	farwritetext UnknownText_0x176095
	keeptextopen
	end

UnknownScript_0xa035e:
	farwritetext UnknownText_0x177297
	keeptextopen
	end

UnknownScript_0xa0364:
	farwritetext UnknownText_0x6501c
	keeptextopen
	end

UnknownScript_0xa036a:
	farwritetext UnknownText_0x66688
	keeptextopen
	end

UnknownScript_0xa0370:
	farwritetext UnknownText_0x671eb
	keeptextopen
	end

UnknownScript_0xa0376:
	farscall UnknownScript_0xa0386
	farjump UnknownScript_0xa0484

UnknownScript_0xa037e:
	farscall UnknownScript_0xa0432
	farjump UnknownScript_0xa053a

UnknownScript_0xa0386:
	checkcode VAR_CALLERID
	if_equal $5, UnknownScript_0xa03cc
	if_equal $7, UnknownScript_0xa03d2
	if_equal $b, UnknownScript_0xa03d8
	if_equal $d, UnknownScript_0xa03de
	if_equal $f, UnknownScript_0xa03e4
	if_equal $10, UnknownScript_0xa03ea
	if_equal $11, UnknownScript_0xa03f0
	if_equal $13, UnknownScript_0xa03f6
	if_equal $14, UnknownScript_0xa03fc
	if_equal $17, UnknownScript_0xa0402
	if_equal $18, UnknownScript_0xa0408
	if_equal $1b, UnknownScript_0xa040e
	if_equal $1d, UnknownScript_0xa0414
	if_equal $1e, UnknownScript_0xa041a
	if_equal $20, UnknownScript_0xa0420
	if_equal $21, UnknownScript_0xa0426
	if_equal $23, UnknownScript_0xa042c

UnknownScript_0xa03cc:
	farwritetext UnknownText_0x1741e1
	keeptextopen
	end

UnknownScript_0xa03d2:
	farwritetext UnknownText_0x1748ea
	keeptextopen
	end

UnknownScript_0xa03d8:
	farwritetext UnknownText_0x174bc5
	keeptextopen
	end

UnknownScript_0xa03de:
	farwritetext UnknownText_0x17507d
	keeptextopen
	end

UnknownScript_0xa03e4:
	farwritetext UnknownText_0x175693
	keeptextopen
	end

UnknownScript_0xa03ea:
	farwritetext UnknownText_0x175976
	keeptextopen
	end

UnknownScript_0xa03f0:
	farwritetext UnknownText_0x175d40
	keeptextopen
	end

UnknownScript_0xa03f6:
	farwritetext UnknownText_0x176bee
	keeptextopen
	end

UnknownScript_0xa03fc:
	farwritetext UnknownText_0x176f60
	keeptextopen
	end

UnknownScript_0xa0402:
	farwritetext UnknownText_0x64ada
	keeptextopen
	end

UnknownScript_0xa0408:
	farwritetext UnknownText_0x64da4
	keeptextopen
	end

UnknownScript_0xa040e:
	farwritetext UnknownText_0x65419
	keeptextopen
	end

UnknownScript_0xa0414:
	farwritetext UnknownText_0x65f17
	keeptextopen
	end

UnknownScript_0xa041a:
	farwritetext UnknownText_0x66214
	keeptextopen
	end

UnknownScript_0xa0420:
	farwritetext UnknownText_0x66a3a
	keeptextopen
	end

UnknownScript_0xa0426:
	farwritetext UnknownText_0x66bf3
	keeptextopen
	end

UnknownScript_0xa042c:
	farwritetext UnknownText_0x67096
	keeptextopen
	end

UnknownScript_0xa0432:
	checkcode VAR_CALLERID
	if_equal $c, UnknownScript_0xa0450
	if_equal $e, UnknownScript_0xa0456
	if_equal $12, UnknownScript_0xa045c
	if_equal $15, UnknownScript_0xa0462
	if_equal $1a, UnknownScript_0xa0468
	if_equal $1f, UnknownScript_0xa046e
	if_equal $24, UnknownScript_0xa0474

UnknownScript_0xa0450:
	farwritetext UnknownText_0x174e4e
	keeptextopen
	end

UnknownScript_0xa0456:
	farwritetext UnknownText_0x17543a
	keeptextopen
	end

UnknownScript_0xa045c:
	farwritetext UnknownText_0x17610a
	keeptextopen
	end

UnknownScript_0xa0462:
	farwritetext UnknownText_0x1772e2
	keeptextopen
	end

UnknownScript_0xa0468:
	farwritetext UnknownText_0x65091
	keeptextopen
	end

UnknownScript_0xa046e:
	farwritetext UnknownText_0x66730
	keeptextopen
	end

UnknownScript_0xa0474:
	farwritetext UnknownText_0x6722e
	keeptextopen
	end

UnknownScript_0xa047a:
	farwritetext UnknownText_0x1761a7
	end

UnknownScript_0xa047f:
	farwritetext UnknownText_0x66796
	end

UnknownScript_0xa0484:
	checkcode VAR_CALLERID
	if_equal $5, UnknownScript_0xa04d6
	if_equal $7, UnknownScript_0xa04db
	if_equal $b, UnknownScript_0xa04e0
	if_equal $d, UnknownScript_0xa04e5
	if_equal $f, UnknownScript_0xa04ea
	if_equal $10, UnknownScript_0xa04ef
	if_equal $11, UnknownScript_0xa04f4
	if_equal $13, UnknownScript_0xa04f9
	if_equal $14, UnknownScript_0xa04fe
	if_equal $16, UnknownScript_0xa0503
	if_equal $17, UnknownScript_0xa0508
	if_equal $18, UnknownScript_0xa050d
	if_equal $1b, UnknownScript_0xa0512
	if_equal $1c, UnknownScript_0xa0517
	if_equal $1d, UnknownScript_0xa051c
	if_equal $1e, UnknownScript_0xa0521
	if_equal $20, UnknownScript_0xa0526
	if_equal $21, UnknownScript_0xa052b
	if_equal $22, UnknownScript_0xa0530
	if_equal $23, UnknownScript_0xa0535

UnknownScript_0xa04d6:
	farwritetext UnknownText_0x174251
	end

UnknownScript_0xa04db:
	farwritetext UnknownText_0x174962
	end

UnknownScript_0xa04e0:
	farwritetext UnknownText_0x174c0e
	end

UnknownScript_0xa04e5:
	farwritetext UnknownText_0x175106
	end

UnknownScript_0xa04ea:
	farwritetext UnknownText_0x17570a
	end

UnknownScript_0xa04ef:
	farwritetext UnknownText_0x1759e7
	end

UnknownScript_0xa04f4:
	farwritetext UnknownText_0x175db7
	end

UnknownScript_0xa04f9:
	farwritetext UnknownText_0x176c47
	end

UnknownScript_0xa04fe:
	farwritetext UnknownText_0x176fdb
	end

UnknownScript_0xa0503:
	farwritetext UnknownText_0x64000
	end

UnknownScript_0xa0508:
	farwritetext UnknownText_0x64b48
	end

UnknownScript_0xa050d:
	farwritetext UnknownText_0x64e1f
	end

UnknownScript_0xa0512:
	farwritetext UnknownText_0x65471
	end

UnknownScript_0xa0517:
	farwritetext UnknownText_0x65c4e
	end

UnknownScript_0xa051c:
	farwritetext UnknownText_0x65f6e
	end

UnknownScript_0xa0521:
	farwritetext UnknownText_0x662a9
	end

UnknownScript_0xa0526:
	farwritetext UnknownText_0x66a93
	end

UnknownScript_0xa052b:
	farwritetext UnknownText_0x66c58
	end

UnknownScript_0xa0530:
	farwritetext UnknownText_0x66dab
	end

UnknownScript_0xa0535:
	farwritetext UnknownText_0x670eb
	end

UnknownScript_0xa053a:
	checkcode VAR_CALLERID
	if_equal $6, UnknownScript_0xa055c
	if_equal $c, UnknownScript_0xa0561
	if_equal $e, UnknownScript_0xa0566
	if_equal $12, UnknownScript_0xa056b
	if_equal $15, UnknownScript_0xa0570
	if_equal $1a, UnknownScript_0xa0575
	if_equal $1f, UnknownScript_0xa057a
	if_equal $24, UnknownScript_0xa057f

UnknownScript_0xa055c:
	farwritetext UnknownText_0x1747ac
	end

UnknownScript_0xa0561:
	farwritetext UnknownText_0x174eb7
	end

UnknownScript_0xa0566:
	farwritetext UnknownText_0x175488
	end

UnknownScript_0xa056b:
	farwritetext UnknownText_0x17620a
	end

UnknownScript_0xa0570:
	farwritetext UnknownText_0x177361
	end

UnknownScript_0xa0575:
	farwritetext UnknownText_0x650e2
	end

UnknownScript_0xa057a:
	farwritetext UnknownText_0x667f7
	end

UnknownScript_0xa057f:
	farwritetext UnknownText_0x67281
	end

UnknownScript_0xa0584:
	scall UnknownScript_0xa05a0
	iffalse UnknownScript_0xa058e
	farjump UnknownScript_0xa0000

UnknownScript_0xa058e:
	farjump UnknownScript_0xa0484

UnknownScript_0xa0592:
	scall UnknownScript_0xa05a0
	iffalse UnknownScript_0xa059c
	farjump UnknownScript_0xa0017

UnknownScript_0xa059c:
	farjump UnknownScript_0xa053a

UnknownScript_0xa05a0:
	special Function2a4ab
	end

UnknownScript_0xa05a4:
	checkcode VAR_CALLERID
	if_equal $10, UnknownScript_0xa05ae
	if_equal $1c, UnknownScript_0xa05b6

UnknownScript_0xa05ae:
	farwritetext UnknownText_0x1759f7
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05b6:
	farwritetext UnknownText_0x65c66
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05be:
	farwritetext UnknownText_0x64032
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05c6:
	farwritetext UnknownText_0x177378
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa05ce:
	farwritetext UnknownText_0x64b5f
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05d6:
	farwritetext UnknownText_0x175dd9
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05de:
	farwritetext UnknownText_0x176c61
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa05e6:
	checkcode VAR_CALLERID
	if_equal $d, UnknownScript_0xa0600
	if_equal $10, UnknownScript_0xa0605
	if_equal $18, UnknownScript_0xa060a
	if_equal $1c, UnknownScript_0xa060f
	if_equal $1d, UnknownScript_0xa0614
	if_equal $21, UnknownScript_0xa0619

UnknownScript_0xa0600:
	farwritetext UnknownText_0x175116
	end

UnknownScript_0xa0605:
	farwritetext UnknownText_0x175a60
	end

UnknownScript_0xa060a:
	farwritetext UnknownText_0x64e2f
	end

UnknownScript_0xa060f:
	farwritetext UnknownText_0x65cf9
	end

UnknownScript_0xa0614:
	farwritetext UnknownText_0x65f88
	end

UnknownScript_0xa0619:
	farwritetext UnknownText_0x66c6b
	end

UnknownScript_0xa061e:
	checkcode VAR_CALLERID
	if_equal $6, UnknownScript_0xa0630
	if_equal $15, UnknownScript_0xa0635
	if_equal $1a, UnknownScript_0xa063a
	if_equal $1f, UnknownScript_0xa063f

UnknownScript_0xa0630:
	farwritetext UnknownText_0x1747cc
	end

UnknownScript_0xa0635:
	farwritetext UnknownText_0x1773e7
	end

UnknownScript_0xa063a:
	farwritetext UnknownText_0x650ec
	end

UnknownScript_0xa063f:
	farwritetext UnknownText_0x66801
	end

UnknownScript_0xa0644:
	farwritetext UnknownText_0x176feb
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa064c:
	farwritetext UnknownText_0x66dc5
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0654:
	random $b
	if_equal $0, UnknownScript_0xa0682
	if_equal $1, UnknownScript_0xa068a
	if_equal $2, UnknownScript_0xa0692
	if_equal $3, UnknownScript_0xa069a
	if_equal $4, UnknownScript_0xa06a2
	if_equal $5, UnknownScript_0xa06aa
	if_equal $6, UnknownScript_0xa06b2
	if_equal $7, UnknownScript_0xa06ba
	if_equal $8, UnknownScript_0xa06c2
	if_equal $9, UnknownScript_0xa06ca
	if_equal $a, UnknownScript_0xa06d2

UnknownScript_0xa0682:
	farwritetext UnknownText_0x174261
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa068a:
	farwritetext UnknownText_0x17429d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0692:
	farwritetext UnknownText_0x1742ee
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa069a:
	farwritetext UnknownText_0x174340
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06a2:
	farwritetext UnknownText_0x174391
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06aa:
	farwritetext UnknownText_0x1743e3
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06b2:
	farwritetext UnknownText_0x174433
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06ba:
	farwritetext UnknownText_0x174485
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06c2:
	farwritetext UnknownText_0x1744d6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06ca:
	farwritetext UnknownText_0x174522
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06d2:
	farwritetext UnknownText_0x174571
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa06da:
	random $a
	if_equal $0, UnknownScript_0xa0704
	if_equal $1, UnknownScript_0xa070c
	if_equal $2, UnknownScript_0xa0714
	if_equal $3, UnknownScript_0xa071c
	if_equal $4, UnknownScript_0xa0724
	if_equal $5, UnknownScript_0xa072c
	if_equal $6, UnknownScript_0xa0734
	if_equal $7, UnknownScript_0xa073c
	if_equal $8, UnknownScript_0xa0744
	if_equal $9, UnknownScript_0xa074c

UnknownScript_0xa0704:
	farwritetext UnknownText_0x176223
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa070c:
	farwritetext UnknownText_0x1762c3
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0714:
	farwritetext UnknownText_0x17638a
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa071c:
	farwritetext UnknownText_0x176424
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0724:
	farwritetext UnknownText_0x1764eb
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa072c:
	farwritetext UnknownText_0x176599
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0734:
	farwritetext UnknownText_0x1766ac
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa073c:
	farwritetext UnknownText_0x17674f
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0744:
	farwritetext UnknownText_0x176816
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa074c:
	farwritetext UnknownText_0x17686d
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0754:
	random $a
	if_equal $0, UnknownScript_0xa077e
	if_equal $1, UnknownScript_0xa0786
	if_equal $2, UnknownScript_0xa078e
	if_equal $3, UnknownScript_0xa0796
	if_equal $4, UnknownScript_0xa079e
	if_equal $5, UnknownScript_0xa07a6
	if_equal $6, UnknownScript_0xa07ae
	if_equal $7, UnknownScript_0xa07b6
	if_equal $8, UnknownScript_0xa07be
	if_equal $9, UnknownScript_0xa07c6

UnknownScript_0xa077e:
	farwritetext UnknownText_0x65481
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0786:
	farwritetext UnknownText_0x654ea
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa078e:
	farwritetext UnknownText_0x65555
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0796:
	farwritetext UnknownText_0x655c7
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa079e:
	farwritetext UnknownText_0x65628
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07a6:
	farwritetext UnknownText_0x6569b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07ae:
	farwritetext UnknownText_0x6574a
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07b6:
	farwritetext UnknownText_0x65810
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07be:
	farwritetext UnknownText_0x658c6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07c6:
	farwritetext UnknownText_0x65969
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa07ce:
	random $a
	if_equal $0, UnknownScript_0xa07f8
	if_equal $1, UnknownScript_0xa0800
	if_equal $2, UnknownScript_0xa0808
	if_equal $3, UnknownScript_0xa0810
	if_equal $4, UnknownScript_0xa0818
	if_equal $5, UnknownScript_0xa0820
	if_equal $6, UnknownScript_0xa0828
	if_equal $7, UnknownScript_0xa0830
	if_equal $8, UnknownScript_0xa0838
	if_equal $9, UnknownScript_0xa0840

UnknownScript_0xa07f8:
	farwritetext UnknownText_0x662bc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0800:
	farwritetext UnknownText_0x662fc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0808:
	farwritetext UnknownText_0x66335
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0810:
	farwritetext UnknownText_0x66366
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0818:
	farwritetext UnknownText_0x663a1
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0820:
	farwritetext UnknownText_0x663e6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0828:
	farwritetext UnknownText_0x66421
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0830:
	farwritetext UnknownText_0x6645f
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0838:
	farwritetext UnknownText_0x6649b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0840:
	farwritetext UnknownText_0x664dd
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0848:
	checkevent EVENT_OPENED_MT_SILVER
	iftrue UnknownScript_0xa08e0
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0xa08d8
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue UnknownScript_0xa08d0
	checkflag ENGINE_MARSHBADGE
	iftrue UnknownScript_0xa08f0
	checkflag ENGINE_FLYPOINT_VERMILION
	iftrue UnknownScript_0xa08c8
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0xa08c0
	checkflag ENGINE_RISINGBADGE
	iftrue UnknownScript_0xa08b8
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0xa08b0
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0xa08a8
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0xa08a0
	checkflag ENGINE_FOGBADGE
	iftrue UnknownScript_0xa08e8
	checkflag ENGINE_PLAINBADGE
	iftrue UnknownScript_0xa0898
	farwritetext UnknownText_0x646a3
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0898:
	farwritetext UnknownText_0x64099
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08a0:
	farwritetext UnknownText_0x640e6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08a8:
	farwritetext UnknownText_0x6416d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08b0:
	farwritetext UnknownText_0x641e8
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08b8:
	farwritetext UnknownText_0x64247
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08c0:
	farwritetext UnknownText_0x642bb
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08c8:
	farwritetext UnknownText_0x643d4
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08d0:
	farwritetext UnknownText_0x64448
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08d8:
	farwritetext UnknownText_0x6455b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08e0:
	farwritetext UnknownText_0x645ff
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08e8:
	farwritetext UnknownText_0x646df
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08f0:
	farwritetext UnknownText_0x647d8
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa08f8:
	farwritetext UnknownText_0x1745c2
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0900:
	farwritetext UnknownText_0x17485b
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0908:
	farwritetext UnknownText_0x17496b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0910:
	farwritetext UnknownText_0x174c29
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0918:
	farwritetext UnknownText_0x174ec5
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0920:
	farwritetext UnknownText_0x17519b
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0928:
	farwritetext UnknownText_0x17549b
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0930:
	farwritetext UnknownText_0x17571d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0938:
	farwritetext UnknownText_0x175abe
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0940:
	farwritetext UnknownText_0x175eaf
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0948:
	farwritetext UnknownText_0x1768b0
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0950:
	farwritetext UnknownText_0x176d32
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0958:
	farwritetext UnknownText_0x1770fb
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0960:
	farwritetext UnknownText_0x177465
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0968:
	farwritetext UnknownText_0x64bc6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0970:
	farwritetext UnknownText_0x64e90
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0978:
	farwritetext UnknownText_0x65161
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0980:
	farwritetext UnknownText_0x65a23
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0988:
	farwritetext UnknownText_0x65d5c
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0990:
	farwritetext UnknownText_0x65ff2
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0998:
	farwritetext UnknownText_0x6651e
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09a0:
	farwritetext UnknownText_0x66882
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa09a8:
	farwritetext UnknownText_0x66aa5
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09b0:
	farwritetext UnknownText_0x66ca7
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09b8:
	farwritetext UnknownText_0x67106
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09c0:
	farwritetext UnknownText_0x67294
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa09c8:
	random $3
	if_equal $0, UnknownScript_0xa09d6
	if_equal $1, UnknownScript_0xa09de
	if_equal $2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	farwritetext UnknownText_0x64846
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09de:
	farwritetext UnknownText_0x64881
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09e6:
	farwritetext UnknownText_0x648dc
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa09ee:
	checkcode VAR_KENJI_BREAK
	if_equal $2, UnknownScript_0xa0a00
	if_equal $1, UnknownScript_0xa0a08
	farwritetext UnknownText_0x66e17
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a00:
	farwritetext UnknownText_0x66e67
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a08:
	checkmorn
	iftrue UnknownScript_0xa0a1d
	checknite
	iftrue UnknownScript_0xa0a25
	setevent EVENT_KENJI_ON_BREAK
	farwritetext UnknownText_0x66f11
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a1d:
	farwritetext UnknownText_0x66ed3
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a25:
	farwritetext UnknownText_0x66f52
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0a2d:
	farwritetext UnknownText_0x174638
	end

UnknownScript_0xa0a32:
	farwritetext UnknownText_0x1749c7
	end

UnknownScript_0xa0a37:
	farwritetext UnknownText_0x174c49
	end

UnknownScript_0xa0a3c:
	farwritetext UnknownText_0x174ee2
	end

UnknownScript_0xa0a41:
	farwritetext UnknownText_0x17520a
	end

UnknownScript_0xa0a46:
	farwritetext UnknownText_0x1754e5
	end

UnknownScript_0xa0a4b:
	farwritetext UnknownText_0x175786
	end

UnknownScript_0xa0a50:
	farwritetext UnknownText_0x175b1e
	end

UnknownScript_0xa0a55:
	farwritetext UnknownText_0x175f11
	end

UnknownScript_0xa0a5a:
	farwritetext UnknownText_0x1769da
	end

UnknownScript_0xa0a5f:
	farwritetext UnknownText_0x176d85
	end

UnknownScript_0xa0a64:
	farwritetext UnknownText_0x177138
	end

UnknownScript_0xa0a69:
	farwritetext UnknownText_0x1774c1
	end

UnknownScript_0xa0a6e:
	farwritetext UnknownText_0x64c13
	end

UnknownScript_0xa0a73:
	farwritetext UnknownText_0x64ed4
	end

UnknownScript_0xa0a78:
	farwritetext UnknownText_0x651bf
	end

UnknownScript_0xa0a7d:
	farwritetext UnknownText_0x65a63
	end

UnknownScript_0xa0a82:
	farwritetext UnknownText_0x66043
	end

UnknownScript_0xa0a87:
	farwritetext UnknownText_0x66579
	end

UnknownScript_0xa0a8c:
	farwritetext UnknownText_0x668a3
	end

UnknownScript_0xa0a91:
	farwritetext UnknownText_0x66ad1
	end

UnknownScript_0xa0a96:
	farwritetext UnknownText_0x66cf7
	end

UnknownScript_0xa0a9b:
	farwritetext UnknownText_0x6712a
	end

UnknownScript_0xa0aa0:
	farwritetext UnknownText_0x672d5
	end

UnknownScript_0xa0aa5:
	farwritetext UnknownText_0x174895
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0aad:
	farwritetext UnknownText_0x17529c
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0ab5:
	farwritetext UnknownText_0x175b6d
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0abd:
	farwritetext UnknownText_0x17750e
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0ac5:
	farwritetext UnknownText_0x64f1a
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0acd:
	farwritetext UnknownText_0x6520f
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0ad5:
	farwritetext UnknownText_0x65da6
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0add:
	farwritetext UnknownText_0x66087
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0ae5:
	farwritetext UnknownText_0x6691d
	keeptextopen
	jump UnknownScript_0xa053a

UnknownScript_0xa0aed:
	farwritetext UnknownText_0x66d45
	keeptextopen
	jump UnknownScript_0xa0484

UnknownScript_0xa0af5:
	farwritetext UnknownText_0x175f70
	end

UnknownScript_0xa0afa:
	farwritetext UnknownText_0x176dd1
	end

UnknownScript_0xa0aff:
	farwritetext UnknownText_0x64c5a
	end

UnknownScript_0xa0b04:
	farwritetext UnknownText_0x17717c
	end

UnknownScript_0xa0b09:
	farwritetext UnknownText_0x174000
	clearflag ENGINE_BIKE_SHOP_CALL_ENABLED
	specialphonecall ELMCALL_NONE
	end
