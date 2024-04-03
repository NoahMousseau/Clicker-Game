extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	$IncreaseCashLabel.text = "+" + str(GlobalScript.cashMultiplier * 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$IncreaseCashLabel.text = "+" + str(GlobalScript.cashMultiplier * 1)
