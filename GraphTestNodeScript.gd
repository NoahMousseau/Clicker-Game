extends Node2D

func _draw():
	#In draw_line, for this program at least:
	#Vector2(+,-) = up and to the right
	#Vector2(+,+) = down and to the right
	
	#Draws a white line to serve as x-axis
	draw_line(Vector2.ZERO, Vector2(GlobalScript.xRange, 0.0), Color.GHOST_WHITE, 2.0)
	#Draws a white line to serve as x-axis
	draw_line(Vector2.ZERO, Vector2(0.0, -GlobalScript.yRange), Color.GHOST_WHITE, 2.0)

func _on_graph_tooltip_mouse_entered():
	$GraphTooltipPanel.show()

func _on_graph_tooltip_mouse_exited():
	$GraphTooltipPanel.hide()
