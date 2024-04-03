extends Line2D

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	GlobalScript.customPoints.append(Vector2(GlobalScript.xVal, GlobalScript.cashValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var yAxisLabelString = "%.2f" % GlobalScript.yRange
	var xAxisLabelString = "%.2f" % GlobalScript.xRange
	$YAxisLabel.text = yAxisLabelString
	$XAxisLabel.text = xAxisLabelString

func _process(delta):
	GlobalScript.updateTimer += delta

	#Forces the graph to update only once per second
	if GlobalScript.updateTimer >= 1.0:
		GlobalScript.xVal += 10
		#Clears graph if x-axis value (time) exceeds 500
		if GlobalScript.xVal > GlobalScript.xRange:
			GlobalScript.xVal = 0
			GlobalScript.customPoints.clear()
		
		#Increases y-axis label to whatever highest cashValue has been
		if GlobalScript.cashValue > GlobalScript.yRange:
			GlobalScript.multiplicator += 1.0
			GlobalScript.yRange = GlobalScript.yRange * 2
			var yAxisLabelString = "%.2f" % GlobalScript.yRange
			$YAxisLabel.text = yAxisLabelString
			GlobalScript.customPoints.clear()
			update_line_graph()
			GlobalScript.xVal = 0
			GlobalScript.customPoints.append(Vector2(GlobalScript.xVal, -(GlobalScript.cashValue / (2 ** GlobalScript.multiplicator))))
			update_line_graph()
		#Normal update process for graph, main process except for when cashValue exceeds y-axis label
		else: if GlobalScript.cashValue <= GlobalScript.yRange:
			GlobalScript.customPoints.append(Vector2(GlobalScript.xVal, -(GlobalScript.cashValue / (2 ** GlobalScript.multiplicator))))
			update_line_graph()

		GlobalScript.updateTimer = 0

func update_line_graph():
	self.set_points(GlobalScript.customPoints)
