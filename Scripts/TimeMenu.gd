extends CanvasLayer

func _ready():
	$TimePanel.hide()
	$"Loading Panel".hide()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("OpenTimeMenu"):
		$TimePanel.show()
		get_tree().paused = true

func _on_past_pressed():
	loadingScreen()
	if get_tree().has_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen()
		$"..".modulate = Color(1, 0, 0)

func _on_present_pressed():
	if get_tree().has_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen()
		$"..".modulate = Color(0, 1, 0)

func _on_future_pressed():
	if get_tree().has_group("TimeChangeScene"):
		get_tree().paused = false
		loadingScreen()
		$"..".modulate = Color(0, 0, 1)

func loadingScreen():
	$TimeMenu.hide()
	$"Loading Panel".show()
	$"Loading Panel/Control/Animation".play("Default")
	await get_tree().create_timer(2).timeout
	$"Loading Panel/Control/Animation".stop()
	$"Loading Panel".hide()
