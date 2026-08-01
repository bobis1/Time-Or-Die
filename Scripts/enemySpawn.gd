extends StaticBody2D

@export var enemy: PackedScene
@export var exhuasted: Image


func _ready() -> void:
	get_child(0).start()
	pass

func create_instance(add):
	var scene_instance = add.instantiate()
	return scene_instance

func _on_timer_timeout() -> void:
	get_child(0).start()
	var enemyInstance = create_instance(enemy)
	enemyInstance.global_position = global_position
	pass 
