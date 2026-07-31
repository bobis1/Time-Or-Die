extends  Area2D

@export var lastSafeArea: Node2D


func _on_body_entered(body: Node2D) -> void:
	var previousHealth = body.get_meta("Health")
	body.set_meta("Health", previousHealth - 1)
	body.global_position = lastSafeArea.global_position
	if body.get_meta("Health") < 0:
		get_tree().change_scene_to_file("res://present.tscn")
	pass
