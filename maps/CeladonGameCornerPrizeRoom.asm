DEF CELADONGAMECORNERPRIZEROOM_TM32_COINS     	EQU 1500
DEF CELADONGAMECORNERPRIZEROOM_TM30_COINS     	EQU 3500
DEF CELADONGAMECORNERPRIZEROOM_TM15_COINS     	EQU 7500
DEF CELADONGAMECORNERPRIZEROOM_BLAST_COINS      EQU 5500
DEF CELADONGAMECORNERPRIZEROOM_PORYGON_COINS  	EQU 3333
DEF CELADONGAMECORNERPRIZEROOM_BULBASAUR_COINS  EQU 4444
DEF CELADONGAMECORNERPRIZEROOM_CHARMANDER_COINS EQU 4444
DEF CELADONGAMECORNERPRIZEROOM_SQUIRTLE_COINS  	EQU 4444
DEF CELADONGAMECORNERPRIZEROOM_OMANYTE_COINS  	EQU 5555
DEF CELADONGAMECORNERPRIZEROOM_KABUTO_COINS  	EQU 5555

	object_const_def
	const CELADONGAMECORNERPRIZEROOM_GENTLEMAN
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST

CeladonGameCornerPrizeRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerPrizeRoomGentlemanScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomGentlemanText

CeladonGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPharmacistText

CeladonGameCornerPrizeRoomTMVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
	writetext CeladonPrizeRoom_AskWhichPrizeText
CeladonPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu CeladonPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .DoubleTeam
	ifequal 2, .Shadow_Ball
	ifequal 3, .HyperBeam
	ifequal 4, .Thunder
	ifequal 5, .Blizzard
	ifequal 6, .FireBlast
	sjump CeladonPrizeRoom_CancelPurchaseScript

.DoubleTeam:
	checkitem TM_DOUBLE_TEAM
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_DOUBLE_TEAM
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_DOUBLE_TEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	sjump CeladonPrizeRoom_purchased

.Shadow_Ball:
	checkitem TM_SHADOW_BALL
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM30_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_SHADOW_BALL
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_SHADOW_BALL
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM30_COINS
	sjump CeladonPrizeRoom_purchased

.HyperBeam:
	checkitem TM_HYPER_BEAM
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM15_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_HYPER_BEAM
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_HYPER_BEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM15_COINS
	sjump CeladonPrizeRoom_purchased

.Thunder:
	checkitem TM_THUNDER
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	sjump CeladonPrizeRoom_purchased

.Blizzard:
	checkitem TM_BLIZZARD
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	sjump CeladonPrizeRoom_purchased

.FireBlast:
	checkitem TM_FIRE_BLAST
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_BLAST_COINS
	sjump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	sjump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_alreadyhavetm:
	writetext CeladonPrizeRoom_AlreadyHaveTMText
	waitbutton
	sjump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_CancelPurchaseScript:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "DOUBLE TEAM  {d:CELADONGAMECORNERPRIZEROOM_TM32_COINS}@"
	db "HYPER BEAM   {d:CELADONGAMECORNERPRIZEROOM_TM30_COINS}@"
	db "SHADOW BALL  {d:CELADONGAMECORNERPRIZEROOM_TM15_COINS}@"
	db "THUNDER      {d:CELADONGAMECORNERPRIZEROOM_BLAST_COINS}@"
	db "BLIZZARD     {d:CELADONGAMECORNERPRIZEROOM_BLAST_COINS}@"
	db "FIRE BLAST   {d:CELADONGAMECORNERPRIZEROOM_BLAST_COINS}@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomPokemonVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
	writetext CeladonPrizeRoom_AskWhichPrizeText
.loop
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Porygon
	ifequal 2, .Bulbasaur
	ifequal 3, .Charmander
	ifequal 4, .Squirtle
	ifequal 5, .Omanyte
	ifequal 6, .Kabuto
	sjump CeladonPrizeRoom_CancelPurchaseScript

.Porygon:
	checkcoins CELADONGAMECORNERPRIZEROOM_PORYGON_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, PORYGON
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 36
	takecoins CELADONGAMECORNERPRIZEROOM_PORYGON_COINS
	sjump .loop

.Bulbasaur:
	checkcoins CELADONGAMECORNERPRIZEROOM_BULBASAUR_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, BULBASAUR
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval BULBASAUR
	special GameCornerPrizeMonCheckDex
	givepoke BULBASAUR, 5
	takecoins CELADONGAMECORNERPRIZEROOM_BULBASAUR_COINS
	sjump .loop

.Charmander:
	checkcoins CELADONGAMECORNERPRIZEROOM_CHARMANDER_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, CHARMANDER
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval CHARMANDER
	special GameCornerPrizeMonCheckDex
	givepoke CHARMANDER, 5
	takecoins CELADONGAMECORNERPRIZEROOM_CHARMANDER_COINS
	sjump .loop

.Squirtle:
	checkcoins CELADONGAMECORNERPRIZEROOM_SQUIRTLE_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, SQUIRTLE
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval SQUIRTLE
	special GameCornerPrizeMonCheckDex
	givepoke SQUIRTLE, 5
	takecoins CELADONGAMECORNERPRIZEROOM_SQUIRTLE_COINS
	sjump .loop

.Omanyte:
	checkcoins CELADONGAMECORNERPRIZEROOM_OMANYTE_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, OMANYTE
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval OMANYTE
	special GameCornerPrizeMonCheckDex
	givepoke OMANYTE, 30
	takecoins CELADONGAMECORNERPRIZEROOM_OMANYTE_COINS
	sjump .loop

.Kabuto:
	checkcoins CELADONGAMECORNERPRIZEROOM_KABUTO_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, KABUTO
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval KABUTO
	special GameCornerPrizeMonCheckDex
	givepoke KABUTO, 30
	takecoins CELADONGAMECORNERPRIZEROOM_KABUTO_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; itemss
	db "PORYGON      {d:CELADONGAMECORNERPRIZEROOM_PORYGON_COINS}@"
	db "BULBASAUR    {d:CELADONGAMECORNERPRIZEROOM_BULBASAUR_COINS}@"
	db "CHARMANDER   {d:CELADONGAMECORNERPRIZEROOM_CHARMANDER_COINS}@"
	db "SQUIRTLE     {d:CELADONGAMECORNERPRIZEROOM_SQUIRTLE_COINS}@"
	db "OMANYTE      {d:CELADONGAMECORNERPRIZEROOM_OMANYTE_COINS}@"
	db "KABUTO       {d:CELADONGAMECORNERPRIZEROOM_KABUTO_COINS}@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomGentlemanText:
	text "I wanted PORYGON,"
	line "but I was short by"
	cont "100 coins…"
	done

CeladonGameCornerPrizeRoomPharmacistText:
if DEF(_CRYSTAL_AU)
	text "I don't want to"
	line "lose my coins."
	done
else
	text "Whew…"

	para "I've got to stay"
	line "calm and cool…"

	para "I can't lose my"
	line "cool, or I'll lose"
	cont "all my money…"
	done
endc

CeladonPrizeRoom_PrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text "OK, so you wanted"
	line "a @"
	text_ram wStringBuffer3
	text "?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "Here you go!"
	done

CeladonPrizeRoom_AlreadyHaveTMText:
	text "You already have"
	line "that TM."
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "You have no room"
	line "for it."
	done

CeladonPrizeRoom_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

CeladonGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, CELADON_CITY, 7
	warp_event  3,  5, CELADON_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomTMVendor
	bg_event  4,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomPokemonVendor

	def_object_events
	object_event  0,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomGentlemanScript, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPharmacistScript, -1
