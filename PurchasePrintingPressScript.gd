extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	$PrintingPressAmount.text = str(GlobalScript.printingPressAmount)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PrintingPressAmount.text = str(GlobalScript.printingPressAmount)
