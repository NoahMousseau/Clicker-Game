extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	$ConstCashGainLabel.text = "$" + str(GlobalScript.constCashGainDisplayValue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ConstCashGainLabel.text = "+" + str(GlobalScript.constCashGainDisplayValue)
