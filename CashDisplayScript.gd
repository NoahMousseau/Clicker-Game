extends Panel

#Manual cash increase when clicked
func _on_increase_cash_pressed():
	GlobalScript.cashValue = GlobalScript.cashValue + (1 * GlobalScript.cashMultiplier)

#Function to increase cash multipler by purchasing via cash
func _on_button_pressed():
	if GlobalScript.cashValue >= 100:
		GlobalScript.cashValue -= 100
		GlobalScript.cashMultiplier += 1
