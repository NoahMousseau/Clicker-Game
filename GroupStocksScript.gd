extends Control

#Function to update cash totals for each stock
func cashTotalsUpdate():
	var cashTotalUpdate = "%.2f" % GlobalScript.cashValue
	$Stock1/CashTotalStockPanel/CashTotalStockUpdatingPanel.text = "$" + cashTotalUpdate
	$Stock2/CashTotalStockPanel/CashTotalStockUpdatingPanel.text = "$" + cashTotalUpdate
	$Stock3/CashTotalStockPanel/CashTotalStockUpdatingPanel.text = "$" + cashTotalUpdate
	$Stock4/CashTotalStockPanel/CashTotalStockUpdatingPanel.text = "$" + cashTotalUpdate
	$Stock5/CashTotalStockPanel/CashTotalStockUpdatingPanel.text = "$" + cashTotalUpdate

#Function to update amount of stock owned for group stock control node
func stockAmountDisplayUpdate():
	$Stock1/CorvusStockMainPanel/CorvusAmountOwnedUpdatingLabel.text = str(GlobalScript.corvusAmountOwned)
	$Stock2/ArbelStockMainPanel/ArbelAmountOwnedUpdatingLabel.text = str(GlobalScript.arbelAmountOwned)
	$Stock3/CharnelStockMainPanel/CharnelAmountOwnedUpdatingLabel.text = str(GlobalScript.charnelAmountOwned)
	$Stock4/EbkalStockMainPanel/EbkalAmountOwnedUpdatingLabel.text = str(GlobalScript.ebkalAmountOwned)
	$Stock5/GirnnStockMainPanel/GirnnAmountOwnedUpdatingLabel.text = str(GlobalScript.girnnAmountOwned)

#Function to update stock values on displays in GroupStock control node
func groupStockDisplayUpdate():
	#Creates formatted stock value text
	var corvusStockText = "%.2f" % GlobalScript.corvusValue
	var arbelStockText = "%.2f" % GlobalScript.arbelValue
	var charnelStockText = "%.2f" % GlobalScript.charnelValue
	var ebkalStockText = "%.2f" % GlobalScript.ebkalValue
	var girnnStockText = "%.2f" % GlobalScript.girnnValue
	#Updates text for current stock prices
	$Stock1/CorvusStockMainPanel/CorvusStockMainUpdatingPriceLabel.text = "$" + corvusStockText
	$Stock2/ArbelStockMainPanel/ArbelStockMainUpdatingPriceLabel.text = "$" + arbelStockText
	$Stock3/CharnelStockMainPanel/CharnelStockMainUpdatingPriceLabel.text = "$" + charnelStockText
	$Stock4/EbkalStockMainPanel/EbkalStockMainUpdatingPriceLabel.text = "$" + ebkalStockText
	$Stock5/GirnnStockMainPanel/GirnnStockMainUpdatingPriceLabel.text = "$" + girnnStockText
	#If-else statements for adjusting text display for stock change values based on if they are positive or negative
	if (GlobalScript.corvusChange < 0):
		GlobalScript.corvusChange = -(GlobalScript.corvusChange)
		var corvusChangeText = "%.2f" % GlobalScript.corvusChange
		$Stock1/CorvusStockMainPanel/CorvusChangeUpdatingLabel.text = "-$" + corvusChangeText
	else:
		var corvusChangeText = "%.2f" % GlobalScript.corvusChange
		$Stock1/CorvusStockMainPanel/CorvusChangeUpdatingLabel.text = "$" + corvusChangeText
	
	if (GlobalScript.corvusChange < 0):
		GlobalScript.arbelChange = -(GlobalScript.arbelChange)
		var arbelChangeText = "%.2f" % GlobalScript.arbelChange
		$Stock2/ArbelStockMainPanel/ArbelChangeUpdatingLabel.text = "-$" + arbelChangeText
	else:
		var arbelChangeText = "%.2f" % GlobalScript.arbelChange
		$Stock2/ArbelStockMainPanel/ArbelChangeUpdatingLabel.text = "$" + arbelChangeText
	
	if (GlobalScript.charnelChange < 0):
		GlobalScript.charnelChange = -(GlobalScript.charnelChange)
		var charnelChangeText = "%.2f" % GlobalScript.charnelChange
		$Stock3/CharnelStockMainPanel/CharnelChangeUpdatingLabel.text = "-$" + charnelChangeText
	else:
		var charnelChangeText = "%.2f" % GlobalScript.charnelChange
		$Stock3/CharnelStockMainPanel/CharnelChangeUpdatingLabel.text = "$" + charnelChangeText
	
	if (GlobalScript.ebkalChange < 0):
		GlobalScript.ebkalChange = -(GlobalScript.ebkalChange)
		var ebkalChangeText = "%.2f" % GlobalScript.ebkalChange
		$Stock4/EbkalStockMainPanel/EbkalChangeUpdatingLabel.text = "-$" + ebkalChangeText
	else:
		var ebkalChangeText = "%.2f" % GlobalScript.ebkalChange
		$Stock4/EbkalStockMainPanel/EbkalChangeUpdatingLabel.text = "$" + ebkalChangeText
	
	if (GlobalScript.girnnChange < 0):
		GlobalScript.girnnChange = -(GlobalScript.girnnChange)
		var girnnChangeText = "%.2f" % GlobalScript.girnnChange
		$Stock5/GirnnStockMainPanel/GirnnChangeUpdatingLabel.text = "-$" + girnnChangeText
	else:
		var girnnChangeText = "%.2f" % GlobalScript.girnnChange
		$Stock5/GirnnStockMainPanel/GirnnChangeUpdatingLabel.text = "$" + girnnChangeText

