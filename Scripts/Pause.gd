extends CanvasLayer

func _ready() -> void:
	self.hide()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Pause"):
		get_tree().paused = true
		self.show()

func _on_resume_pressed():
	get_tree().paused = false
	self.hide()

func _on_restart_pressed():
	get_tree().paused = false
	self.hide()
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().paused = false
	self.hide()
	get_tree().quit()
