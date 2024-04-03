extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.arbelCustomPoints.append(Vector2(GlobalScript.arbelXValue, GlobalScript.arbelValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var arbelYAxisLabelString = "%.2f" % GlobalScript.arbelYRange
	var arbelXAxisLabelString = "%.2f" % GlobalScript.arbelXRange
	$ArbelYAxisLabel.text = arbelYAxisLabelString
	$ArbelXAxisLabel.text = arbelXAxisLabelString

func _process(delta):
	GlobalScript.arbelUpdateTimer += delta
	
	#Code to catch graphical glitch on graph
	if (GlobalScript.arbelGraphGlitchCatch == false):
		if (GlobalScript.arbelXValue == 10):
			GlobalScript.arbelXValue = -10
			GlobalScript.arbelCustomPoints.clear()
			GlobalScript.arbelGraphGlitchCatch = true
	
	#Forces the graph to update only once per second
	if GlobalScript.arbelUpdateTimer >= 1.0:
		GlobalScript.arbelXValue += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.arbelXValue > GlobalScript.arbelXRange:
			GlobalScript.arbelXValue = 0
			GlobalScript.arbelCustomPoints.clear()
		
		#Increases y-axis label to whatever highest arbelValue has been
		if GlobalScript.arbelValue > GlobalScript.arbelYRange:
			GlobalScript.arbelMultiplicator += 1.0
			GlobalScript.arbelYRange = GlobalScript.arbelYRange * 2
			var arbelYAxisLabelString = "%.2f" % GlobalScript.arbelYRange
			$ArbelYAxisLabel.text = arbelYAxisLabelString
			GlobalScript.arbelCustomPoints.clear()
			update_line_graph()
			GlobalScript.arbelXValue = 0
			GlobalScript.arbelCustomPoints.append(Vector2(GlobalScript.arbelXValue, -(GlobalScript.arbelValue / (2 ** GlobalScript.arbelMultiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.arbelValue <= GlobalScript.arbelYRange:
			GlobalScript.arbelCustomPoints.append(Vector2(GlobalScript.arbelXValue, -(GlobalScript.arbelValue / (2 ** GlobalScript.arbelMultiplicator))))
			update_line_graph()

		GlobalScript.arbelUpdateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.arbelCustomPoints)
