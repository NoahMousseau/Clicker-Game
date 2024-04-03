extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_stock_market_notification_close_button_mouse_entered():
	$StockMarketNotificationCloseButton/StockMarketNotificationClosePanel.show()

func _on_stock_market_notification_close_button_mouse_exited():
	$StockMarketNotificationCloseButton/StockMarketNotificationClosePanel.hide()
