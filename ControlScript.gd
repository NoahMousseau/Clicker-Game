extends Control

#Moves view to Game scene
func _on_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
