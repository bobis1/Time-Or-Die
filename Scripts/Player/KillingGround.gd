extends  Area2D

@export var lastSafeArea: Node2D


func _on_body_entered(body: Node2D) -> void:
	Globals.lives -= 1
	body.global_position = lastSafeArea.global_position
	if Globals.lives < 0:
		get_tree().change_scene_to_file("res://present.tscn")
	pass
