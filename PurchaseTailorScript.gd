extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	$PurchaseTailorAmount.text = str(GlobalScript.tailorAmount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PurchaseTailorAmount.text = str(GlobalScript.tailorAmount)
