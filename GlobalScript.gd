extends Node

#Variables for game itself
var cashValue = 999.00
var cashMultiplier = 1
var constCashGain = 0
var constCashGainDisplayValue = 0
var cashString = ""

#Variables for blacksmith
var blacksmithAmount = 0
var blacksmithCashValue = 5
var blacksmithPopupShown = false
var maxBlacksmithAmount = 10

#Variables for printing press
var printingPressAmount = 0
var printingPressCashValue = 50
var printingPressPopupShown = false
var maxPrintingPressAmount = 10

#Variables for tailor
var tailorAmount = 0
var tailorCashValue = 100
var tailorPopupShown = false
var maxTailorAmount = 10

#Variables for stock market info notifications
var stockMarketNotificationBoxShowing = false
var stockMarketInfoPopupShown = false

#Variables for showing notification boxes
var notificationBoxShowing = false
var blackSmithPing = false
var printingPressPing = false
var tailorPing = false
var stockMarketPing = false
var stockMarketInfoPing = false

#Variables for holding indexes for stock buy all and sell all buttons
var stockPriceIndex = [0, 0, 0, 0, 0]
var stockAmountIndex = [0, 0, 0, 0, 0]

#Variables for controlling arrow behavior
var eventStockArr = [0, 0, 0, 0, 0]
var stockChanges = [0, 0, 0, 0, 0]
var stockHitZero = [0, 0, 0, 0, 0]

#Variables for editing market shop boxes after stock market access is granted
var shopMarketEditPing = false

#Variable to count framerate
var framerate = 0

#Variables to dynamically adjust graph
var customPoints = PackedVector2Array()
var updateTimer = 0.0
var xVal = 0
var yRange = 500.0
var xRange = 1000.0
var multiplicator = 0.0

#Variables for shop
var shopButtonPress = false

#Variable to create random number generator
var rng = RandomNumberGenerator.new()

#Variables for amount of stock owned
var corvusAmountOwned = 0
var arbelAmountOwned = 0
var charnelAmountOwned = 0
var ebkalAmountOwned = 0
var girnnAmountOwned = 0

#Variables for stock market stock values
var stockPopupShown = false
var corvusValue = 12.7
var arbelValue = 23.3
var charnelValue = 54.45
var ebkalValue = 93.22
var girnnValue = 152.4

#Variables for tracking stock value changes
var corvusChange = 0.0
var arbelChange = 0.0
var charnelChange = 0.0
var ebkalChange = 0.0
var girnnChange = 0.0

#Variables for creating variation in stock values between each individual stock
var corvusVariation = 0.84
var arbelVariation = 1.86
var charnelVariation = 4.53
var ebkalVariation = 6.32
var girnnVariation = 10.23

#Variables for adjusting variation based on player stock purchases
var corvusPlayerVariation = 0.08
var arbelPlayerVariation = 0.42
var charnelPlayerVariation = 1.21
var ebkalPlayerVariation = 2.28
var girnnPlayerVariation = 4.32

#Variables for event generation timer
var updateCountTimer = 0

#Variables for event decision
var eventDecision = 0 #Used to determine if an event triggers
var randomEventChoose #Used to decide which event is used
var eventActive = 0 #Used to determine if an event is currently active
var eventTimeActive = 0 #Used to compare to event time
var eventNotificationBoxPing = false
var randomEventsArr = [1,2,3,4,5,6,7,8,9,10,11,12]
var randomEventChooseArrOption

