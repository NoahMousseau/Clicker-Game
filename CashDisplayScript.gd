extends Panel

var cashString = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	#"%.2f" % string var converts number to number with 2 decimal places
	cashString = "%.2f" % GlobalScript.cashValue
	$MoneyLabel.text = "$" + cashString

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GlobalScript.cashValue += GlobalScript.constCashGain
	cashString = "%.2f" % GlobalScript.cashValue
	$MoneyLabel.text = "$" + cashString

#Manual cash increase when clicked
func _on_increase_cash_pressed():
	GlobalScript.cashValue = GlobalScript.cashValue + (1 * GlobalScript.cashMultiplier)

#Function to purchase blacksmith on button press
func _on_purchase_blacksmith_pressed():
	if GlobalScript.cashValue >= 10:
		GlobalScript.blacksmithAmount += 1
		GlobalScript.cashValue -= 10
		GlobalScript.constCashGain += 1.0/60.0
		GlobalScript.constCashGainDisplayValue += 1

#Function to increase cash multipler by purchasing via cash
func _on_button_pressed():
	if GlobalScript.cashValue >= 100:
		GlobalScript.cashValue -= 100
		GlobalScript.cashMultiplier += 1
