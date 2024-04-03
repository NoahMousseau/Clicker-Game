extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Function to update arrows
func updateArrows(stockNumber):
	match (stockNumber):
		1:
			if (GlobalScript.eventActive == 1):
				if (GlobalScript.eventStockArr[0] == stockNumber):
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$CorvusArrowControl/CorvusEventGoodArrow.show()
						$CorvusArrowControl/CorvusEventBadArrow.hide()
						$CorvusArrowControl/CorvusActiveUpArrow.hide()
						$CorvusArrowControl/CorvusActiveDownArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$CorvusArrowControl/CorvusEventGoodArrow.hide()
						$CorvusArrowControl/CorvusEventBadArrow.show()
						$CorvusArrowControl/CorvusActiveUpArrow.hide()
						$CorvusArrowControl/CorvusActiveDownArrow.hide()
					else:
						$CorvusArrowControl/CorvusEventGoodArrow.hide()
						$CorvusArrowControl/CorvusEventBadArrow.hide()
						$CorvusArrowControl/CorvusActiveUpArrow.hide()
						$CorvusArrowControl/CorvusActiveDownArrow.hide()
				else:
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$CorvusArrowControl/CorvusActiveUpArrow.show()
						$CorvusArrowControl/CorvusActiveDownArrow.hide()
						$CorvusArrowControl/CorvusEventGoodArrow.hide()
						$CorvusArrowControl/CorvusEventBadArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$CorvusArrowControl/CorvusActiveUpArrow.hide()
						$CorvusArrowControl/CorvusActiveDownArrow.show()
						$CorvusArrowControl/CorvusEventGoodArrow.hide()
						$CorvusArrowControl/CorvusEventBadArrow.hide()
					else:
						$CorvusArrowControl/CorvusActiveUpArrow.hide()
						$CorvusArrowControl/CorvusActiveDownArrow.hide()
			else:
				if (GlobalScript.stockChanges[stockNumber-1] > 0):
					$CorvusArrowControl/CorvusActiveUpArrow.show()
					$CorvusArrowControl/CorvusActiveDownArrow.hide()
					$CorvusArrowControl/CorvusEventGoodArrow.hide()
					$CorvusArrowControl/CorvusEventBadArrow.hide()
				else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
					$CorvusArrowControl/CorvusActiveUpArrow.hide()
					$CorvusArrowControl/CorvusActiveDownArrow.show()
					$CorvusArrowControl/CorvusEventGoodArrow.hide()
					$CorvusArrowControl/CorvusEventBadArrow.hide()
				else:
					$CorvusArrowControl/CorvusActiveUpArrow.hide()
					$CorvusArrowControl/CorvusActiveDownArrow.hide()
		2:
			if (GlobalScript.eventActive == 1):
				if (GlobalScript.eventStockArr[1] == stockNumber):
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$ArbelArrowControl/ArbelEventGoodArrow.show()
						$ArbelArrowControl/ArbelEventBadArrow.hide()
						$ArbelArrowControl/ArbelActiveUpArrow.hide()
						$ArbelArrowControl/ArbelActiveDownArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$ArbelArrowControl/ArbelEventGoodArrow.hide()
						$ArbelArrowControl/ArbelEventBadArrow.show()
						$ArbelArrowControl/ArbelActiveUpArrow.hide()
						$ArbelArrowControl/ArbelActiveDownArrow.hide()
					else:
						$ArbelArrowControl/ArbelEventGoodArrow.hide()
						$ArbelArrowControl/ArbelEventBadArrow.hide()
						$ArbelArrowControl/ArbelActiveUpArrow.hide()
						$ArbelArrowControl/ArbelActiveDownArrow.hide()
				else:
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$ArbelArrowControl/ArbelActiveUpArrow.show()
						$ArbelArrowControl/ArbelActiveDownArrow.hide()
						$ArbelArrowControl/ArbelEventGoodArrow.hide()
						$ArbelArrowControl/ArbelEventBadArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$ArbelArrowControl/ArbelActiveUpArrow.hide()
						$ArbelArrowControl/ArbelActiveDownArrow.show()
						$ArbelArrowControl/ArbelEventGoodArrow.hide()
						$ArbelArrowControl/ArbelEventBadArrow.hide()
					else:
						$ArbelArrowControl/ArbelActiveUpArrow.hide()
						$ArbelArrowControl/ArbelActiveDownArrow.hide()
			else:
				if (GlobalScript.stockChanges[stockNumber-1] > 0):
					$ArbelArrowControl/ArbelActiveUpArrow.show()
					$ArbelArrowControl/ArbelActiveDownArrow.hide()
					$ArbelArrowControl/ArbelEventGoodArrow.hide()
					$ArbelArrowControl/ArbelEventBadArrow.hide()
				else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
					$ArbelArrowControl/ArbelActiveUpArrow.hide()
					$ArbelArrowControl/ArbelActiveDownArrow.show()
					$ArbelArrowControl/ArbelEventGoodArrow.hide()
					$ArbelArrowControl/ArbelEventBadArrow.hide()
				else:
					$ArbelArrowControl/ArbelActiveUpArrow.hide()
					$ArbelArrowControl/ArbelActiveDownArrow.hide()
		3:
			if (GlobalScript.eventActive == 1):
				if (GlobalScript.eventStockArr[2] == stockNumber):
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$CharnelArrowControl/CharnelEventGoodArrow.show()
						$CharnelArrowControl/CharnelEventBadArrow.hide()
						$CharnelArrowControl/CharnelActiveUpArrow.hide()
						$CharnelArrowControl/CharnelActiveDownArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$CharnelArrowControl/CharnelEventGoodArrow.hide()
						$CharnelArrowControl/CharnelEventBadArrow.show()
						$CharnelArrowControl/CharnelActiveUpArrow.hide()
						$CharnelArrowControl/CharnelActiveDownArrow.hide()
					else:
						$CharnelArrowControl/CharnelEventGoodArrow.hide()
						$CharnelArrowControl/CharnelEventBadArrow.hide()
						$CharnelArrowControl/CharnelActiveUpArrow.hide()
						$CharnelArrowControl/CharnelActiveDownArrow.hide()
				else:
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$CharnelArrowControl/CharnelActiveUpArrow.show()
						$CharnelArrowControl/CharnelActiveDownArrow.hide()
						$CharnelArrowControl/CharnelEventGoodArrow.hide()
						$CharnelArrowControl/CharnelEventBadArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$CharnelArrowControl/CharnelActiveUpArrow.hide()
						$CharnelArrowControl/CharnelActiveDownArrow.show()
						$CharnelArrowControl/CharnelEventGoodArrow.hide()
						$CharnelArrowControl/CharnelEventBadArrow.hide()
					else:
						$CharnelArrowControl/CharnelActiveUpArrow.hide()
						$CharnelArrowControl/CharnelActiveDownArrow.hide()
			else:
				if (GlobalScript.stockChanges[stockNumber-1] > 0):
					$CharnelArrowControl/CharnelActiveUpArrow.show()
					$CharnelArrowControl/CharnelActiveDownArrow.hide()
					$CharnelArrowControl/CharnelEventGoodArrow.hide()
					$CharnelArrowControl/CharnelEventBadArrow.hide()
				else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
					$CharnelArrowControl/CharnelActiveUpArrow.hide()
					$CharnelArrowControl/CharnelActiveDownArrow.show()
					$CharnelArrowControl/CharnelEventGoodArrow.hide()
					$CharnelArrowControl/CharnelEventBadArrow.hide()
				else:
					$CharnelArrowControl/CharnelActiveUpArrow.hide()
					$CharnelArrowControl/CharnelActiveDownArrow.hide()
		4:
			if (GlobalScript.eventActive == 1):
				if (GlobalScript.eventStockArr[3] == stockNumber):
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$EbkalArrowControl/EbkalEventGoodArrow.show()
						$EbkalArrowControl/EbkalEventBadArrow.hide()
						$EbkalArrowControl/EbkalActiveUpArrow.hide()
						$EbkalArrowControl/EbkalActiveDownArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$EbkalArrowControl/EbkalEventGoodArrow.hide()
						$EbkalArrowControl/EbkalEventBadArrow.show()
						$EbkalArrowControl/EbkalActiveUpArrow.hide()
						$EbkalArrowControl/EbkalActiveDownArrow.hide()
					else:
						$EbkalArrowControl/EbkalEventGoodArrow.hide()
						$EbkalArrowControl/EbkalEventBadArrow.hide()
						$EbkalArrowControl/EbkalActiveUpArrow.hide()
						$EbkalArrowControl/EbkalActiveDownArrow.hide()
				else:
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$EbkalArrowControl/EbkalActiveUpArrow.show()
						$EbkalArrowControl/EbkalActiveDownArrow.hide()
						$EbkalArrowControl/EbkalEventGoodArrow.hide()
						$EbkalArrowControl/EbkalEventBadArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$EbkalArrowControl/EbkalActiveUpArrow.hide()
						$EbkalArrowControl/EbkalActiveDownArrow.show()
						$EbkalArrowControl/EbkalEventGoodArrow.hide()
						$EbkalArrowControl/EbkalEventBadArrow.hide()
					else:
						$EbkalArrowControl/EbkalActiveUpArrow.hide()
						$EbkalArrowControl/EbkalActiveDownArrow.hide()
			else:
				if (GlobalScript.stockChanges[stockNumber-1] > 0):
					$EbkalArrowControl/EbkalActiveUpArrow.show()
					$EbkalArrowControl/EbkalActiveDownArrow.hide()
					$EbkalArrowControl/EbkalEventGoodArrow.hide()
					$EbkalArrowControl/EbkalEventBadArrow.hide()
				else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
					$EbkalArrowControl/EbkalActiveUpArrow.hide()
					$EbkalArrowControl/EbkalActiveDownArrow.show()
					$EbkalArrowControl/EbkalEventGoodArrow.hide()
					$EbkalArrowControl/EbkalEventBadArrow.hide()
				else:
					$EbkalArrowControl/EbkalActiveUpArrow.hide()
					$EbkalArrowControl/EbkalActiveDownArrow.hide()
		5:
			if (GlobalScript.eventActive == 1):
				if (GlobalScript.eventStockArr[4] == stockNumber):
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$GirnnArrowControl/GirnnEventGoodArrow.show()
						$GirnnArrowControl/GirnnEventBadArrow.hide()
						$GirnnArrowControl/GirnnActiveUpArrow.hide()
						$GirnnArrowControl/GirnnActiveDownArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$GirnnArrowControl/GirnnEventGoodArrow.hide()
						$GirnnArrowControl/GirnnEventBadArrow.show()
						$GirnnArrowControl/GirnnActiveUpArrow.hide()
						$GirnnArrowControl/GirnnActiveDownArrow.hide()
					else:
						$GirnnArrowControl/GirnnEventGoodArrow.hide()
						$GirnnArrowControl/GirnnEventBadArrow.hide()
						$GirnnArrowControl/GirnnActiveUpArrow.hide()
						$GirnnArrowControl/GirnnActiveDownArrow.hide()
				else:
					if (GlobalScript.stockChanges[stockNumber-1] > 0):
						$GirnnArrowControl/GirnnActiveUpArrow.show()
						$GirnnArrowControl/GirnnActiveDownArrow.hide()
						$GirnnArrowControl/GirnnEventGoodArrow.hide()
						$GirnnArrowControl/GirnnEventBadArrow.hide()
					else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
						$GirnnArrowControl/GirnnActiveUpArrow.hide()
						$GirnnArrowControl/GirnnActiveDownArrow.show()
						$GirnnArrowControl/GirnnEventGoodArrow.hide()
						$GirnnArrowControl/GirnnEventBadArrow.hide()
					else:
						$GirnnArrowControl/GirnnActiveUpArrow.hide()
						$GirnnArrowControl/GirnnActiveDownArrow.hide()
			else:
				if (GlobalScript.stockChanges[stockNumber-1] > 0):
					$GirnnArrowControl/GirnnActiveUpArrow.show()
					$GirnnArrowControl/GirnnActiveDownArrow.hide()
					$GirnnArrowControl/GirnnEventGoodArrow.hide()
					$GirnnArrowControl/GirnnEventBadArrow.hide()
				else: if (GlobalScript.stockChanges[stockNumber-1] < 0):
					$GirnnArrowControl/GirnnActiveUpArrow.hide()
					$GirnnArrowControl/GirnnActiveDownArrow.show()
					$GirnnArrowControl/GirnnEventGoodArrow.hide()
					$GirnnArrowControl/GirnnEventBadArrow.hide()
				else:
					$GirnnArrowControl/GirnnActiveUpArrow.hide()
					$GirnnArrowControl/GirnnActiveDownArrow.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateArrows(1)
	updateArrows(2)
	updateArrows(3)
	updateArrows(4)
	updateArrows(5)
