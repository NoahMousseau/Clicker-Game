extends Control

func _ready():
	$GameControl/GameCamera.make_current()
	GlobalScript.cashString = "%.2f" % GlobalScript.cashValue
	$GameControl/CashDisplay/MoneyLabel.text = "$" + GlobalScript.cashString
	$ShopControl/ShopCashDisplay/ShopMoneyLabel.text = "$" + GlobalScript.cashString

#Implementation for closing notification box
func _on_notification_button_pressed():
	GlobalScript.notificationBoxShowing = true
	$GameControl/MainNotificationPanel.hide()
	#Blacksmith popup cannot show after this
	if GlobalScript.blackSmithPing == true:
		GlobalScript.blacksmithPopupShown = true
		GlobalScript.notificationBoxShowing = false
	#Printing press popup cannot show after this
	if GlobalScript.printingPressPing == true:
		GlobalScript.printingPressPopupShown = true
		GlobalScript.notificationBoxShowing = false
	#Tailor popup cannot show after this
	if GlobalScript.tailorPing == true:
		GlobalScript.tailorPopupShown = true
		GlobalScript.notificationBoxShowing = false
	#Stock market popup cannot show after this
	if GlobalScript.stockMarketPing == true:
		GlobalScript.stockPopupShown = true
		GlobalScript.notificationBoxShowing = false
	#Stock market info popup cannot show after this
	if GlobalScript.stockMarketInfoPing == true:
		GlobalScript.stockMarketInfoPopupShown = true
		GlobalScript.notificationBoxShowing = false

var updateTimer = 0

func _process(delta):
	updateTimer += delta
	#Updates cashValue across multiple panels every second
	if (updateTimer >= 1):
		if (GlobalScript.stockMarketPing == false):
			GlobalScript.cashValue += GlobalScript.constCashGain
			updateTimer = 0
	#Updates game info once stock market has been accessed
	if (GlobalScript.stockMarketPing == true):
		if (GlobalScript.shopMarketEditPing == false):
			$ShopControl/PurchaseBlacksmith.hide()
			$ShopControl/PurchasePrintingPress.hide()
			$ShopControl/PurchaseTailor.hide()
			$ShopControl/BlacksmithCashGain.show()
			$ShopControl/PrintingPressCashGain.show()
			$ShopControl/TailorCashGain.show()
			GlobalScript.shopMarketEditPing = true
	GlobalScript.cashString = "%.2f" % GlobalScript.cashValue
	$GameControl/CashDisplay/MoneyLabel.text = "$" + GlobalScript.cashString
	$ShopControl/ShopCashDisplay/ShopMoneyLabel.text = "$" + GlobalScript.cashString
	$StockMarketControl/CashDisplay/MoneyLabel.text = "$" + GlobalScript.cashString
	
	#Delta section for showing shop buttons and notification popups
	if GlobalScript.cashValue >= 5:
		if GlobalScript.notificationBoxShowing == false:
			if GlobalScript.blacksmithPopupShown == false:
				$GameControl/MainNotificationPanel/MainNotificationLabel.text = "You are now able to purchase blacksmiths, they cost $5."
				$GameControl/MainNotificationPanel.show()
				$ShopControl/PurchaseBlacksmith.show()
				GlobalScript.blackSmithPing = true
	if GlobalScript.cashValue >= 50:
		if GlobalScript.notificationBoxShowing == false:
			if GlobalScript.printingPressPopupShown == false:
				$GameControl/MainNotificationPanel/MainNotificationLabel.text = "You are now able to purchase printing presses, they cost $50."
				$GameControl/MainNotificationPanel.show()
				$ShopControl/PurchasePrintingPress.show()
				GlobalScript.printingPressPing = true
	if GlobalScript.cashValue >= 100:
		if GlobalScript.notificationBoxShowing == false:
			if GlobalScript.tailorPopupShown == false:
				$GameControl/MainNotificationPanel/MainNotificationLabel.text = "You are now able to purchase tailors, they cost $100."
				$GameControl/MainNotificationPanel.show()
				$ShopControl/PurchaseTailor.show()
				GlobalScript.tailorPing = true
	
	#If statement to detect if player has enough cash to access stock market
	if GlobalScript.cashValue >= 1000:
		if GlobalScript.notificationBoxShowing == false:
			if GlobalScript.stockPopupShown == false:
				$GameControl/MainNotificationPanel/MainNotificationLabel.text = "You now have enough cash to access and purchase stocks in the stock market. This occasion has changed the game. Check the stocks page for more information."
				$GameControl/MainNotificationPanel.show()
				$GameControl/GoToStockMarket.show()
				$ShopControl/GoToStockMarket.show()
				GlobalScript.stockMarketPing = true

func _on_go_to_shop_menu_pressed():
	$ShopControl/ShopCamera.make_current()

func _on_go_to_main_game_menu_pressed():
	$GameControl/GameCamera.make_current()

func _on_go_to_game_menu_pressed():
	$GameControl/GameCamera.make_current()

func _on_go_to_stock_market_pressed():
	$StockMarketControl/StockMarketCamera.make_current()

func _on_corvus_go_to_button_pressed():
	$GroupStocks/Stock1/Stock1Camera.make_current()

func _on_arbel_go_to_button_pressed():
	$GroupStocks/Stock2/Stock2Camera.make_current()

func _on_charnel_go_to_button_pressed():
	$GroupStocks/Stock3/Stock3Camera.make_current()

func _on_ebkal_go_to_button_pressed():
	$GroupStocks/Stock4/Stock4Camera.make_current()

func _on_girnn_go_to_button_pressed():
	$GroupStocks/Stock5/Stock5Camera.make_current()

func _on_blacksmith_cash_gain_pressed():
	GlobalScript.cashValue += 10

func _on_printing_press_cash_gain_pressed():
	GlobalScript.cashValue += 20

func _on_tailor_cash_gain_pressed():
	GlobalScript.cashValue += 40
