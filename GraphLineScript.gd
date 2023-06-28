extends Line2D

var xVal = 0
var customPoints = PackedVector2Array()
var updateTimer = 0

func _ready():
	#Setup for graph
	self.default_color = Color(1, 0, 0)
	self.width = 2
	customPoints.append(Vector2(xVal, GlobalScript.cashValue))
	update_line_graph()
	set_process(true)
	#Setup for labels
	var yAxisLabelString = "%.2f" % GlobalScript.yRange
	var xAxisLabelString = "%.2f" % GlobalScript.xRange
	$YAxisLabel.text = yAxisLabelString
	$XAxisLabel.text = xAxisLabelString

func _process(delta):
	updateTimer += delta

	#Forces the graph to update only once per second
	if updateTimer >= 1.0:
		xVal += 10
		#Clears graph if x-axis value (time) exceeds 500
		if xVal > GlobalScript.xRange:
			xVal = 0
			customPoints.clear()
		
		#Increases y-axis label to whatever highest cashValue has been
		if GlobalScript.cashValue > GlobalScript.yRange:
			GlobalScript.yRange = GlobalScript.cashValue
			var yAxisLabelString = "%.2f" % GlobalScript.yRange
			$YAxisLabel.text = yAxisLabelString
			customPoints.append(Vector2(xVal, -(GlobalScript.cashValue)))
			update_line_graph()
		else: if GlobalScript.cashValue <= GlobalScript.yRange:
			customPoints.append(Vector2(xVal, -(GlobalScript.cashValue)))
			update_line_graph()

		updateTimer = 0

func update_line_graph():
	self.set_points(customPoints)
