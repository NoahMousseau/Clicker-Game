extends Control

#Function to update amount of stock owned for stock market control node
func stockAmountDisplayUpdate():
	$Stock1Panel/CorvusAmountOwnedStockMarketUpdateDisplay.text = str(GlobalScript.corvusAmountOwned)
	$Stock2Panel/ArbelAmountOwnedStockMarketUpdateDisplay.text = str(GlobalScript.arbelAmountOwned)
	$Stock3Panel/CharnelAmountOwnedStockMarketUpdateDisplay.text = str(GlobalScript.charnelAmountOwned)
	$Stock4Panel/EbkalAmountOwnedStockMarketUpdateDisplay.text = str(GlobalScript.ebkalAmountOwned)
	$Stock5Panel/GirnnAmountOwnedStockMarketUpdateDisplay.text = str(GlobalScript.girnnAmountOwned)

#Function to update stock values on displays in StockMarketControl control node
func stockMarketControlDisplayUpdate():
	var corvusStockText = "%.2f" % GlobalScript.corvusValue
	var arbelStockText = "%.2f" % GlobalScript.arbelValue
	var charnelStockText = "%.2f" % GlobalScript.charnelValue
	var ebkalStockText = "%.2f" % GlobalScript.ebkalValue
	var girnnStockText = "%.2f" % GlobalScript.girnnValue
	$Stock1Panel/CorvusCurrentPriceDisplayLabel.text = "$" + corvusStockText
	$Stock2Panel/ArbelCurrentPriceDisplayLabel.text = "$" + arbelStockText
	$Stock3Panel/CharnelCurrentPriceDisplayLabel.text = "$" + charnelStockText
	$Stock4Panel/EbkalCurrentPriceDisplayLabel.text = "$" + ebkalStockText
	$Stock5Panel/GirnnCurrentPriceDisplayLabel.text = "$" + girnnStockText

# Called when the node enters the scene tree for the first time.
func _ready():
	stockMarketControlDisplayUpdate()
	stockAmountDisplayUpdate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stockMarketControlDisplayUpdate()
	stockAmountDisplayUpdate()
	
	#Sets prices of stockPriceIndex array and amount of stockAmountIndex array
	GlobalScript.stockPriceIndex = [GlobalScript.corvusValue, GlobalScript.arbelValue, GlobalScript.charnelValue, GlobalScript.ebkalValue, GlobalScript.girnnValue,]
	GlobalScript.stockAmountIndex = [GlobalScript.corvusAmountOwned, GlobalScript.arbelAmountOwned, GlobalScript.charnelAmountOwned, GlobalScript.ebkalAmountOwned, GlobalScript.girnnAmountOwned]
	
	if (GlobalScript.stockMarketNotificationBoxShowing == false):
		if (GlobalScript.stockMarketInfoPopupShown == false):
			GlobalScript.stockMarketNotificationBoxShowing = true
			$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = "You no longer gain passive income. You must invest in the stock market in order to make money."
			$StockMarketNotificationDisplayPanel.show()
			GlobalScript.stockMarketInfoPing = true
	if (GlobalScript.eventActive == 1):
		print(GlobalScript.randomEventsArr[GlobalScript.randomEventChoose - 1])
		match(GlobalScript.randomEventsArr[GlobalScript.randomEventChoose - 1]):
			1: #Hard economy crash event
				if (GlobalScript.eventHardEconCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventHardEconCrashText
					GlobalScript.eventHardEconCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			2: #Soft economy boom event
				if (GlobalScript.eventHardEconBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventHardEconBoomText
					GlobalScript.eventHardEconBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			3: #Corvus boom event
				if (GlobalScript.eventCorvusBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventCorvusBoomText
					GlobalScript.eventCorvusBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			4: #Corvus crash event
				if (GlobalScript.eventCorvusCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventCorvusCrashText
					GlobalScript.eventCorvusCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			5: #Arbel boom event
				if (GlobalScript.eventArbelBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventArbelBoomText
					GlobalScript.eventArbelBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			6: #Arbel crash event
				if (GlobalScript.eventArbelCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventArbelCrashText
					GlobalScript.eventArbelCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			7: #Charnel boom event
				if (GlobalScript.eventCharnelBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventCharnelBoomText
					GlobalScript.eventCharnelBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			8: #Charnel crash event
				if (GlobalScript.eventCharnelCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventCharnelCrashText
					GlobalScript.eventCharnelCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			9: #Ebkal boom event
				if (GlobalScript.eventEbkalBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventEbkalBoomText
					GlobalScript.eventEbkalBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			10: #Ebkal crash event
				if (GlobalScript.eventEbkalCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventEbkalCrashText
					GlobalScript.eventEbkalCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			11: #Girnn boom event
				if (GlobalScript.eventGirnnBoomNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventGirnnBoomText
					GlobalScript.eventGirnnBoomNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
			12: #Girnn crash event
				if (GlobalScript.eventGirnnCrashNotif == false):
					$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = GlobalScript.eventGirnnCrashText
					GlobalScript.eventGirnnCrashNotif = true
					GlobalScript.stockMarketNotificationBoxShowing = true
					$StockMarketNotificationDisplayPanel.show()
		$EventCountPanel.show()
		match(GlobalScript.randomEventsArr[GlobalScript.randomEventChoose - 1]):
			1: #Hard economy crash event
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventHardEconCrashCurrentTime)
			2: #Soft economy boom event
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventHardEconBoomCurrentTime)
			3:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventCorvusBoomCurrentTime)
			4:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventCorvusCrashCurrentTime)
			5:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventArbelBoomCurrentTime)
			6:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventArbelCrashCurrentTime)
			7:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventCharnelBoomCurrentTime)
			8:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventCharnelCrashCurrentTime)
			9:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventEbkalBoomCurrentTime)
			10:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventEbkalCrashCurrentTime)
			11:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventGirnnBoomCurrentTime)
			12:
				$EventCountPanel/EventCountTimerLabel.text = str(GlobalScript.eventGirnnCrashCurrentTime)
	else: if (GlobalScript.eventActive == 0):
		$EventCountPanel.hide()
	#Update investment total display
	var investmentTotal = (GlobalScript.corvusValue * GlobalScript.corvusAmountOwned) + (GlobalScript.arbelValue * GlobalScript.arbelAmountOwned) + (GlobalScript.charnelValue * GlobalScript.charnelAmountOwned) + (GlobalScript.ebkalValue * GlobalScript.ebkalAmountOwned) + (GlobalScript.girnnValue * GlobalScript.girnnAmountOwned)
	var investmentTotalText = "%.2f" % investmentTotal
	$StockInvestmentPanel/InvestmentLabel.text = "$" + str(investmentTotalText)

