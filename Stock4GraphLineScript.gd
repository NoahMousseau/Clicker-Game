extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.ebkalCustomPoints.append(Vector2(GlobalScript.ebkalXValue, GlobalScript.ebkalValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var ebkalYAxisLabelString = "%.2f" % GlobalScript.ebkalYRange
	var ebkalXAxisLabelString = "%.2f" % GlobalScript.ebkalXRange
	$EbkalYAxisLabel.text = ebkalYAxisLabelString
	$EbkalXAxisLabel.text = ebkalXAxisLabelString

func _process(delta):
	GlobalScript.ebkalUpdateTimer += delta
	
	#Code to catch graphical glitch on graph
	if (GlobalScript.ebkalGraphGlitchCatch == false):
		if (GlobalScript.ebkalXValue == 10):
			GlobalScript.ebkalXValue = -10
			GlobalScript.ebkalCustomPoints.clear()
			GlobalScript.ebkalGraphGlitchCatch = true
	
	#Forces the graph to update only once per second
	if GlobalScript.ebkalUpdateTimer >= 1.0:
		GlobalScript.ebkalXValue += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.ebkalXValue > GlobalScript.ebkalXRange:
			GlobalScript.ebkalXValue = 0
			GlobalScript.ebkalCustomPoints.clear()
		
		#Increases y-axis label to whatever highest ebkalValue has been
		if GlobalScript.ebkalValue > GlobalScript.ebkalYRange:
			GlobalScript.ebkalMultiplicator += 1.0
			GlobalScript.ebkalYRange = GlobalScript.ebkalYRange * 2
			var ebkalYAxisLabelString = "%.2f" % GlobalScript.ebkalYRange
			$EbkalYAxisLabel.text = ebkalYAxisLabelString
			GlobalScript.ebkalCustomPoints.clear()
			update_line_graph()
			GlobalScript.ebkalXValue = 0
			GlobalScript.ebkalCustomPoints.append(Vector2(GlobalScript.ebkalXValue, -(GlobalScript.ebkalValue / (2 ** GlobalScript.ebkalMultiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.ebkalValue <= GlobalScript.ebkalYRange:
			GlobalScript.ebkalCustomPoints.append(Vector2(GlobalScript.ebkalXValue, -(GlobalScript.ebkalValue / (2 ** GlobalScript.ebkalMultiplicator))))
			update_line_graph()

		GlobalScript.ebkalUpdateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.ebkalCustomPoints)