func stockEventActive():
	#Random number generator, gives a value between 0 and 10
	GlobalScript.eventDecision = GlobalScript.rng.randi_range(0,10)

#Function for stock changes every delta
func stockChange(stockValue, stockVariation, stockChange, stockNumber):
	var boolUpDownSelect = GlobalScript.rng.randi_range(1,3)
	var boolStockMultiplier = GlobalScript.rng.randf_range(0,2)
	#Checks if an event is currently active
	if (GlobalScript.eventActive == 0):
		#If greater than or equal to 2, proceeds as normal
		if (GlobalScript.eventDecision >= 1):
			#For if not 1, stock value goes up
			if (boolUpDownSelect != 1):
				stockChange = stockVariation * boolStockMultiplier
				stockValue += stockChange
			#For if 1, stock value goes down
			else: if (boolUpDownSelect == 1):
				stockChange = stockVariation * boolStockMultiplier
				stockValue -= stockChange
				stockChange = -(stockChange)
		#If less than or equal to 1, triggers an event
		else: if (GlobalScript.eventDecision == 0):
			#Determines what event to use, second paramter is number of programmed events
			GlobalScript.randomEventChoose = GlobalScript.rng.randi_range(1,GlobalScript.randomEventsArr.size()) 
			#Activates trigger for event
			GlobalScript.eventActive = 1
	#Triggers after event has been activated
	if (GlobalScript.eventActive == 1):
		if (GlobalScript.randomEventsArr.is_empty() == true):
			print("Empty randomEventsArr")
			GlobalScript.eventActive = 0
		else:
			#Using -1 to account for array index starting at 0
			match (GlobalScript.randomEventsArr[GlobalScript.randomEventChoose - 1]):
					1: #Hard Economy Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventHardEconCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventHardEconCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventHardEconCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventHardEconCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventHardEconCrashCurrentTime = 30
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					2: #Hard Economy Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventHardEconBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventHardEconBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventHardEconBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventHardEconBoomMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventHardEconBoomCurrentTime = 30
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					3: #Corvus Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventCorvusBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventCorvusBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventCorvusBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue -= stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventCorvusBoomMultiplier)
										stockValue += stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventCorvusBoomCurrentTime = 15
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					4: #Corvus Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventCorvusCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventCorvusCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventCorvusCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventCorvusCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventCorvusCrashCurrentTime = 20
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					5: #Arbel Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventArbelBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventArbelBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventArbelBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue -= stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventArbelBoomMultiplier)
										stockValue += stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventArbelBoomCurrentTime = 25
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					6: #Arbel Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventArbelCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventArbelCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventArbelCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventArbelCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventArbelCrashCurrentTime = 20
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					7: #Charnel Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventCharnelBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventCharnelBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventCharnelBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue -= stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventCharnelBoomMultiplier)
										stockValue += stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventHardEconBoomCurrentTime = 20
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					8: #Charnel Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventCharnelCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventCharnelCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventCharnelCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventCharnelCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventCharnelCrashCurrentTime = 15
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					9: #Ebkal Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventEbkalBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventEbkalBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventEbkalBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue -= stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventEbkalBoomMultiplier)
										stockValue += stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventEbkalBoomCurrentTime = 20
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					10: #Ebkal Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventEbkalCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventEbkalCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventEbkalCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventEbkalCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventEbkalCrashCurrentTime = 15
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					11: #Girnn Boom Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventGirnnBoomStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventGirnnBoomTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventGirnnBoomStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue -= stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventGirnnBoomMultiplier)
										stockValue += stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventGirnnBoomCurrentTime = 25
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
					12: #Girnn Crash Event
						#Set eventStockArr to array of stocks that the event affects
						GlobalScript.eventStockArr = GlobalScript.eventGirnnCrashStockEffectArr
						#If statement to determine if event has been active for enough time
						if (GlobalScript.eventTimeActive <= GlobalScript.eventGirnnCrashTime):
							#Test implementation for function simplification
							for n in range(0,5):
								#Iterate through stockEffect array to find which stocks are affected
								if (stockNumber == GlobalScript.eventGirnnCrashStockEffectArr[n]):
									#1 in 4 chance for stock to increase, 3 in 4 chance for stock to decrease
									var selectChange = GlobalScript.rng.randi_range(0,4)
									if (selectChange == 0):
										#Uses default stockMultiplier declared above
										stockChange = stockVariation * boolStockMultiplier 
										stockValue += stockChange
									else: if (selectChange >= 1):
										#Event multiplier is added to stock multiplier
										stockChange = stockVariation * (boolStockMultiplier + GlobalScript.eventGirnnCrashMultiplier)
										stockValue -= stockChange
										stockChange = -(stockChange)
								else:
									#For if not 1, stock value goes up
									if (boolUpDownSelect != 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue += stockChange
									#For if 1, stock value goes down
									else: if (boolUpDownSelect == 1):
										stockChange = stockVariation * boolStockMultiplier
										stockValue -= stockChange
										stockChange = -(stockChange)
						else:
							#Turns off event
							GlobalScript.eventActive = 0
							#Reset event currentTime variable
							GlobalScript.eventGirnnCrashCurrentTime = 20
							#Reset event time active
							GlobalScript.eventTimeActive = 0
							#Sets notification box ping off once event is over
							GlobalScript.eventNotificationBoxPing = false
	#Sets stockValue and stockChange to 0 if stock cannot go any lower
	if (stockValue <= 0):
		stockValue = 0;
		stockChange = 0;
	#Assign variables for arrow control
	GlobalScript.stockChanges[stockNumber - 1] = stockChange;
	#Check if event is active and update arrow control array
	if (GlobalScript.eventActive == 1):
		GlobalScript.stockHitZero[stockNumber - 1] = 1;
	else:
		GlobalScript.stockHitZero[stockNumber - 1] = 0;
	#Returns array with new stockvalue and amount it has changed by
	var dataArr = [stockValue, stockChange]
	return dataArr

#Variable for 1sec timer
var updateTimer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	groupStockDisplayUpdate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateTimer += delta
	if (GlobalScript.stockMarketPing == true):
		if updateTimer >= 1:
			
			#Roll chance for event to become active
			stockEventActive()
			
			if (GlobalScript.eventActive == 1):
				#Increase time active by 1
				GlobalScript.eventTimeActive = GlobalScript.eventTimeActive + 1
				match (GlobalScript.randomEventsArr[GlobalScript.randomEventChoose - 1]):
					#Add event time countdowns here:
					1: #Hard econ crash
						GlobalScript.eventHardEconCrashCurrentTime -= 1
					2: #Hard econ boom
						GlobalScript.eventHardEconBoomCurrentTime -= 1
					3:
						GlobalScript.eventCorvusBoomCurrentTime -= 1
					4:
						GlobalScript.eventCorvusCrashCurrentTime -= 1
					5:
						GlobalScript.eventArbelBoomCurrentTime -= 1
					6:
						GlobalScript.eventArbelCrashCurrentTime -= 1
					7:
						GlobalScript.eventCharnelBoomCurrentTime -= 1
					8:
						GlobalScript.eventCharnelCrashCurrentTime -= 1
					9:
						GlobalScript.eventEbkalBoomCurrentTime -= 1
					10:
						GlobalScript.eventEbkalCrashCurrentTime -= 1
					11:
						GlobalScript.eventGirnnBoomCurrentTime -= 1
					12:
						GlobalScript.eventGirnnCrashCurrentTime -= 1
			
			#Creates 5 arrays to store data from stockChange functions
			GlobalScript.corvusDataArr = stockChange(GlobalScript.corvusValue, GlobalScript.corvusVariation, GlobalScript.corvusChange, 1)
			GlobalScript.arbelDataArr = stockChange(GlobalScript.arbelValue, GlobalScript.arbelVariation, GlobalScript.arbelChange, 2)
			GlobalScript.charnelDataArr = stockChange(GlobalScript.charnelValue, GlobalScript.charnelVariation, GlobalScript.charnelChange, 3)
			GlobalScript.ebkalDataArr = stockChange(GlobalScript.ebkalValue, GlobalScript.ebkalVariation, GlobalScript.ebkalChange, 4)
			GlobalScript.girnnDataArr = stockChange(GlobalScript.girnnValue, GlobalScript.girnnVariation, GlobalScript.girnnChange, 5)
			#Assigns stock values based on data from stockChange functions
			GlobalScript.corvusValue = GlobalScript.corvusDataArr[0]
			GlobalScript.arbelValue = GlobalScript.arbelDataArr[0]
			GlobalScript.charnelValue = GlobalScript.charnelDataArr[0]
			GlobalScript.ebkalValue = GlobalScript.ebkalDataArr[0]
			GlobalScript.girnnValue = GlobalScript.girnnDataArr[0]
			#Assigns stockChange values in GlobalScript based on data from stockChange functions
			GlobalScript.corvusChange = GlobalScript.corvusDataArr[1]
			GlobalScript.arbelChange = GlobalScript.arbelDataArr[1]
			GlobalScript.charnelChange = GlobalScript.charnelDataArr[1]
			GlobalScript.ebkalChange = GlobalScript.ebkalDataArr[1]
			GlobalScript.girnnChange = GlobalScript.girnnDataArr[1]
			
			groupStockDisplayUpdate()
			stockAmountDisplayUpdate()
			updateTimer = 0
	cashTotalsUpdate()

func _on_purchase_corvus_pressed():
	if (GlobalScript.cashValue >= GlobalScript.corvusValue):
		if (GlobalScript.corvusValue <= 0.0 && GlobalScript.stock1notifShowing == 0):
			$Stock1/Stock1NotificationPanel/Stock1NotificationLabel.text = "Stock value is 0, unable to purchase"
			GlobalScript.stock1notifShowing = 1
			$Stock1/Stock1NotificationPanel.show()
		else:
			GlobalScript.corvusAmountOwned += 1
			GlobalScript.cashValue -= GlobalScript.corvusValue
			GlobalScript.corvusVariation += GlobalScript.corvusPlayerVariation

func _on_sell_corvus_pressed():
	if (GlobalScript.corvusAmountOwned >= 1):
		if (GlobalScript.corvusValue <= 0.0 && GlobalScript.stock1notifShowing == 0):
			$Stock1/Stock1NotificationPanel/Stock1NotificationLabel.text = "Stock value is 0, unable to sell"
			GlobalScript.stock1notifShowing = 1
			$Stock1/Stock1NotificationPanel.show()
		else:
			GlobalScript.corvusAmountOwned -= 1
			GlobalScript.cashValue += GlobalScript.corvusValue
			GlobalScript.corvusVariation -= GlobalScript.corvusPlayerVariation

func _on_purchase_arbel_pressed():
	if (GlobalScript.cashValue >= GlobalScript.arbelValue):
		if (GlobalScript.arbelValue <= 0.0 && GlobalScript.stock2notifShowing == 0):
			$Stock2/Stock2NotificationPanel/Stock2NotificationLabel.text = "Stock value is 0, unable to purchase"
			GlobalScript.stock2notifShowing = 1
			$Stock2/Stock2NotificationPanel.show()
		else:
			GlobalScript.arbelAmountOwned += 1
			GlobalScript.cashValue -= GlobalScript.arbelValue
			GlobalScript.arbelVariation += GlobalScript.arbelPlayerVariation

func _on_sell_arbel_pressed():
	if (GlobalScript.arbelAmountOwned >= 1):
		if (GlobalScript.arbelValue <= 0.0 && GlobalScript.stock2notifShowing == 0):
			$Stock2/Stock2NotificationPanel/Stock2NotificationLabel.text = "Stock value is 0, unable to sell"
			GlobalScript.stock2notifShowing = 1
			$Stock2/Stock2NotificationPanel.show()
		else:
			GlobalScript.arbelAmountOwned -= 1
			GlobalScript.cashValue += GlobalScript.arbelValue
			GlobalScript.arbelVariation -= GlobalScript.arbelPlayerVariation

func _on_purchase_charnel_pressed():
	if (GlobalScript.cashValue >= GlobalScript.charnelValue):
		if (GlobalScript.charnelValue <= 0.0 && GlobalScript.stock3notifShowing == 0):
			$Stock3/Stock3NotificationPanel/Stock3NotificationLabel.text = "Stock value is 0, unable to purchase"
			GlobalScript.stock3notifShowing = 1
			$Stock3/Stock3NotificationPanel.show()
		else:
			GlobalScript.charnelAmountOwned += 1
			GlobalScript.cashValue -= GlobalScript.charnelValue
			GlobalScript.charnelVariation += GlobalScript.charnelPlayerVariation

func _on_sell_charnel_pressed():
	if (GlobalScript.charnelAmountOwned >= 1):
		if (GlobalScript.charnelValue <= 0.0 && GlobalScript.stock3notifShowing == 0):
			$Stock3/Stock3NotificationPanel/Stock3NotificationLabel.text = "Stock value is 0, unable to sell"
			GlobalScript.stock3notifShowing = 1
			$Stock3/Stock3NotificationPanel.show()
		else:
			GlobalScript.charnelAmountOwned -= 1
			GlobalScript.cashValue += GlobalScript.charnelValue
			GlobalScript.charnelVariation -= GlobalScript.charnelPlayerVariation

func _on_purchase_ebkal_pressed():
	if (GlobalScript.cashValue >= GlobalScript.ebkalValue):
		if (GlobalScript.ebkalValue <= 0.0 && GlobalScript.stock4notifShowing == 0):
			$Stock4/Stock4NotificationPanel/Stock4NotificationLabel.text = "Stock value is 0, unable to purchase"
			GlobalScript.stock4notifShowing = 1
			$Stock4/Stock4NotificationPanel.show()
		else:
			GlobalScript.ebkalAmountOwned += 1
			GlobalScript.cashValue -= GlobalScript.ebkalValue
			GlobalScript.ebkalVariation += GlobalScript.ebkalPlayerVariation

func _on_sell_ebkal_pressed():
	if (GlobalScript.ebkalAmountOwned >= 1):
		if (GlobalScript.ebkalValue <= 0.0 && GlobalScript.stock4notifShowing == 0):
			$Stock4/Stock4NotificationPanel/Stock4NotificationLabel.text = "Stock value is 0, unable to sell"
			GlobalScript.stock4notifShowing = 1
			$Stock4/Stock4NotificationPanel.show()
		else:
			GlobalScript.ebkalAmountOwned -= 1
			GlobalScript.cashValue += GlobalScript.ebkalValue
			GlobalScript.ebkalVariation -= GlobalScript.ebkalPlayerVariation

func _on_purchase_girnn_pressed():
	if (GlobalScript.cashValue >= GlobalScript.girnnValue):
		if (GlobalScript.girnnValue <= 0.0 && GlobalScript.stock5notifShowing == 0):
			$Stock5/Stock5NotificationPanel/Stock5NotificationLabel.text = "Stock value is 0, unable to purchase"
			GlobalScript.stock5notifShowing = 1
			$Stock5/Stock5NotificationPanel.show()
		else:
			GlobalScript.girnnAmountOwned += 1
			GlobalScript.cashValue -= GlobalScript.girnnValue
			GlobalScript.girnnVariation += GlobalScript.girnnPlayerVariation

func _on_sell_girnn_pressed():
	if (GlobalScript.girnnAmountOwned >= 1):
		if (GlobalScript.girnnValue <= 0.0 && GlobalScript.stock5notifShowing == 0):
			$Stock5/Stock5NotificationPanel/Stock5NotificationLabel.text = "Stock value is 0, unable to sell"
			GlobalScript.stock5notifShowing = 1
			$Stock5/Stock5NotificationPanel.show()
		else:
			GlobalScript.girnnAmountOwned -= 1
			GlobalScript.cashValue += GlobalScript.girnnValue
			GlobalScript.girnnVariation -= GlobalScript.girnnPlayerVariation

func _on_stock_1_notification_close_button_pressed():
	$Stock1/Stock1NotificationPanel.hide()
	$Stock1/Stock1NotificationPanel/Stock1NotificationLabel.text = ""
	GlobalScript.stock1notifShowing = 0

func _on_stock_2_notification_close_button_pressed():
	$Stock2/Stock2NotificationPanel.hide()
	$Stock2/Stock2NotificationPanel/Stock2NotificationLabel.text = ""
	GlobalScript.stock2notifShowing = 0

func _on_stock_3_notification_close_button_pressed():
	$Stock3/Stock3NotificationPanel.hide()
	$Stock3/Stock3NotificationPanel/Stock3NotificationLabel.text = ""
	GlobalScript.stock3notifShowing = 0

func _on_stock_4_notification_close_button_pressed():
	$Stock4/Stock4NotificationPanel.hide()
	$Stock4/Stock4NotificationPanel/Stock4NotificationLabel.text = ""
	GlobalScript.stock4notifShowing = 0

func _on_stock_5_notification_close_button_pressed():
	$Stock5/Stock5NotificationPanel.hide()
	$Stock5/Stock5NotificationPanel/Stock5NotificationLabel.text = ""
	GlobalScript.stock5notifShowing = 0

func _on_stock_1_notification_close_button_mouse_entered():
	$Stock1/Stock1NotificationPanel/Stock1NotificationClosePanel.show()

func _on_stock_1_notification_close_button_mouse_exited():
	$Stock1/Stock1NotificationPanel/Stock1NotificationClosePanel.hide()

func _on_stock_2_notification_close_button_mouse_entered():
	$Stock2/Stock2NotificationPanel/Stock2NotificationClosePanel.show()

func _on_stock_2_notification_close_button_mouse_exited():
	$Stock2/Stock2NotificationPanel/Stock2NotificationClosePanel.hide()

func _on_stock_3_notification_close_button_mouse_entered():
	$Stock3/Stock3NotificationPanel/Stock3NotificationClosePanel.show()

func _on_stock_3_notification_close_button_mouse_exited():
	$Stock3/Stock3NotificationPanel/Stock3NotificationClosePanel.hide()

func _on_stock_4_notification_close_button_mouse_entered():
	$Stock4/Stock4NotificationPanel/Stock4NotificationClosePanel.show()

func _on_stock_4_notification_close_button_mouse_exited():
	$Stock4/Stock4NotificationPanel/Stock4NotificationClosePanel.hide()

func _on_stock_5_notification_close_button_mouse_entered():
	$Stock5/Stock5NotificationPanel/Stock5NotificationClosePanel.show()

func _on_stock_5_notification_close_button_mouse_exited():
	$Stock5/Stock5NotificationPanel/Stock5NotificationClosePanel.hide()
