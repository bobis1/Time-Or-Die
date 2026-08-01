extends CanvasLayer

var LevelNode: Node2D

func _ready():
	LevelNode = get_owner()
	$Grayscale.hide()
	$TimePanel.hide()
	$"Loading Panel".hide()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("OpenTimeMenu"):
		$TimePanel.show()
		get_tree().paused = true

func _on_past_pressed():
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen(Color(1, 1, 1))
		Globals.currentTime = "Past"
		$Grayscale.show()
	else:
		get_tree().paused = false
		$Grayscale.hide()
		$TimePanel.hide()

func _on_present_pressed():
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen(Color(1, 1, 1))
		Globals.currentTime = "Present"
		$Grayscale.hide()
	else:
		get_tree().paused = false
		$Grayscale.hide()
		$TimePanel.hide()

func _on_future_pressed():
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		$Grayscale.hide()
		Globals.currentTime = "Future"
		loadingScreen(Color(0.4, 0.4, 0.4))
	else:
		get_tree().paused = false
		$Grayscale.hide()
		$TimePanel.hide()

func loadingScreen(color: Color):
	$TimePanel.hide()
	$"Loading Panel".show()
	$"Loading Panel/Control/Animation".play("Default")
	await get_tree().create_timer(0.15).timeout
	$"Loading Panel/Control/Animation".stop()
	$"Loading Panel".hide()
	LevelNode.modulate = color