func _on_stock_market_notification_close_button_pressed():
	$StockMarketNotificationDisplayPanel.hide()
	GlobalScript.stockMarketNotificationBoxShowing = false
	$StockMarketNotificationDisplayPanel/StockMarketNotificationLabel.text = ""

func sellAll(stockIndexVal):
	GlobalScript.cashValue = GlobalScript.cashValue + (GlobalScript.stockPriceIndex[stockIndexVal] * GlobalScript.stockAmountIndex[stockIndexVal])

func buyMax(stockIndexVal):
	var currentCashVal = GlobalScript.cashValue
	var amountToBuy = 0
	while (currentCashVal > GlobalScript.stockPriceIndex[stockIndexVal]):
		currentCashVal -= GlobalScript.stockPriceIndex[stockIndexVal]
		amountToBuy += 1
	GlobalScript.cashValue = GlobalScript.cashValue - (amountToBuy * GlobalScript.stockPriceIndex[stockIndexVal])
	return amountToBuy

func _on_corvus_sell_all_button_pressed():
	sellAll(0)
	GlobalScript.corvusAmountOwned = 0

func _on_corvus_buy_max_button_pressed():
	var amountToBuy = buyMax(0)
	GlobalScript.corvusAmountOwned += amountToBuy

func _on_arbel_sell_all_button_pressed():
	sellAll(1)
	GlobalScript.arbelAmountOwned = 0

func _on_arbel_buy_max_button_pressed():
	var amountToBuy = buyMax(1)
	GlobalScript.arbelAmountOwned += amountToBuy

func _on_charnel_sell_all_button_pressed():
	sellAll(2)
	GlobalScript.charnelAmountOwned = 0

func _on_charnel_buy_max_button_pressed():
	var amountToBuy = buyMax(2)
	GlobalScript.charnelAmountOwned += amountToBuy

func _on_ebkal_sell_all_button_pressed():
	sellAll(3)
	GlobalScript.ebkalAmountOwned = 0

func _on_ebkal_buy_max_button_pressed():
	var amountToBuy = buyMax(3)
	GlobalScript.ebkalAmountOwned += amountToBuy

func _on_girnn_sell_all_button_pressed():
	sellAll(4)
	GlobalScript.girnnAmountOwned = 0

func _on_girnn_buy_max_button_pressed():
	var amountToBuy = buyMax(4)
	GlobalScript.girnnAmountOwned += amountToBuy

func _on_sell_all_stocks_button_pressed():
	sellAll(0)
	GlobalScript.corvusAmountOwned = 0
	sellAll(1)
	GlobalScript.arbelAmountOwned = 0
	sellAll(2)
	GlobalScript.charnelAmountOwned = 0
	sellAll(3)
	GlobalScript.ebkalAmountOwned = 0
	sellAll(4)
	GlobalScript.girnnAmountOwned = 0
