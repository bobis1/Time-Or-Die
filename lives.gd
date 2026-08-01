extends HBoxContainer
var liveSprites


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	liveSprites = get_children()
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	if Globals.lives < 3:
		liveSprites[Globals.lives].hide()
	if Globals.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/LevelSelect.tscn")
		