extends HBoxContainer
var liveSprites


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	liveSprites = get_children()
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	if Globals.lives == 2:
		liveSprites[0].hide()
	elif Globals.lives == 1:
		liveSprites[1].hide()
	elif  Globals.lives == 0:
		liveSprites[2].hide()
	else:
		get_tree().change_scene_to_file("res://Scenes/Levels/Level-1.tscn")
		