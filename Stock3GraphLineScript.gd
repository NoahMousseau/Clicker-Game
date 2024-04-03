extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.charnelCustomPoints.append(Vector2(GlobalScript.charnelXValue, GlobalScript.charnelValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var charnelYAxisLabelString = "%.2f" % GlobalScript.charnelYRange
	var charnelXAxisLabelString = "%.2f" % GlobalScript.charnelXRange
	$CharnelYAxisLabel.text = charnelYAxisLabelString
	$CharnelXAxisLabel.text = charnelXAxisLabelString

func _process(delta):
	GlobalScript.charnelUpdateTimer += delta
	
	#Code to catch graphical glitch on graph
	if (GlobalScript.charnelGraphGlitchCatch == false):
		if (GlobalScript.charnelXValue == 10):
			GlobalScript.charnelXValue = -10
			GlobalScript.charnelCustomPoints.clear()
			GlobalScript.charnelGraphGlitchCatch = true
	
	#Forces the graph to update only once per second
	if GlobalScript.charnelUpdateTimer >= 1.0:
		GlobalScript.charnelXValue += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.charnelXValue > GlobalScript.charnelXRange:
			GlobalScript.charnelXValue = 0
			GlobalScript.charnelCustomPoints.clear()
		
		#Increases y-axis label to whatever highest charnelValue has been
		if GlobalScript.charnelValue > GlobalScript.charnelYRange:
			GlobalScript.charnelMultiplicator += 1.0
			GlobalScript.charnelYRange = GlobalScript.charnelYRange * 2
			var charnelYAxisLabelString = "%.2f" % GlobalScript.charnelYRange
			$CharnelYAxisLabel.text = charnelYAxisLabelString
			GlobalScript.charnelCustomPoints.clear()
			update_line_graph()
			GlobalScript.charnelXValue = 0
			GlobalScript.charnelCustomPoints.append(Vector2(GlobalScript.charnelXValue, -(GlobalScript.charnelValue / (2 ** GlobalScript.charnelMultiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.charnelValue <= GlobalScript.charnelYRange:
			GlobalScript.charnelCustomPoints.append(Vector2(GlobalScript.charnelXValue, -(GlobalScript.charnelValue / (2 ** GlobalScript.charnelMultiplicator))))
			update_line_graph()

		GlobalScript.charnelUpdateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.charnelCustomPoints)
