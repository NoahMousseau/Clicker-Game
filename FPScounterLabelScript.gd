extends Label

#Updates fps counter
func _process(delta: float) -> void:
	set_text("FPS " + str(Engine.get_frames_per_second()))
