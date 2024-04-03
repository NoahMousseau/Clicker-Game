extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.girnnCustomPoints.append(Vector2(GlobalScript.girnnXValue, GlobalScript.girnnValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var girnnYAxisLabelString = "%.2f" % GlobalScript.girnnYRange
	var girnnXAxisLabelString = "%.2f" % GlobalScript.girnnXRange
	$GirnnYAxisLabel.text = girnnYAxisLabelString
	$GirnnXAxisLabel.text = girnnXAxisLabelString

func _process(delta):
	GlobalScript.girnnUpdateTimer += delta
	
	#Code to catch graphical glitch on graph
	if (GlobalScript.girnnGraphGlitchCatch == false):
		if (GlobalScript.girnnXValue == 10):
			GlobalScript.girnnXValue = -10
			GlobalScript.girnnCustomPoints.clear()
			GlobalScript.girnnGraphGlitchCatch = true
	
	#Forces the graph to update only once per second
	if GlobalScript.girnnUpdateTimer >= 1.0:
		GlobalScript.girnnXValue += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.girnnXValue > GlobalScript.girnnXRange:
			GlobalScript.girnnXValue = 0
			GlobalScript.girnnCustomPoints.clear()
		
		#Increases y-axis label to whatever highest girnnValue has been
		if GlobalScript.girnnValue > GlobalScript.girnnYRange:
			GlobalScript.girnnMultiplicator += 1.0
			GlobalScript.girnnYRange = GlobalScript.girnnYRange * 2
			var girnnYAxisLabelString = "%.2f" % GlobalScript.girnnYRange
			$GirnnYAxisLabel.text = girnnYAxisLabelString
			GlobalScript.girnnCustomPoints.clear()
			update_line_graph()
			GlobalScript.girnnXValue = 0
			GlobalScript.girnnCustomPoints.append(Vector2(GlobalScript.girnnXValue, -(GlobalScript.girnnValue / (2 ** GlobalScript.girnnMultiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.girnnValue <= GlobalScript.girnnYRange:
			GlobalScript.girnnCustomPoints.append(Vector2(GlobalScript.girnnXValue, -(GlobalScript.girnnValue / (2 ** GlobalScript.girnnMultiplicator))))
			update_line_graph()

		GlobalScript.girnnUpdateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.girnnCustomPoints)
