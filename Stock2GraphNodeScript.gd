extends Node2D

func _draw():
	#Draws a white line to serve as x-axis
	draw_line(Vector2.ZERO, Vector2(GlobalScript.arbelXRange, 0.0), Color.GHOST_WHITE, 2.0)
	#Draws a white line to serve as y-axis
	draw_line(Vector2.ZERO, Vector2(0.0, -GlobalScript.arbelYRange), Color.GHOST_WHITE, 2.0)
