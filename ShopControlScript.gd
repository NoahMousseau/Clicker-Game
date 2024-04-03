extends Control

#Function to purchase blacksmith on button press
func _on_purchase_blacksmith_pressed():
	if (GlobalScript.stockMarketPing == false):
		if (GlobalScript.cashValue >= GlobalScript.blacksmithCashValue):
			if (GlobalScript.blacksmithAmount < GlobalScript.maxBlacksmithAmount):
				GlobalScript.blacksmithAmount += 1
				GlobalScript.cashValue -= 5
				GlobalScript.constCashGain += 1
				GlobalScript.constCashGainDisplayValue += 1
			else:
				$ShopNotificationPanel/ShopNotificationLabel.text = "Max amount of blacksmiths have been purchased"
				$ShopNotificationPanel.show()

#Function to purchase printing press on button press
func _on_purchase_printing_press_pressed():
	if (GlobalScript.stockMarketPing == false):
		if (GlobalScript.cashValue >= GlobalScript.printingPressCashValue):
			if (GlobalScript.printingPressAmount < GlobalScript.maxPrintingPressAmount):
				GlobalScript.printingPressAmount += 1
				GlobalScript.cashValue -= 50
				GlobalScript.constCashGain += 2
				GlobalScript.constCashGainDisplayValue += 2
			else:
				$ShopNotificationPanel/ShopNotificationLabel.text = "Max amount of printing presses have been purchased"
				$ShopNotificationPanel.show()

func _on_purchase_tailor_pressed():
	if (GlobalScript.stockMarketPing == false):
		if (GlobalScript.cashValue >= GlobalScript.tailorCashValue):
			if (GlobalScript.tailorAmount < GlobalScript.maxTailorAmount):
				GlobalScript.tailorAmount += 1
				GlobalScript.cashValue -= 100
				GlobalScript.constCashGain += 4
				GlobalScript.constCashGainDisplayValue += 4
			else:
				$ShopNotificationPanel/ShopNotificationLabel.text = "Max amount of tailors have been purchased"
				$ShopNotificationPanel.show()

func _on_shop_notification_button_mouse_entered():
	$ShopNotificationPanel/ShopNotificationButton/ShopCloseNotification.show()

func _on_shop_notification_button_mouse_exited():
	$ShopNotificationPanel/ShopNotificationButton/ShopCloseNotification.hide()

func _on_shop_notification_button_pressed():
	$ShopNotificationPanel.hide()
	$ShopNotificationPanel/ShopNotificationLabel.text = ""
