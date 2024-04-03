extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.corvusCustomPoints.append(Vector2(GlobalScript.corvusXValue, GlobalScript.corvusValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var corvusYAxisLabelString = "%.2f" % GlobalScript.corvusYRange
	var corvusXAxisLabelString = "%.2f" % GlobalScript.corvusXRange
	$CorvusYAxisLabel.text = corvusYAxisLabelString
	$CorvusXAxisLabel.text = corvusXAxisLabelString

func _process(delta):
	GlobalScript.corvusUpdateTimer += delta
	
	#Code to catch graphical glitch on graph
	if (GlobalScript.corvusGraphGlitchCatch == false):
		if (GlobalScript.corvusXValue == 10):
			GlobalScript.corvusXValue = -10
			GlobalScript.corvusCustomPoints.clear()
			GlobalScript.corvusGraphGlitchCatch = true
	
	#Forces the graph to update only once per second
	if GlobalScript.corvusUpdateTimer >= 1.0:
		GlobalScript.corvusXValue += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.corvusXValue > GlobalScript.corvusXRange:
			GlobalScript.corvusXValue = 0
			GlobalScript.corvusCustomPoints.clear()
		
		#Increases y-axis label to whatever highest corvusValue has been
		if GlobalScript.corvusValue > GlobalScript.corvusYRange:
			GlobalScript.corvusMultiplicator += 1.0
			GlobalScript.corvusYRange = GlobalScript.corvusYRange * 2
			var corvusYAxisLabelString = "%.2f" % GlobalScript.corvusYRange
			$CorvusYAxisLabel.text = corvusYAxisLabelString
			GlobalScript.corvusCustomPoints.clear()
			update_line_graph()
			GlobalScript.corvusXValue = 0
			GlobalScript.corvusCustomPoints.append(Vector2(GlobalScript.corvusXValue, -(GlobalScript.corvusValue / (2 ** GlobalScript.corvusMultiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.corvusValue <= GlobalScript.corvusYRange:
			GlobalScript.corvusCustomPoints.append(Vector2(GlobalScript.corvusXValue, -(GlobalScript.corvusValue / (2 ** GlobalScript.corvusMultiplicator))))
			update_line_graph()

		GlobalScript.corvusUpdateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.corvusCustomPoints)