#Variables and strings for event generation
#Corvus - Lumber company
#Arbel - Firearms company
#Charnel - Steel company
#Ebkal - Carriage company
#Girnn - Shipbuilding company
#Variables for hard econ crash
var eventHardEconCrashText = "The collapse of a primary overseas bank has caused the economy to crash."
var eventHardEconCrashStockEffectArr = [1, 2, 3, 4, 5] #The stocks the event will effect
var eventHardEconCrashMultiplier = 1.5
var eventHardEconCrashTime = 30 #Time event lasts in seconds
var eventHardEconCrashCurrentTime = 30 #This var and the above var must be equal
var eventHardEconCrashNotif = false #Determines if notification has been triggered
#Variables for hard econ boom
var eventHardEconBoomText = "The infusion of investor funding into overseas companies has caused the economy to boom."
var eventHardEconBoomStockEffectArr = [1, 2, 3, 4, 5] #The stocks the event will effect
var eventHardEconBoomMultiplier = 1.5
var eventHardEconBoomTime = 30 #Time event lasts in seconds
var eventHardEconBoomCurrentTime = 30 #This var and the above var must be equal
var eventHardEconBoomNotif = false #Determines if notification has been triggered
#Variables for Corvus boom
var eventCorvusBoomText = "Recent land aquisitions has allowed for increased lumber output from Corvus lumber."
var eventCorvusBoomStockEffectArr = [1, 0, 0, 0, 0] #The stocks the event will effect
var eventCorvusBoomMultiplier = 2
var eventCorvusBoomTime = 15 #Time event lasts in seconds
var eventCorvusBoomCurrentTime = 15 #This var and the above var must be equal
var eventCorvusBoomNotif = false #Determines if notification has been triggered
#Variables for Corvus crash
var eventCorvusCrashText = "Recent forest fires have reduced the output of Corvus lumber."
var eventCorvusCrashStockEffectArr = [1, 0, 0, 0, 0] #The stocks the event will effect
var eventCorvusCrashMultiplier = 2
var eventCorvusCrashTime = 20 #Time event lasts in seconds
var eventCorvusCrashCurrentTime = 20 #This var and the above var must be equal
var eventCorvusCrashNotif = false #Determines if notification has been triggered
#Variables for Arbel boom
var eventArbelBoomText = "Reduced steel prices has allowed for increase Arbel firearms production."
var eventArbelBoomStockEffectArr = [0, 2, 0, 0, 0] #The stocks the event will effect
var eventArbelBoomMultiplier = 2
var eventArbelBoomTime = 25 #Time event lasts in seconds
var eventArbelBoomCurrentTime = 25 #This var and the above var must be equal
var eventArbelBoomNotif = false #Determines if notification has been triggered
#Variables for Arbel crash
var eventArbelCrashText = "Increased steel prices has also increased Arbel firearms prices."
var eventArbelCrashStockEffectArr = [0, 2, 0, 0, 0] #The stocks the event will effect
var eventArbelCrashMultiplier = 1.75
var eventArbelCrashTime = 20 #Time event lasts in seconds
var eventArbelCrashCurrentTime = 20 #This var and the above var must be equal
var eventArbelCrashNotif = false #Determines if notification has been triggered
#Variables for Charnel boom
var eventCharnelBoomText = "New coal mines have allowed for increased Charnel steel production efficiency."
var eventCharnelBoomStockEffectArr = [0, 0, 3, 0, 0] #The stocks the event will effect
var eventCharnelBoomMultiplier = 1.8
var eventCharnelBoomTime = 20 #Time event lasts in seconds
var eventCharnelBoomCurrentTime = 20 #This var and the above var must be equal
var eventCharnelBoomNotif = false #Determines if notification has been triggered
#Variables for Charnel crash
var eventCharnelCrashText = "The collapse of multiple iron mines has resulted in increased Charnel steel prices."
var eventCharnelCrashStockEffectArr = [0, 0, 3, 0, 0] #The stocks the event will effect
var eventCharnelCrashMultiplier = 2
var eventCharnelCrashTime = 15 #Time event lasts in seconds
var eventCharnelCrashCurrentTime = 15 #This var and the above var must be equal
var eventCharnelCrashNotif = false #Determines if notification has been triggered
#Variables for Ebkal boom
var eventEbkalBoomText = "New tools have allowed for increased Ebkal carriage production."
var eventEbkalBoomStockEffectArr = [0, 0, 0, 4, 0] #The stocks the event will effect
var eventEbkalBoomMultiplier = 1.75
var eventEbkalBoomTime = 20 #Time event lasts in seconds
var eventEbkalBoomCurrentTime = 20 #This var and the above var must be equal
var eventEbkalBoomNotif = false #Determines if notification has been triggered
#Variables for Ebkal crash
var eventEbkalCrashText = "Recent factory closures have resulted in decreased Ebkal carriage production."
var eventEbkalCrashStockEffectArr = [0, 0, 0, 4, 0] #The stocks the event will effect
var eventEbkalCrashMultiplier = 1.9
var eventEbkalCrashTime = 15 #Time event lasts in seconds
var eventEbkalCrashCurrentTime = 15 #This var and the above var must be equal
var eventEbkalCrashNotif = false #Determines if notification has been triggered
#Variables for Girnn boom
var eventGirnnBoomText = "New shipbuilding techniques have allowed for faster Girnn ship production."
var eventGirnnBoomStockEffectArr = [0, 0, 0, 0, 5] #The stocks the event will effect
var eventGirnnBoomMultiplier = 1.25
var eventGirnnBoomTime = 25 #Time event lasts in seconds
var eventGirnnBoomCurrentTime = 25 #This var and the above var must be equal
var eventGirnnBoomNotif = false #Determines if notification has been triggered
#Variables for Girnn crash
var eventGirnnCrashText = "The loss of some dock permits have decreased Girnn shipbuilding output."
var eventGirnnCrashStockEffectArr = [0, 0, 0, 0, 5] #The stocks the event will effect
var eventGirnnCrashMultiplier = 1.4
var eventGirnnCrashTime = 20 #Time event lasts in seconds
var eventGirnnCrashCurrentTime = 20 #This var and the above var must be equal
var eventGirnnCrashNotif = false #Determines if notification has been triggered

#Variables for determining if individual stock notifications are showing
var stock1notifShowing = 0;
var stock2notifShowing = 0;
var stock3notifShowing = 0;
var stock4notifShowing = 0;
var stock5notifShowing = 0;

#Arrays for storing stock return data
var corvusDataArr = []
var arbelDataArr = []
var charnelDataArr = []
var ebkalDataArr = []
var girnnDataArr = []

#Values for Corvus stock graph
var corvusUpdateTimer = 0
var corvusXRange = 850
var corvusYRange = 500
var corvusXValue = 0
var corvusCustomPoints = PackedVector2Array()
var corvusMultiplicator = 0.0
var corvusGraphGlitchCatch = false

#Values for Arbel stock graph
var arbelUpdateTimer = 0
var arbelXRange = 850
var arbelYRange = 500
var arbelXValue = 0
var arbelCustomPoints = PackedVector2Array()
var arbelMultiplicator = 0.0
var arbelGraphGlitchCatch = false

#Values for Charnel stock graph
var charnelUpdateTimer = 0
var charnelXRange = 850
var charnelYRange = 500
var charnelXValue = 0
var charnelCustomPoints = PackedVector2Array()
var charnelMultiplicator = 0.0
var charnelGraphGlitchCatch = false

#Values for Ebkal stock graph
var ebkalUpdateTimer = 0
var ebkalXRange = 850
var ebkalYRange = 500
var ebkalXValue = 0
var ebkalCustomPoints = PackedVector2Array()
var ebkalMultiplicator = 0.0
var ebkalGraphGlitchCatch = false

#Values for Girnn stock graph
var girnnUpdateTimer = 0
var girnnXRange = 850
var girnnYRange = 500
var girnnXValue = 0
var girnnCustomPoints = PackedVector2Array()
var girnnMultiplicator = 0.0
var girnnGraphGlitchCatch = false
