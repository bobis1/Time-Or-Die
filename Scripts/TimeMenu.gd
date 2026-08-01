extends CanvasLayer

var LevelNode: Node2D 

@export var PastColorRect: CanvasLayer

func _ready():
	LevelNode = get_owner()
	$TimePanel.hide()
	$"Loading Panel".hide()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("OpenTimeMenu"):
		$TimePanel.show()
		get_tree().paused = true

func _on_past_pressed():
<<<<<<< Updated upstream
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen(Color(1, 0, 0))
	else:
		get_tree().paused = false
		$TimePanel.hide()

func _on_present_pressed():
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen(Color(0, 1, 0))
	else:
		get_tree().paused = false
		$TimePanel.hide()

func _on_future_pressed():
	if LevelNode.is_in_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen(Color(0, 0, 1))
	else:
		get_tree().paused = false
		$TimePanel.hide()

func loadingScreen(color: Color):
	$TimePanel.hide()
	$"Loading Panel".show()
	$"Loading Panel/Control/Animation".play("Default")
	await get_tree().create_timer(2).timeout
	$"Loading Panel/Control/Animation".stop()
	$"Loading Panel".hide()
	LevelNode.modulate = color
=======
	loadingScreen()
#	if get_tree().has_group("TimeChangeScene"):
	PastColorRect.visible = true
	Globals.currentTime = "Past"
	get_tree().paused = false
	loadingScreen()

func _on_present_pressed():
	PastColorRect.visible = false
	Globals.currentTime = "Present"
#	if get_tree().has_group("TimeChangeScene"):
	get_tree().paused = false
	loadingScreen()
	ParentNode.modulate = Color(1, 1, 1)

func _on_future_pressed():
	PastColorRect.visible = false
	Globals.currentTime = "Future"
#	if get_tree().has_group("TimeChangeScene"):
	get_tree().paused = false
	loadingScreen()
	ParentNode.modulate = Color(0, 0, 1)

func loadingScreen():
	get_child(0).hide()
	get_child(1).show()
	get_child(1).get_child(0).get_child(0).play("Default")
	await get_tree().create_timer(2).timeout
	get_child(1).get_child(0).get_child(0).stop()
	get_tree().paused = false
	get_child(1).hide()
>>>>>>> Stashed changes
